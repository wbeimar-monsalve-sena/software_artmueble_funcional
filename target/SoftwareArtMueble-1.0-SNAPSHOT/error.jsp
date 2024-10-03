<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error de Inicio de Sesión</title>
    <style>
        /* Estilos para el cuerpo de la página */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            background-color: #87CEEB; /* Fondo azul celeste */
        }

        /* Estilos para el fondo con el logo */
        .background-logo {
            background-image: none; /* Eliminado el fondo de la imagen */
        }

        /* Estilos para el contenedor principal de contenido */
        .content {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 100px;
        }

        /* Estilos para el contenedor general */
        .container {
            width: 80%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 30px;
            box-sizing: border-box;
            background-color: rgba(15, 64, 245, 1); /* Color de fondo azul */
            margin: 10px 0;
            border-radius: 10px;
        }

        /* Espaciador de 10px de altura */
        .spacer {
            height: 10px;
        }

        /* Estilos para el primer contenedor (barra superior) */
        #container1 {
            width: 100%;
            height: 100px;
            background-color: rgba(15, 64, 245, 1);
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            top: 0;
            left: 0;
            padding: 0 20px;
            box-sizing: border-box;
        }

        /* Estilos para el título dentro del primer contenedor */
        #container1 h1 {
            color: white;
            font-weight: bold;
            margin: 0 auto;
            text-align: center;
            flex-grow: 1;
        }

        /* Estilos para la imagen dentro del primer contenedor */
        #container1 img {
            height: 80px;
            margin-left: auto;
        }

        /* Estilos para el segundo contenedor (mensaje de error) */
        #container2 {
            background-color: rgba(15, 64, 245, 1); /* Color de fondo azul */
            color: white;
            padding: 10px;
            border-radius: 10px;
            text-align: center;
            width: 60%; /* Ancho del 60% del contenedor principal */
            font-weight: bold;
        }

        /* Estilos para el tercer contenedor (formulario de reintento) */
        #container3 {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: transparent;
            width: 60%; /* Ancho del 60% del contenedor principal */
            color: white;
            font-weight: bold;
        }

        /* Estilos para las etiquetas dentro del tercer contenedor */
        #container3 label {
            display: block;
            margin: 5px 0;
            color: white;
        }

        /* Estilos para los campos de entrada dentro del tercer contenedor */
        #container3 input[type="text"],
        #container3 input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px auto 15px auto;
            border: 1px solid rgba(255, 255, 255, 1);
            border-radius: 5px;
            box-sizing: border-box;
            font-weight: bold;
        }

        /* Estilos para los botones centrados */
        .centered-button {
            width: 100%;
            color: white;
            font-weight: bold;
            background-color: rgba(0, 199, 255, 1); /* Color de fondo azul claro */
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: transform 0.3s ease;
            margin: 10px auto;
            text-align: center;
            text-decoration: none;
            box-sizing: border-box;
        }

        /* Estilos para el efecto de hover del botón centrado */
        .centered-button:hover {
            transform: translateY(-5px);
        }
    </style>
</head>

<body>
    <div class="background-logo"></div> <!-- Fondo con imagen de la empresa -->
    <div class="content"> <!-- Contenedor principal de contenido -->
        <div id="container1"> <!-- Contenedor para la barra superior con logo y título -->
            <img src="imagenes/logo-Art.jpg" alt="" /> <!-- Imagen del logo -->
            <h1>ArtMueble</h1> <!-- Título -->
        </div>

        <div class="spacer"></div> <!-- Espaciador entre contenedores -->

        <div id="container2"> <!-- Contenedor para el mensaje de error -->
            <h2>Error ingreso de usuarios</h2> <!-- Título de error -->
            <p>Usuario o clave incorrectos. Por favor, intente de nuevo.</p>
        </div>

        <div class="spacer"></div> <!-- Espaciador entre contenedores -->

        <div id="container3"> <!-- Contenedor para los botones de reintento -->
            <a href="inicio_sesion.jsp" class="centered-button">Volver a Usuarios</a>
            <a href="registro_usuario.jsp" class="centered-button">Registro de Usuario</a>
        </div>
    </div>
</body>
</html>
