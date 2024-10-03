<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Clientes</title>
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
        input[type="text"], input[type="email"] {
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
        <h1>Gestión de Clientes</h1>
    </div>

    <div class="form-container">
        <!-- Formulario de búsqueda de cliente -->
        <form action="GestionarClienteServlet" method="POST">
            <label for="idCliente">ID del Cliente:</label>
            <input type="text" id="idCliente" name="idCliente" value="${param.idCliente}" required>
            <button type="submit">Buscar Cliente</button>
        </form>

        <!-- Mostrar mensaje -->
        <div>
            <%= request.getAttribute("mensaje") %>
        </div>

        <!-- Formulario de actualización de cliente -->
        <form action="GestionarClienteServlet" method="POST">
            <input type="hidden" name="idCliente" value="${param.idCliente}">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="${requestScope.nombre}">
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${requestScope.email}">
            
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" value="${requestScope.telefono}">
            
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" value="${requestScope.direccion}">
            
            <button type="submit">Actualizar Cliente</button>
        </form>

        <div class="button-container">
            <a href="clientes.jsp" class="button-link-small">Volver a Clientes</a>
        </div>
    </div>
</body>
</html>