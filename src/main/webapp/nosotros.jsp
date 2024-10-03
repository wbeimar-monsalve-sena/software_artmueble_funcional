<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nosotros - ArtMueble</title>
    <style>
        /* Tu CSS aquí */
        body {
            margin: 0;
            padding: 0;
            background-color: #87CEEB; /* Azul celeste para el fondo */
           
        }

        .container {
            width: 80%;
            background-color: rgba(15, 64, 245, 1);
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 5px auto;
            padding: 20px;
        }

        .container button:nth-last-child(-n+5) {
            flex: 0 1 calc(16.66% - 10px);
        }

        #container1 {
            height: 110px;
            padding-left: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        #container1 img {
            height: 90%;
            margin-right: 20px;
        }

        #container1 h1 {
            color: aliceblue;
            font-weight: bold;
            margin-right: 20px;
        }

        .additional-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 15px;
            margin-right: 20px;
            align-items: center;
        }

        .additional-buttons a {
            background-color: rgba(0, 199, 255, 1);
            color: white;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            margin: 10px;
            border-radius: 5px;
            cursor: pointer;
            white-space: nowrap;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 130px;
            text-decoration: none;
            text-align: center;
        }

        .additional-buttons a:hover {
            background-color: #0056b3;
        }

        /* Estilos para contenedores horizontales */

        .horizontal-container {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
            /* Reducir el espacio entre filas */
        }

        .container-half {
            width: 48%;
            /* Ancho de cada mitad del contenedor */
            margin-bottom: 5px;
            /* Reducir el espacio entre contenedores */
            margin-right: 2px;
            /* Reducir el margen entre cada contenedor */
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                /* Cambia a column en pantallas pequeñas */
            }
            .horizontal-container {
                flex-direction: column;
                /* Cambia a column en pantallas pequeñas */
            }
            .container-half {
                width: 100%;
                /* Ancho completo en pantallas pequeñas */
                margin-bottom: 5px;
                /* Espacio entre contenedores en pantallas pequeñas */
                margin-right: 0;
                /* Sin margen derecho en pantallas pequeñas */
            }
        }

        /* Estilos para los títulos y contenido de cada sección */

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .top-section h2 {
            color: white;
            font-size: 24px;
            font-weight: bold;
        }

        .bottom-section {
            color: white;
            margin-top: 20px;
        }

        .spacer {
            height: 10px;
        }
    </style>
</head>

<body>

    <div class="container" id="container1">
        <img src="imagenes/logo-Art.jpg" alt=""/>
        <h1>Nosotros</h1>
        <div class="additional-buttons">
            <a href="usuarios.jsp">Usuarios</a>
            <a href="artmueble.jsp">ArtMueble</a>
        </div>
    </div>

    <div class="spacer"></div>

    <div class="container horizontal-container">
        <div class="container-half" id="container2">
            <div class="top-section">
                <h2>Historia de la Empresa</h2>
            </div>
            <div class="bottom-section">
                <p>ArtMueble se estableció con el firme propósito de ofrecer muebles para el hogar fabricados con los más altos estándares de calidad y diseño innovador. Desde su fundación, nos hemos dedicado a crear piezas únicas que reflejan el compromiso
                    con la excelencia y la satisfacción de nuestros clientes. Nuestra misión es proporcionar soluciones de mobiliario que no solo embellezcan los espacios, sino que también perduren en el tiempo, manteniendo la esencia y el confort en
                    cada hogar donde nuestros muebles encuentren su lugar.</p>
            </div>
        </div>

        <div class="container-half" id="container3">
            <div class="top-section">
                <h2>Equipo</h2>
            </div>
            <div class="bottom-section">
                <p>En ArtMueble, nuestro equipo está compuesto por profesionales apasionados y expertos en el arte de la fabricación y restauración de muebles. Desde nuestros fundadores hasta cada miembro del equipo, compartimos una dedicación única hacia
                    la artesanía y el diseño. Con años de experiencia y un compromiso compartido con la excelencia, trabajamos juntos para llevar a cabo nuestra visión de crear muebles que no solo sean funcionales, sino también expresiones de belleza
                    y calidad en cada detalle.</p>
            </div>
        </div>
    </div>

    <div class="container horizontal-container">
        <div class="container-half" id="container4">
            <div class="top-section">
                <h2>Filosofía y Valores</h2>
            </div>
            <div class="bottom-section">
                <p>En ArtMueble, nos comprometemos a combinar calidad artesanal con innovación y diseño, guiados por principios de compromiso con el cliente, sostenibilidad, integridad y ética.</p>
            </div>
        </div>

        <div class="container-half" id="container5">
            <div class="top-section">
                <h2>Proyectos Destacados</h2>
            </div>
            <div class="bottom-section">
                <p>Innovación en Diseño y Fabricación: Desde la modernización de muebles clásicos hasta la creación de diseños personalizados, nuestra empresa se distingue por su innovación y calidad en la fabricación y restauración de muebles para el hogar.</p>
            </div>
        </div>
    </div>

</body>

</html>

