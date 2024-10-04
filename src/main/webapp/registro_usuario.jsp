<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #007BFF; /* Fondo azul */
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        .container {
            background-color: #0056b3;
            color: #000;
            padding: 30px;
            border-radius: 10px;
            width: 350px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }
        h1 {
            font-weight: bold;
            font-size: 24px;
            margin: 20px 0;
        }
        img.logo {
            margin-right: 10px;
            height: 50px;
            width: auto;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
            font-size: 14px;
            align-self: flex-start;
            width: 100%;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            margin-bottom: 12px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
            font-weight: bold;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .button-green {
            background-color: #28a745; /* Color verde */
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            width: 100%; /* Ancho completo */
            margin-top: 10px; /* Espacio entre botones */
            box-sizing: border-box; /* Asegura que el padding no sobrepase el ancho */
            font-weight: bold; /* Letras en negrita */
            text-decoration: none; /* Sin subrayado en el texto */
            display: inline-block;
        }
        .button-green:hover {
            background-color: #218838; /* Verde más oscuro en hover */
        }
        .mensaje {
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>
            <img src="imagenes/logo-Art.jpg" alt="Logo" class="logo"> Registro de Usuario
        </h1>

        <!-- Mostrar mensaje de éxito o error -->
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            String mensajeError = (String) request.getAttribute("mensajeError");
            if (mensajeExito != null) {
        %>
            <div class="mensaje" style="color: red;"><%= mensajeExito %></div>
        <%
            } else if (mensajeError != null) {
        %>
            <div class="mensaje" style="color: red;"><%= mensajeError %></div>
        <%
            }
        %>

        <form action="ServletRegistroUsuario" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            
            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido" required>
            
            <label for="nombreUsuario">Nombre de Usuario:</label>
            <input type="text" id="nombreUsuario" name="nombreUsuario" required>
            
            <label for="contrasena">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" required>
            
            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" required>
            
            <input type="submit" value="Registrar">
            <a href="usuarios.jsp" class="button-green">Volver a Usuarios</a>
        </form>
    </div>
</body>
</html>
