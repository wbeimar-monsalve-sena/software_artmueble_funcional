<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Inventario</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB;
            font-family: Arial, sans-serif;
        }

        .header-container {
            width: 100%;
            height: 130px;
            background-color: rgba(15, 64, 245, 1);
            display: flex;
            align-items: center;
            padding: 0 20px;
            color: white;
            margin-bottom: 40px;
        }

        .header-container img {
            height: 80px;
            margin-right: 20px;
        }

        .header-container h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            flex: 1;
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
            margin: 0 auto;
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
        }

        form input[type="text"],
        form button {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            width: 100%;
        }

        form button {
            background-color: rgba(15, 64, 245, 1);
            color: white;
            font-weight: bold;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        form button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th,
        table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: rgba(15, 64, 245, 1);
            color: white;
        }

        .back-button {
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #218838;
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

        <!-- Mensaje de error si existe -->
        <c:if test="${not empty error}">
            <p style="color:red;">${error}</p>
        </c:if>

        <!-- Si hay productos en la lista, se muestra la tabla -->
        <c:if test="${not empty productos}">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Nombre del Producto</th>
                    <th>Cantidad</th>
                    <th>Categoría</th>
                </tr>
                <c:forEach var="producto" items="${productos}">
                    <tr>
                        <td>${producto[0]}</td>
                        <td>${producto[1]}</td>
                        <td>${producto[2]}</td>
                        <td>${producto[3]}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <!-- Si no hay productos pero se realizó una búsqueda, muestra un mensaje -->
        <c:if test="${empty productos && busquedaRealizada}">
            <p>No se encontraron productos.</p>
        </c:if>

        <!-- Botón para regresar -->
        <a href="inventario.jsp" class="back-button">Volver a Inventario</a>
    </div>

</body>
</html>
