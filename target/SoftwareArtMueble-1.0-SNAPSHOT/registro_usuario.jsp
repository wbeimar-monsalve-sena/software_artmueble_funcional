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
            padding: 30px; /* Ajustado para reducir el padding */
            border-radius: 10px;
            width: 350px; /* Ancho reducido para un formulario más pequeño */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        h1 {
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px; /* Tamaño de fuente ligeramente reducido */
            margin: 20px 0; /* Espaciado ajustado */
        }
        img.logo {
            margin-right: 10px;
            height: 50px; /* Ajuste del tamaño de la imagen para coincidir con el h1 */
            width: auto; /* Mantiene la proporción de la imagen */
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 8px; /* Margen reducido */
            font-weight: bold;
            font-size: 14px; /* Tamaño de fuente reducido */
            align-self: flex-start; /* Alinea las etiquetas a la izquierda */
            width: 100%; /* Ancho completo para que coincida con el botón */
        }
        input[type="text"],
        input[type="password"],
        input[type="email"] {
            margin-bottom: 12px; /* Margen reducido entre los campos */
            padding: 10px; /* Padding ajustado para reducir el tamaño del campo */
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px; /* Tamaño de fuente reducido */
            width: 100%;
            box-sizing: border-box; /* Asegura que el padding no sobrepase el ancho */
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px; /* Padding reducido */
            border-radius: 5px;
            font-size: 14px; /* Tamaño de fuente reducido */
            cursor: pointer;
            width: 100%; /* Ancho completo */
            box-sizing: border-box; /* Asegura que el padding no sobrepase el ancho */
            font-weight: bold; /* Letras en negrita */
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
    </style>
</head>
<body>
    <div class="container">
        <h1>
            <img src="imagenes/logo-Art.jpg" alt="Logo" class="logo"> Registro de Usuario
        </h1>
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

