<%-- 
    Document   : register
    Created on : 9 set. 2025, 7:32:38 a. m.
    Author     : JEFFER
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Registro de Usuario</title>

    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        .form-register {
            width: 100%;
            max-width: 400px;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
        }
        .form-register button {
            width: 100%;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="form-register">
    <h2 class="text-center mb-4">Registro de Usuario</h2>

    <!-- Mensaje de error -->
    <div class="error">
        <% String error = (String) request.getAttribute("error");
           if(error != null) { out.print(error); } %>
    </div>

    <form action="usuario" method="post">
        <input type="hidden" name="action" value="register" />

        <div class="form-group">
            <input type="text" class="form-control" name="nombre" placeholder="Nombre" required>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="apellido" placeholder="Apellido" required>
        </div>
        <div class="form-group">
            <input type="email" class="form-control" name="email" placeholder="Email" required>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Contraseña" required>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="telefono" placeholder="Teléfono">
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="direccion" placeholder="Dirección">
        </div>

        <button type="submit" class="btn btn-primary btn-block">Registrar</button>
    </form>

    <div class="text-center mt-3">
        <p>¿Ya tienes cuenta? <a href="usuario?action=index">Iniciar Sesión</a></p>
    </div>
</div>

<!-- Bootstrap JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
