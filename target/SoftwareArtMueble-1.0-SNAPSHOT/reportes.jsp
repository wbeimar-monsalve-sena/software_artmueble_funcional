<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportes</title>
    <link rel="stylesheet" href="styles/main.css">
    <style>
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
            justify-content: center;
            align-items: center;
            position: relative;
            box-sizing: border-box;
            color: white;
            padding: 0 20px;
            flex-direction: column;
             margin-bottom: 80px; /* Espacio entre el header y el contenedor del formulario */
        }

        .header-container img {
            height: 80px;
            margin-right: 10px;
            position: absolute;
            left: 60px; /* Ajuste según el espacio requerido */
        }

        .header-container h1 {
            margin: 50px;
            font-size: 50px;
            font-weight: bold;
            text-align: center;
            flex: 1;
        }

        .report-container {
            width: 80%;
            max-width: 800px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin: 20px auto;
        }

        .report-container h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .filter-form {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            max-width: 600px; /* Ancho reducido del formulario */
            margin: 0 auto;
        }

        .filter-form label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .filter-form select,
        .filter-form input {
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }

        .btn-generate {
            background-color: rgba(15, 64, 245, 1); /* Azul */
            color: white;
            font-weight: bold;
            border: none;
            padding: 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s;
            text-decoration: none;
            display: block;
            width: 100%;
            box-sizing: border-box;
        }

        .btn-generate:hover {
            background-color: #0056b3; /* Azul oscuro al pasar el mouse */
        }

        .btn-login {
            background-color: #28a745; /* Verde */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            display: block;
            width: 200px; /* Menos ancho */
            box-sizing: border-box;
            margin: 20px auto; /* Centrado y espacio superior e inferior */
            text-align: center;
        }

        .btn-login:hover {
            background-color: #218838; /* Verde oscuro al pasar el mouse */
        }

        .report-content {
            margin-top: 20px;
        }

        .chart-container,
        .table-container {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Reportes</h1>
    </div>
    <div class="report-container">
        <form action="GenerarReporteServlet" method="GET" class="filter-form">
            <label for="fechaInicio">Fecha de Inicio:</label>
            <input type="date" id="fechaInicio" name="fechaInicio" required>

            <label for="fechaFin">Fecha de Fin:</label>
            <input type="date" id="fechaFin" name="fechaFin" required>

            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria">
                <option value="todos">Todos</option>
                <option value="producto">Producto</option>
                <option value="cliente">Cliente</option>
                <option value="inventario">Inventario</option>
                <option value="ventas">Ventas</option>
                <option value="proyectos">Proyectos</option>
            </select>

            <button type="submit" class="btn-generate">Generar Reporte</button>
        </form>

        <div class="report-content">
            <div class="chart-container">
                <!-- Aquí se mostrarán los gráficos del reporte -->
            </div>
            <div class="table-container">
                <!-- Aquí se mostrará la tabla con los datos del reporte -->
            </div>
        </div>
    </div>
    <a href="artmueble.jsp" class="btn-login">ArtMueble</a>
</body>
</html>
