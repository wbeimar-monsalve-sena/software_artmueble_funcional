<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generar Egreso</title>
    <link rel="stylesheet" href="styles/main.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste */
            font-family: Arial, sans-serif;
        }

        .header-container {
            width: 100%;
            height: 130px;
            background-color: rgba(15, 64, 245, 1); /* Azul oscuro */
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
            left: 20px;
        }

        .header-container h1 {
            margin: 0;
            font-size: 40px;
            font-weight: bold;
            text-align: center;
            position: relative;
            left: 90px;
        }

        .content-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px;
            background-color: rgba(15, 64, 245, 1); /* Mismo azul del encabezado */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 900px;
            margin: 60px auto;
            color: white;
        }

        .form-group {
            width: 100%;
            margin-bottom: 15px;
            display: flex;
            flex-direction: column; /* Coloca el label sobre el input */
            align-items: center; /* Centrar el contenido del form-group */
            text-align: center; /* Centrar el texto dentro del form-group */
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            width: 100%;
        }

        .form-group input,
        .form-group textarea {
            width: 200%; /* Ajusta el ancho de los inputs y textarea al 60% */
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .btn-submit {
            background-color: #00BFFF; /* Azul celeste del cuerpo */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            text-align: center;
            width: auto;
        }

        .btn-submit:hover {
            background-color: #87CEEB; /* Azul más oscuro al pasar el mouse */
        }

        .btn-back {
            background-color: #32CD32; /* Verde */
            color: white;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            text-align: center;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #228B22; /* Verde más oscuro al pasar el mouse */
        }
    </style>
</head>
<body>
    <div class="header-container">
        <img src="imagenes/logo-Art.jpg" alt="Logo ArtMueble"/>
        <h1>Generar Egreso</h1>
    </div>
    <div class="content-container">
        <form action="RegistrarEgresoServlet" method="POST">
            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required></textarea>
            </div>
            <div class="form-group">
                <label for="monto">Monto:</label>
                <input type="number" id="monto" name="monto" required>
            </div>
            <div class="form-group">
                <label for="fecha">Fecha:</label>
                <input type="date" id="fecha" name="fecha" required>
            </div>
            <button type="submit" class="btn-submit">Registrar Egreso</button>
        </form>
        <button class="btn-back" onclick="location.href='finanzas.jsp'">Volver a Finanzas</button>
    </div>
</body>
</html>
