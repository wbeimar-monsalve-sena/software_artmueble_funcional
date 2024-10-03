<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ArtMueble</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste para el fondo */
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

        .search-container {
            text-align: center;
            margin: 20px 0; /* Espacio arriba y abajo */
        }

        input[type="text"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 250px; /* Ancho del input */
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .spacer {
            height: 50px;
        }

        .button-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* Tres columnas de igual tamaño */
            gap: 10px; /* Espacio entre botones */
            justify-content: center;
            padding: 20px;
        }

        .button-link {
            background-color: rgb(47, 0, 255); /* Azul */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px; /* Tamaño del botón */
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .button-link:hover {
            background-color: #03fa03;
        }

    </style>
</head>

<body>
    <div class="container" id="container1">
        <img src="imagenes/logo-Art.jpg" alt=""/>
        <h1>ArtMueble</h1>
    </div>

   

    <div class="spacer"></div>

    <div class="button-container">
        <a href="usuarios.jsp" class="button-link">Usuarios</a>
        <a href="contacto.jsp" class="button-link">Contacto</a>
        <a href="nosotros.jsp" class="button-link">Nosotros</a>
        <a href="clientes.jsp" class="button-link">Clientes</a>
        <a href="productos.jsp" class="button-link">Productos</a>
        <a href="registro_ventas.jsp" class="button-link">Ventas</a>
        <a href="registro_proyectos.jsp" class="button-link">Proyectos</a>
        <a href="inventario.jsp" class="button-link">Inventario</a>
        <a href="finanzas.jsp" class="button-link">Finanzas</a>
        <a href="reportes.jsp" class="button-link">Reportes</a>
    </div>

</body>

</html>
