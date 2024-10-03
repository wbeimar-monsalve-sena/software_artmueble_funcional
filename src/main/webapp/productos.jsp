<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Módulo de Productos</title>
    <style>
        /* Usa estilos coherentes con el resto del proyecto */
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB;
            font-family: Arial, sans-serif;
        }
        #container1 {
            width: 100%;
            height: 110px;
            background-color: rgba(15, 64, 245, 1);
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
            flex-direction: column;
            align-items: center;
            padding: 20px;
            gap: 10px; /* Espacio entre los botones */
            margin-top: 40px; /* Espacio entre el contenedor del h1/logo y los botones */
        }
        .button-link {
            background-color: rgb(47, 0, 255);
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: block;
            text-align: center;
            font-size: 18px;
            width: 100%; /* Asegura que todos los botones tengan el mismo ancho */
            max-width: 300px; /* Máximo ancho de los botones */
        }
        .button-link:hover {
            background-color: #03fa03;
        }
        .button-link-green {
            background-color: #28a745; /* Color verde específico */
            color: white;
        }
        .button-link-green:hover {
            background-color: #218838; /* Color verde oscuro al pasar el ratón */
        }
    </style>
</head>
<body>
    <div id="container1">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Módulo de Productos</h1>
    </div>
    <div class="button-container">
        <a href="registro_productos.jsp" class="button-link">Registro de Productos</a>
        <a href="actualizacion_productos.jsp" class="button-link">Actualización de Productos</a>
        <a href="eliminacion_producto.jsp" class="button-link">Eliminación de Productos</a>
        <a href="artmueble.jsp" class="button-link button-link-green">ArtMueble</a>
    </div>
</body>
</html>
