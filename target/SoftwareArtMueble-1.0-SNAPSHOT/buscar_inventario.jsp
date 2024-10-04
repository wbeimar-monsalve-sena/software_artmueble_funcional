<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %> <!-- Importa la clase List aquí -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Inventario</title>
    <style>
        /* Estilos proporcionados */
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste para el fondo */
            font-family: Arial, sans-serif;
        }

        .header-container {
            width: 100%;
            height: 130px;
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro para el encabezado */
            display: flex;
            align-items: center;
            padding: 0 20px;
            box-sizing: border-box;
            color: white;
            position: relative;
            margin-bottom: 40px; /* Espacio entre el encabezado y el contenedor de contenido */
        }

        .header-container img {
            height: 80px;
            margin-right: 20px;
        }

        .header-container h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
            text-align: center; /* Centra el texto dentro del h1 */
            flex: 1; /* Permite que el h1 ocupe el espacio disponible y lo centre */
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 50%;
            max-width: 800px;
            margin: 0 auto; /* Alinea el contenedor de contenido en el centro de la página */
        }

        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        form label {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 16px;
        }

        form input[type="text"],
        form button {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        form button {
            background-color: rgba(15, 64, 245, 1); /* Azul */
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            text-align: center;
        }

        form button:hover {
            background-color: #0056b3; /* Azul oscuro al pasar el mouse */
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th,
        table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        table th {
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro */
            color: white;
        }

        /* Estilos para el botón verde de volver a inventario */
        .back-button {
            background-color: #28a745; /* Verde */
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }

        .back-button:hover {
            background-color: #218838; /* Verde más oscuro al pasar el mouse */
        }
    </style>
</head>
<body>

    <div class="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Consulta en Inventario</h1>
    </div>

    <div class="content-container">
        <!-- Formulario para buscar por nombre de producto o categoría -->
        <form action="BuscarInventarioServlet" method="post">
            <label for="nombreProducto">Buscar por nombre de producto:</label>
            <input type="text" id="nombreProducto" name="nombreProducto">

            <label for="categoria">Buscar por categoría:</label>
            <input type="text" id="categoria" name="categoria">

            <button type="submit">Buscar</button>
        </form>

        <!-- Resultados de la búsqueda -->
        <h2>Resultados de la búsqueda:</h2>

        <%-- Mostrar un error si existe --%>
        <% 
            String error = (String) request.getAttribute("error");
            if (error != null) { 
        %>
            <p style="color:red;"><%= error %></p>
        <% 
            } 
        %>

        <%-- Mostrar productos si se realizó la búsqueda --%>
        <% 
            Boolean busquedaRealizada = (Boolean) request.getAttribute("busquedaRealizada");
            if (busquedaRealizada != null && busquedaRealizada) { 
                List<Object[]> productos = (List<Object[]>) request.getAttribute("productos");
        %>
            <h3>Resultados de búsqueda:</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                        <th>Categoría</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Object[] producto : productos) { %>
                        <tr>
                            <td><%= producto[0] %></td>
                            <td><%= producto[1] %></td>
                            <td><%= producto[2] %></td>
                            <td><%= producto[3] %></td>
                            <td><%= producto[4] %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>

        <!-- Botón para volver al inventario -->
        <a href="inventario.jsp" class="back-button">Volver a Inventario</a>
    </div>

</body>
</html>
