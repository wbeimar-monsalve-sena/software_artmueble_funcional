<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Usuarios</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #007BFF; /* Azul de fondo */
            color: white;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        h1 {
            font-weight: bold;
            display: flex;
            align-items: center;
            margin-top: 50px; /* Espacio superior aumentado */
            margin-bottom: 20px;
        }
        img {
            margin-right: 20px;
            height: 80px; /* Ajusta el tamaño de la imagen según sea necesario */
        }
        .form-container {
            background-color: #0056b3; /* Azul oscuro para el formulario */
            padding: 30px; /* Aumento del padding para hacerlo más grande */
            border-radius: 8px;
            width: 100%;
            max-width: 500px; /* Aumento del ancho máximo */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            margin-top: 30px; /* Espacio superior para el contenedor del formulario */
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input[type="text"], input[type="password"], input[type="submit"], .custom-button {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: none;
            border-radius: 4px;
            box-sizing: border-box;
            text-align: center;
            font-weight: bold; /* Letras en negrita */
        }
        input[type="submit"] {
            background-color: #28a745; /* Verde para el botón de inicio de sesión */
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #218838; /* Verde oscuro en hover */
        }
        .custom-button {
            margin-top: 10px;
        }
        .btn-celeste {
            background-color: #87CEEB; /* Azul celeste */
            color: white;
        }
        .message {
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
        }
        .message.success {
            color: #d4edda; /* Verde claro para mensajes exitosos */
        }
        .message.error {
            color: #f8d7da; /* Rojo claro para mensajes de error */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1><img src="imagenes/logo-Art.jpg" alt="Logo">Usuarios ArtMueble</h1>
        <div class="form-container">
            <form action="ServletUsuarios" method="post">
                <label for="nombreUsuario">Nombre de Usuario:</label>
                <input type="text" id="nombreUsuario" name="nombreUsuario" required><br>
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" required><br>
                <input type="submit" value="Ingresar"><br>
            </form>
        </div>
    </div>
</body>
</html>

