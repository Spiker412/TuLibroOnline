<%-- 
    Document   : index
    Created on : 9 set. 2025, 7:31:15 a. m.
    Author     : JEFFER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Iniciar Sesión - Panel Administrativo</title>

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    background-color: #2ecc71; /* Cambiado de #f8f9fa */
}

.form-signin {
    width: 100%;
    max-width: 360px;
    padding: 15px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0,0,0,0.2);
}

.form-signin img {
    margin-bottom: 10px;
}

    </style>
  </head>
  <body class="text-center">
    <form class="form-signin" action="usuario" method="post">
      <!-- Logo personalizado -->
      <img class="mb-4" src="img/logo-test.png" alt="Logo" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">TuLibroOnline</h1>
      <h2 class="h5 mb-3 font-weight-normal">Iniciar Sesión</h2>

      <!-- Mostrar mensaje de error si existe -->
      <div class="text-danger mb-2">
        <% String error = (String) request.getAttribute("error");
           if(error != null) { out.print(error); } %>
      </div>

      <input type="hidden" name="action" value="login"/>
      
      <label for="inputEmail" class="sr-only">Email</label>
      <input type="email" id="inputEmail" name="email" class="form-control mb-2" placeholder="Email" required autofocus>

      <label for="inputPassword" class="sr-only">Contraseña</label>
      <input type="password" id="inputPassword" name="password" class="form-control mb-2" placeholder="Contraseña" required>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" name="remember" value="true"> Recordarme
        </label>
      </div>

      <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesión</button>

      <p class="mt-3 mb-3">
        ¿No tienes cuenta? <a href="usuario?action=register">Registrarse</a>
      </p>
      <p class="mt-5 mb-3 text-muted">&copy; UTP 2025</p>
    </form>

    <!-- Bootstrap JS CDN -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>



