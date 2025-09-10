package utp.edu.pe.controller;

import utp.edu.pe.dao.UsuarioDao;
import utp.edu.pe.daoimpl.UsuarioDaoImpl;
import utp.edu.pe.model.Usuario;
import utp.edu.pe.util.SeguridadUtil;
import utp.edu.pe.util.Validaciones;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet("/usuario")
public class UsuarioController extends HttpServlet {

    private UsuarioDao usuarioDao = new UsuarioDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "login";

        switch(action) {
            case "login":
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case "register":
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect("usuario?action=login");
                break;
            default:
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("register".equals(action)) {
            registrar(request, response);
        } else if ("login".equals(action)) {
            login(request, response);
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validaciones
        if (!Validaciones.emailValido(email)) {
            request.setAttribute("error", "Email no válido");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (!Validaciones.passwordValida(password)) {
            request.setAttribute("error", "La contraseña debe tener al menos 6 caracteres");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        if (usuarioDao.existeEmail(email)) {
            request.setAttribute("error", "El email ya está registrado");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        Usuario u = new Usuario();
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);
        u.setPassword(SeguridadUtil.encriptar(password)); 
        u.setTipo("ADMIN");
        u.setActivo(true);

        if (usuarioDao.registrar(u)) {
            response.sendRedirect("usuario?action=login");
        } else {
            request.setAttribute("error", "Error al registrar");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Buscar usuario con contraseña encriptada
        Usuario u = usuarioDao.login(email, SeguridadUtil.encriptar(password));
        if (u != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", u);
            response.sendRedirect("admin/dashboard.jsp");
        } else {
            request.setAttribute("error", "Email o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

