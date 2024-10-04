<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finanzas</title>
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
        }

        .header-container img {
            height: 80px;
            margin-right: 10px;
            position: absolute;
            left: 20px; /* Separación del logo del borde izquierdo */
        }

        .header-container h1 {
            margin: 0;
            font-size: 40px;
            font-weight: bold;
            text-align: center; /* Centrando solo el texto del h1 */
            position: relative;
            left: 90px; /* Ajuste para alinear el texto del h1 con el logo */
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            background-color: white; /* Mismo azul del encabezado */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%; /* Ajustar el ancho del contenedor */
            max-width: 900px; /* Ancho máximo del contenedor */
            margin: 60px auto; /* Espacio superior aumentado */
            color: white; /* Texto en blanco para el contenedor */
            min-height: 250px; /* Aumenta la altura mínima del contenedor */
        }

        .finance-options {
            width: 100%;
            display: flex;
            flex-direction: column; /* Cambiado a columna */
            align-items: center; /* Centrar los botones */
            margin-bottom: 20px;
        }

        .finance-options .btn-finance {
            background-color: green; /* Azul celeste del cuerpo */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            text-align: center;
            display: block; /* Cambiado a block para que ocupen el ancho completo */
            width: 80%; /* Ajustar el ancho de los botones */
            margin: 10px 0; /* Espacio vertical entre los botones */
        }

        .finance-options .btn-finance:hover {
            background-color: #00BFFF; /* Azul más oscuro al pasar el mouse */
        }

        .finance-table-container {
            width: 100%; /* Contenedor de la tabla ahora ocupa todo el ancho */
            margin-top: 50px;
            overflow-x: auto; /* Permite el desplazamiento horizontal si es necesario */
        }

        .finance-table {
            width: 100%;
            border-collapse: collapse;
        }

        .finance-table th,
        .finance-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            height: 30px; /* Aumenta la altura de las filas */
        }

        .finance-table th {
            background-color: rgba(15, 64, 245, 1); /* Azul celeste del cuerpo */
            color: white;
        }

        .finance-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .finance-table tr:hover {
            background-color: #f1f1f1;
        }

        .btn-login {
            background-color: green; /* Verde */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }

        .btn-login-container {
            display: flex;
            justify-content: center; /* Centra el botón de inicio de sesión */
            margin-top: 20px;
        }

        .btn-login:hover {
            background-color: #218838; /* Verde oscuro al pasar el mouse */
        }
    </style>
</head>
<body>
    <div class="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Finanzas</h1>
    </div>
    <div class="content-container">
        <div class="finance-options">
            <button class="btn-finance" onclick="window.location.href='GenerarIngreso.jsp'">Generar Ingreso</button>
            <button class="btn-finance" onclick="window.location.href='GenerarEgreso.jsp'">Generar Egreso</button>
        </div>

        <div class="finance-table-container">
            <!-- Aquí puedes agregar la tabla de finanzas si es necesario -->
        </div>
    </div>
    <div class="btn-login-container">
        <a href="artmueble.jsp" class="btn-login">ArtMueble</a>
    </div>
</body>
</html>
