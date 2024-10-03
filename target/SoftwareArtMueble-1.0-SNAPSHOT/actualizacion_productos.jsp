<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Actualización de Productos</title>
    <style>
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
        .form-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px;
            position: relative;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            margin: 20px auto;
        }
        form {
            width: 100%;
        }
        label {
            font-weight: bold;
            margin: 5px 0;
            display: block;
        }
        input[type="text"], input[type="descripcion"] {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            margin-bottom: 10px;
        }
        button {
            background-color: rgb(47, 0, 255);
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            width: 100%;
            box-sizing: border-box;
        }
        button:hover {
            background-color: #03fa03;
        }
        .button-link-small {
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            margin-left: 20px;
        }
        .button-link-small:hover {
            background-color: #218838;
        }
        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div id="container1">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Actualización de Productos</h1>
    </div>

    <div class="form-container">
        <!-- Formulario de búsqueda de producto -->
        <form action="ActualizarProductoServlet" method="POST">
            <label for="idProducto">ID del Producto:</label>
            <input type="text" id="idProducto" name="idProducto" value="${param.idProducto}" required>
            <button type="submit">Buscar Producto</button>
        </form>

        <!-- Mostrar mensaje -->
        <div>
            <%= request.getAttribute("mensaje") %>
        </div>

        <!-- Formulario de actualización de producto -->
        <form action="ActualizarProductoServlet" method="POST">
            <input type="hidden" name="idProducto" value="${param.idProducto}">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="${requestScope.nombre}">
            
            <label for="descripcion">Descripción:</label>
            <input type="descripcion" id="descripcion" name="descripcion" value="${requestScope.descripcion}">
            
            <label for="precio">Precio:</label>
            <input type="text" id="precio" name="precio" value="${requestScope.precio}">
            
            <label for="categoria">Categoría:</label>
            <input type="text" id="categoria" name="categoria" value="${requestScope.categoria}">
            
            <button type="submit">Actualizar Producto</button>
        </form>

        <div class="button-container">
            <a href="productos.jsp" class="button-link-small">Volver a Productos</a>
        </div>
    </div>
</body>
</html>
