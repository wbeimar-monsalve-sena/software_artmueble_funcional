<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Módulo de Clientes</title>
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

        .button-container {
            display: flex;
            flex-direction: column; /* Botones en una columna */
            align-items: center; /* Centrar los botones horizontalmente */
            padding: 20px;
        }

        .button-link {
            background-color: rgb(47, 0, 255); /* Azul */
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px 30px; /* Tamaño del botón */
            margin: 10px 0; /* Espacio entre botones */
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: block; /* Asegura que los botones se comporten como bloques */
            text-align: center;
            font-size: 18px;
            transition: background-color 0.3s; /* Transición suave del color de fondo */
            width: 250px; /* Ancho fijo para los botones */
            box-sizing: border-box; /* Incluye el padding en el ancho total del botón */
        }

        .button-link:hover {
            background-color: #03fa03; /* Color en hover para botones azules */
        }

        /* Estilo específico para el botón de "Inicio de Sesión" */
        .button-login {
            background-color: #28a745; /* Verde para el botón de inicio de sesión */
        }

        .button-login:hover {
            background-color: #218838; /* Verde oscuro al pasar el mouse */
        }

        .spacer {
            height: 50px;
        }
    </style>
</head>
<body>
    <div id="container1">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Módulo de Clientes</h1>
    </div>

    <div class="spacer"></div>

    <div class="button-container">
        <a href="registro_clientes.jsp" class="button-link">Registro de Clientes</a>
        <a href="gestion_clientes.jsp" class="button-link">Gestión de Clientes</a>
        <a href="artmueble.jsp" class="button-link button-login">ArtMueble</a>
    </div>

</body>
</html>

