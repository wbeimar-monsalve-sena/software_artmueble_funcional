<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Productos</title>
    <style>
        /* Agrega estilos básicos y coherentes con el resto del proyecto */
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste para el fondo */
            font-family: Arial, sans-serif;
        }
        #header-container {
            width: 100%;
            height: 110px;
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro para el contenedor superior */
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            box-sizing: border-box;
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
            margin: 40px auto; /* Espacio entre el contenedor del formulario y el contenedor del header */
        }
        form {
            width: 100%;
        }
        label {
            font-weight: bold;
            margin: 5px 0;
            display: block;
        }
        input[type="text"],
        input[type="number"],
        textarea {
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
            background-color: #28a745; /* Color verde específico */
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
            background-color: #218838; /* Color verde oscuro al pasar el ratón */
        }
    </style>
</head>
<body>
    <div id="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Registro de Productos</h1>
    </div>
    <div class="form-container">
        <form action="RegistroProductoServlet" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required>
            
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" rows="4" required></textarea>
            
            <label for="precio">Precio:</label>
            <input type="number" id="precio" name="precio" step="0.01" required>
            
            <label for="categoria">Categoría:</label>
            <input type="text" id="categoria" name="categoria" required>
            
            <button type="submit">Agregar Producto</button>
        </form>
        <a href="productos.jsp" class="button-link-small">Volver a Productos</a>
    </div>
</body>
</html>

