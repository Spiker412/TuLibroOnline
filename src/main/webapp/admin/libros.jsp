<%-- 
    Document   : libros
    Created on : 9 set. 2025, 2:31:39 p. m.
    Author     : JEFFER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="utp.edu.pe.model.Libros" %>
<%
    // Obtener usuario de sesión
    utp.edu.pe.model.Usuario usuario = (utp.edu.pe.model.Usuario) session.getAttribute("usuario");
    if(usuario == null){
        response.sendRedirect("usuario?action=login");
        return;
    }
%>
<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TuLibroOnline - Libros</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
</head>
<body>
<!-- Encabezado -->
<div class="header d-flex justify-content-between align-items-center px-3 py-2">
    <div class="logo">
        <img src="<%=request.getContextPath()%>/img/logo-test.png" alt="Logo" height="40"> TuLibroOnline
    </div>
    <div class="header-right d-flex gap-2">
        <span class="btn btn-sm btn-outline-dark d-flex align-items-center">
            <i class="bi bi-person me-1"></i>
            <span><%= usuario.getNombre() %></span>
        </span>
        <a href="<%=request.getContextPath()%>/logout" class="btn btn-sm btn-outline-danger d-flex align-items-center">
            <i class="bi bi-box-arrow-right me-1"></i>
            <span>Cerrar sesión</span>
        </a>
    </div>
</div>

<!-- Barra lateral -->
<nav class="sidebar d-flex flex-column text-dark">
    <a href="<%=request.getContextPath()%>/index.jsp" class="d-flex align-items-center mb-3 mb-md-0 text-dark text-decoration-none">
        <i class="bi bi-house fs-3"></i>
        <span class="fs-4 sidebar-text ms-2">Inicio</span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
        <li><a href="dashboard.jsp" class="nav-link text-dark"><i class="bi bi-speedometer2"></i><span class="sidebar-text ms-2">Dashboard</span></a></li>
        <li>
            <a href="<%=request.getContextPath()%>/admin/libros.jsp" class="nav-link text-dark d-flex align-items-center">
                <i class="bi bi-grid me-2"></i>
                <span class="sidebar-text">Libros</span>
            </a>
        </li>
        <li><a href="ordenes.jsp" class="nav-link text-dark"><i class="bi bi-table"></i><span class="sidebar-text ms-2">Ordenes</span></a></li>
    </ul>
</nav>

<!-- Contenido -->
<div class="content ms-md-5 p-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Libros</h3>
        <button type="button" class="btn btn-success" onclick="abrirModalNuevo()">
            <i class="bi bi-plus-lg"></i> Agregar Nuevo Libro
        </button>
    </div>

    <div class="table-responsive">
        <table class="table table-striped align-middle">
            <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Imagen</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Categoría</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Libros> lista = (List<Libros>) request.getAttribute("libros");
                if(lista != null){
                    for(Libros libro : lista){
            %>
            <tr>
                <td><%= libro.getId() %></td>
                <td>
                    <% if(libro.getImagenUrl() != null && !libro.getImagenUrl().isEmpty()){ %>
                        <img src="<%= request.getContextPath() + "/" + libro.getImagenUrl() %>" width="50" alt="Imagen">
                    <% } %>
                </td>
                <td><%= libro.getTitulo() %></td>
                <td><%= libro.getAutor() %></td>
                <td><%= libro.getPrecio() %></td>
                <td><%= libro.getStock() %></td>
                <td><%= libro.getCategoria() %></td>
                <td>
                    <button class="btn btn-sm btn-warning btn-editar"
                            data-id="<%=libro.getId()%>"
                            data-titulo="<%=libro.getTitulo()%>"
                            data-autor="<%=libro.getAutor()%>"
                            data-precio="<%=libro.getPrecio()%>"
                            data-stock="<%=libro.getStock()%>"
                            data-categoria="<%=libro.getCategoria()%>"
                            data-imagen="<%=libro.getImagenUrl()%>">
                        Editar
                    </button>
                    <a href="<%=request.getContextPath()%>/LibrosController?action=eliminar&id=<%=libro.getId()%>" class="btn btn-sm btn-danger"
                       onclick="return confirm('¿Estás seguro de eliminar este libro?')">Eliminar</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal para nuevo/editar libro -->
<div class="modal fade" id="modalLibro" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="<%=request.getContextPath()%>/LibrosController" method="post" enctype="multipart/form-data">
                <input type="hidden" name="action" id="formAction" value="registrar">
                <input type="hidden" name="id" id="id">
                <div class="modal-header">
                    <h5 class="modal-title" id="tituloModal">Nuevo Libro</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Título</label>
                        <input type="text" class="form-control" name="titulo" id="titulo" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Autor</label>
                        <input type="text" class="form-control" name="autor" id="autor" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Precio</label>
                        <input type="number" step="0.01" class="form-control" name="precio" id="precio" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Stock</label>
                        <input type="number" class="form-control" name="stock" id="stock" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Categoría</label>
                        <input type="text" class="form-control" name="categoria" id="categoria">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Imagen</label>
                        <input type="file" class="form-control" name="imagen" id="fileImagen">
                        <img id="preview" src="" alt="" width="100" class="mt-2 d-none">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const modal = new bootstrap.Modal(document.getElementById('modalLibro'));
    const tituloModal = document.getElementById('tituloModal');
    const form = document.querySelector('#modalLibro form');

    function abrirModalNuevo() {
        tituloModal.textContent = "Nuevo Libro";
        form.reset();
        document.getElementById('id').value = '';
        document.getElementById('formAction').value = 'registrar';
        document.getElementById('preview').classList.add('d-none');
        modal.show();
    }

    document.querySelectorAll('.btn-editar').forEach(button => {
        button.addEventListener('click', () => {
            tituloModal.textContent = "Editar Libro";
            document.getElementById('id').value = button.dataset.id;
            document.getElementById('titulo').value = button.dataset.titulo;
            document.getElementById('autor').value = button.dataset.autor;
            document.getElementById('precio').value = button.dataset.precio;
            document.getElementById('stock').value = button.dataset.stock;
            document.getElementById('categoria').value = button.dataset.categoria;
            document.getElementById('formAction').value = 'actualizar';

            const preview = document.getElementById('preview');
            if (button.dataset.imagen) {
                preview.src = button.dataset.imagen.startsWith("img") ? '/' + button.dataset.imagen : button.dataset.imagen;
                preview.classList.remove('d-none');
            } else {
                preview.classList.add('d-none');
            }

            modal.show();
        });
    });
</script>
</body>
</html>
