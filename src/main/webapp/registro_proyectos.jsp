<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Proyectos</title>
    <style>
        body {
            background-color: #87CEEB; /* Color azul claro para el fondo del body */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header-container {
            display: flex;
            align-items: center;
            background-color: rgb(47, 0, 255); /* Color azul para el header */
            padding: 10px;
            color: white;
            height: 80px; /* Altura reducida del header */
            justify-content: center;
            position: relative;
        }
        .header-container img {
            position: absolute;
            left: 20px;
            max-width: 120px; /* Tamaño reducido del logo */
        }
        .header-container h1 {
            margin: 0;
            font-size: 20px; /* Tamaño de fuente reducido del título */
            text-align: center;
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
            max-width: 500px; /* Ancho reducido del formulario */
            margin: 20px auto;
        }
        form {
            width: 100%;
            box-sizing: border-box;
        }
        label {
            font-weight: bold;
            margin: 5px 0;
            display: block;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="text"], input[type="date"], select, textarea {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 10px;
        }
        button {
            background-color: rgb(47, 0, 255);
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px; /* Tamaño reducido del botón */
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px; /* Tamaño de fuente reducido del botón */
            transition: background-color 0.3s;
            width: 100%;
            box-sizing: border-box;
        }
        button:hover {
            background-color: #03fa03;
        }
        .login-button {
            background-color: #28a745; /* Verde para el botón de inicio de sesión */
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
            transition: background-color 0.3s;
        }
        .login-button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Registro de Proyectos</h1>
    </div>
    <div class="form-container">
        <form action="RegistrarProyectoServlet" method="POST">
            <label for="nombre">Nombre del Proyecto:</label>
            <input type="text" id="nombre" name="nombre" required>
            
            <label for="descripcion">Descripción del Proyecto:</label>
            <textarea id="descripcion" name="descripcion" rows="3" required></textarea>
            
            <label for="fecha-inicio">Fecha de Inicio:</label>
            <input type="date" id="fecha-inicio" name="fecha_inicio" required>
            
            <label for="fecha-fin">Fecha de Finalización (opcional):</label>
            <input type="date" id="fecha-fin" name="fecha_fin">
            
            <label for="estado">Estado Inicial:</label>
            <select id="estado" name="estado" required>
                <option value="" disabled selected></option> <!-- Opción en blanco por defecto -->
                <option value="planificado">Planificado</option>
                <option value="en_progreso">En Progreso</option>
                <option value="completado">Completado</option>
            </select>
            
            <button type="submit">Registrar Proyecto</button>
        </form>
        <a href="artmueble.jsp" class="login-button">ArtMueble</a> <!-- Botón de inicio de sesión -->
        
        <!-- Mostrar mensaje de éxito o error -->
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println("<p>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>
