<%-- 
    Document   : bienvenida
    Created on : 18/07/2024, 2:19:58 p. m.
    Author     : Wbeimar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenida ArtMueble</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .background-logo {
            background-image: url(imagenes/logo-ArtMueble-1.jpeg);
            background-size: cover;
            background-position: center;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            opacity: 0.9;
        }

        .content {
            z-index: 1;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .container1 {
            background-color: rgba(15, 64, 245, 0.8);
            width: 100%;
            height: 125px;
            text-align: center;
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container1 p {
            padding: 20px;
            color: rgba(255, 255, 255, 1);
        }

        .container1 .inner-container {
            text-align: center;
            color: rgba(255, 255, 255, 1);
        }

        .container2 {
            background-color: rgba(0, 199, 255, 0.8);
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            position: relative;
            height: 125px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            font-size: 18px;
        }

        .container3 {
            background-color: rgba(15, 64, 245, 0.8);
            color: rgba(0, 199, 255, 1);
            padding: 10px 20px;
            cursor: pointer;
            position: relative;
            height: 125px;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
        }

        .container3 button {
            background-color: rgba(0, 199, 255, 1);
            color: rgba(255, 255, 255, 1);
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            width: 200px;
            height: 50px;
        }

        /* Estilo para el mensaje de éxito */
        .success-message {
            background-color: #28a745;
            color: white;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 18px;
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="background-logo"></div>

    <div class="content">
        <div class="container1">
            <div class="inner-container">
                <h1>Bienvenidos a ArtMueble</h1>
            </div>
        </div>

        <!-- Verificar si hay un mensaje de éxito y mostrarlo -->
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
        %>
        <div class="success-message">
            <%= mensaje %>
        </div>
        <%
            }
        %>

        <div class="container2">
            <p>Nuestra herramienta integral amplifica la gestión de fabricación y restauración de muebles. Optimiza procesos, aumenta la productividad y ofrece un servicio de calidad. ArtMueble se adapta a tus necesidades. Explora nuestras funciones y lleva
                tu negocio al siguiente nivel. ¡Gracias por elegirnos!</p>
        </div>

        <div class="container3">
            <form action="artmueble.jsp" method="get">
                <button type="submit">ArtMueble</button>  
            </form>
        </div>
    </div>
</body>

</html>
