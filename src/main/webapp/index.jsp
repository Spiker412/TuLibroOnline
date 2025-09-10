<%-- 
    Document   : index
    Created on : 9 set. 2025, 7:46:36 a. m.
    Author     : JEFFER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>TuLibroOnline</title>

    <!-- Fuente -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS desde CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> 

    <!-- CSS propio -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  </head>
  <body>
    
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
      <div class="container">
        <a class="navbar-brand" href="#">
          <img src="<%=request.getContextPath()%>/img/logo-test.png" alt="Logo" width="40" class="me-2"> TuLibroOnline
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto align-items-center">
            <li class="nav-item me-3">
              <a class="nav-link active" href="#"><i class="bi bi-house-door-fill me-1"></i> Inicio</a>
            </li>
            <li class="nav-item me-3">
              <a class="nav-link" href="#"><i class="bi bi-shop me-1"></i> Tienda</a>
            </li>
            <li class="nav-item me-3">
              <a class="nav-link" href="#"><i class="bi bi-tag-fill me-1"></i> Ofertas</a>
            </li>
            <li class="nav-item me-3">
              <a class="nav-link" href="#"><i class="bi bi-envelope-fill me-1"></i> Contacto</a>
            </li>

            <!-- Botones de inicio de sesión y registro -->
<li class="nav-item">
  <a class="btn btn-outline-light me-2 d-flex align-items-center" href="<%=request.getContextPath()%>/usuario?action=login">
    <i class="bi bi-person me-1"></i>
     Iniciar Sesión
  </a>
</li>
          </ul>
        </div>
      </div>
    </nav>
    
    <!-- Carrusel -->
    <section id="heroCarousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="<%=request.getContextPath()%>/img/slide1.jpg" class="d-block w-100" alt="Banner 1">
        </div>
        <div class="carousel-item">
          <img src="<%=request.getContextPath()%>/img/slide2.jpg" class="d-block w-100" alt="Banner 2">
        </div>
        <div class="carousel-item">
          <img src="<%=request.getContextPath()%>/img/slide1.jpg" class="d-block w-100" alt="Banner 3">
        </div>
      </div>

      <!-- Controles -->
      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      </a>
      <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
      </a>
    </section>

    <!-- Productos Destacados -->
    <main class="products">
      <div class="container">
        <h2>Productos Destacados</h2>
        <div class="product-grid">
          <div class="product-card">
            <img src="<%=request.getContextPath()%>/img/libro1.png" alt="Producto 1">
            <h3>Libro 1</h3>
            <p>S/20.50</p>
            <button class="btn btn-success">Añadir al carrito</button>
          </div>
          <div class="product-card">
            <img src="<%=request.getContextPath()%>/img/libro1.png" alt="Producto 2">
            <h3>Libro 2</h3>
            <p>S/1.80</p>
            <button class="btn btn-success">Añadir al carrito</button>
          </div>
          <div class="product-card">
            <img src="<%=request.getContextPath()%>/img/libro1.png" alt="Producto 3">
            <h3>Libro 3</h3>
            <p>S/3.50</p>
            <button class="btn btn-success">Añadir al carrito</button>
          </div>
          <div class="product-card">
            <img src="<%=request.getContextPath()%>/img/libro1.png" alt="Producto 4">
            <h3>Libro 4</h3>
            <p>S/4.20</p>
            <button class="btn btn-success">Añadir al carrito</button>
          </div>
        </div>
      </div>
    </main>

    <!-- Footer -->
    <footer class="footer">
      <div class="container text-center">
        <div class="footer-logo">
          <h3>TuLibroOnline</h3>
          <p>Encuentra los mejores libros y haz tus pedidos de manera rápida y segura.</p>
        </div>
        <div class="social-icons">
          <a href="#" class="me-3"><i class="bi bi-facebook"></i></a>
          <a href="#" class="me-3"><i class="bi bi-twitter"></i></a>
          <a href="#" class="me-3"><i class="bi bi-instagram"></i></a>
          <a href="#"><i class="bi bi-youtube"></i></a>
        </div>
        <div class="footer-bottom mt-3">
          <p>&copy; 2025 TuLibroOnline. Todos los derechos reservados.</p>
        </div>
      </div>
    </footer>

    <!-- JS desde CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JS propio -->
    <script src="<%=request.getContextPath()%>/js/carousel.js"></script>

  </body>
</html>

