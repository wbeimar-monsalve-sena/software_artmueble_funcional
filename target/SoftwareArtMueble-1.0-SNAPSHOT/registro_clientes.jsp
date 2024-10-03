<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Clientes</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste para el fondo */
            font-family: Arial, sans-serif;
        }

        #container1 {
            width: 100%;
            height: 110px;
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro para el contenedor superior */
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            box-sizing: border-box;
        }

        #container1 h1 {
            color: aliceblue;
            font-weight: bold;
            margin: 0 10px;
        }

        #container1 img {
            height: 90%;
            position: absolute;
            right: 20px;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            position: relative;
        }

        form {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 100%;
            max-width: 600px;
        }

        label {
            font-weight: bold;
            margin: 10px 0 5px;
            display: block;
        }

        input[type="text"],
        input[type="email"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            margin-bottom: 15px; /* Espacio entre campos */
        }

        button {
            background-color: rgb(47, 0, 255); /* Azul */
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            width: 100%;
            box-sizing: border-box;
        }

        button:hover {
            background-color: #03fa03; /* Verde claro en hover */
        }

        .button-link-small {
            background-color: #28a745; /* Verde */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px; /* Tamaño del botón pequeño */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: block; /* Hace que el botón se comporte como un bloque */
            text-align: center;
            margin-top: 20px; /* Espacio superior */
        }

        .button-link-small:hover {
            background-color: #218838; /* Verde más oscuro en hover */
        }

        .button-container {
            display: flex;
            justify-content: center; /* Centrar horizontalmente */
            align-items: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div id="container1">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Registro de Clientes</h1>
    </div>

    <div class="spacer"></div>

    <div class="form-container">
        <form action="RegistroClienteServlet" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono">
            
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion">
            
            <button type="submit">Registrar Cliente</button>
        </form>

        <div class="button-container">
            <a href="clientes.jsp" class="button-link-small">Volver a Clientes</a>
        </div>
    </div>
</body>
</html>