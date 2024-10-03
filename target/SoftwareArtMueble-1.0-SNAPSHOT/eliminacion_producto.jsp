<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de Productos</title>
    <style>
        /* Usa estilos coherentes con el resto del proyecto */
        body {
            background-color: #87CEEB; /* Azul celeste para el fondo */
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        #header-container {
            width: 100%;
            height: 110px;
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro para el contenedor superior */
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            box-sizing: border-box;
            margin-bottom: 150px; /* Espacio entre el header y el contenedor del formulario */
        }
        #header-container h1 {
            color: aliceblue;
            font-weight: bold;
            margin: 0 10px;
        }
        #header-container img {
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
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 600px;
            margin: 0 auto; /* Eliminado margen superior para centrado vertical */
            box-sizing: border-box; /* Asegura que padding y border se incluyan en el width */
        }
        form {
            width: 100%;
        }
        label {
            font-weight: bold;
            margin: 5px 0;
            display: block;
        }
        input[type="text"] {
            padding: 10px;
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
            margin-top: 20px;
        }
        .button-link-small:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function confirmDelete() {
            return confirm("¿Estás seguro de que deseas eliminar este producto?");
        }
    </script>
</head>
<body>
    <div id="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Eliminación de Productos</h1>
    </div>
    <div class="form-container">
        <form action="EliminarProductoServlet" method="POST" onsubmit="return confirmDelete();">
            <label for="id">ID del Producto a Eliminar:</label>
            <input type="text" id="id" name="id" required>
            
            <button type="submit">Eliminar Producto</button>
        </form>
        <a href="productos.jsp" class="button-link-small">Volver a Productos</a>
    </div>
    
     <div>
        <!-- Muestra el mensaje después de que el servlet procese la solicitud -->
        <%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>
    </div>
</body>
</html>
