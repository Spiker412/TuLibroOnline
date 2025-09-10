package utp.edu.pe.controller;

import utp.edu.pe.daoimpl.LibrosDaoImpl;
import utp.edu.pe.model.Libros;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/LibrosController")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class LibrosController extends HttpServlet {

    private LibrosDaoImpl dao = new LibrosDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "listar";

        switch (action) {
            case "listar":
                List<Libros> lista = dao.listarTodos();
                request.setAttribute("libros", lista);
                // Asegúrate que libros.jsp esté dentro de /admin
                request.getRequestDispatcher("/admin/libros.jsp").forward(request, response);
                break;
            case "editar":
                long id = Long.parseLong(request.getParameter("id"));
                Libros libro = dao.buscarPorId(id);
                request.setAttribute("libro", libro);
                request.getRequestDispatcher("/admin/editarLibro.jsp").forward(request, response);
                break;
            case "eliminar":
                long idEliminar = Long.parseLong(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect(request.getContextPath() + "/LibrosController?action=listar");
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/LibrosController?action=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("registrar".equals(action) || "actualizar".equals(action)) {
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            BigDecimal precio = new BigDecimal(request.getParameter("precio"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String categoria = request.getParameter("categoria");

            Part filePart = request.getPart("imagen"); // Debe coincidir con name="fileImagen" en el JSP
            String fileName = (filePart != null) ? filePart.getSubmittedFileName() : null;
            String uploadPath = getServletContext().getRealPath("/img/libros");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String filePath = null;
            if (fileName != null && !fileName.isEmpty()) {
                filePath = "img/libros/" + fileName;
                filePart.write(uploadPath + File.separator + fileName);
            }

            Libros libro = new Libros();
            libro.setTitulo(titulo);
            libro.setAutor(autor);
            libro.setPrecio(precio);
            libro.setStock(stock);
            libro.setCategoria(categoria);

            if (filePath != null) libro.setImagenUrl(filePath);

            if ("registrar".equals(action)) {
                dao.registrar(libro);
            } else {
                libro.setId(Long.parseLong(request.getParameter("id")));
                dao.actualizar(libro);
            }

            response.sendRedirect(request.getContextPath() + "/LibrosController?action=listar");
        }
    }
}
