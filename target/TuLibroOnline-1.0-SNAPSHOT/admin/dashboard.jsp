<%-- 
    Document   : dashboard
    Created on : 9 set. 2025, 8:11:26 a. m.
    Author     : JEFFER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
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
  <title>TuLibroOnline - Dashboard</title>

  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <!-- CSS personalizado -->
  <link href="<%=request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
</head>
<body>

  <!-- Encabezado -->
  <div class="header d-flex justify-content-between align-items-center px-3 py-2">
    <!-- Logo -->
    <div class="logo">
      <img src="<%=request.getContextPath()%>/img/logo-test.png" alt="Logo" height="40"> TuLibroOnline
    </div>

    <!-- Botones de usuario -->
    <div class="header-right d-flex gap-2">
      <!-- Nombre de usuario -->
      <span class="btn btn-sm btn-outline-dark d-flex align-items-center">
        <i class="bi bi-person me-1"></i>
        <span><%= usuario.getNombre() %></span>
      </span>

      <!-- Botón Cerrar Sesión -->
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
      <li>
        <a href="dashboard.jsp" class="nav-link text-dark">
          <i class="bi bi-speedometer2"></i>
          <span class="sidebar-text ms-2">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
          
<a href="<%=request.getContextPath()%>/admin/libros.jsp" 
   class="nav-link text-dark d-flex align-items-center">
   <i class="bi bi-grid me-2"></i>
   <span class="sidebar-text">Libros</span>
</a>

      </li>
      <li>
        <a href="ordenes.jsp" class="nav-link text-dark">
          <i class="bi bi-table"></i>
          <span class="sidebar-text ms-2">Ordenes</span>
        </a>
      </li>
    </ul>
  </nav>

  <div class="content ms-md-5 p-4">
    <h3 class="mb-4 text-center">Dashboard</h3>
    <div class="row g-3">
      <div class="col-6 col-md-3">
        <div class="card text-center p-3">
          <i class="bi bi-person-fill display-4 mb-2"></i>
          <h4>2</h4>
          <small>Administradores</small>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="card text-center p-3">
          <i class="bi bi-people-fill display-4 mb-2"></i>
          <h4>71</h4>
          <small>Clientes</small>
        </div>
      </div>
      <!-- Puedes añadir más tarjetas dinámicamente -->
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
