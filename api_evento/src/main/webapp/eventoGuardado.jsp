<%-- 
    Document   : eventoGuardado
    Created on : 11 nov 2024, 5:16:23 a.m.
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Evento Guardado</title>
    <style>
        /* Estilos generales para la página */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        /* Contenedor del mensaje */
        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
        }

        /* Estilo del título */
        h1 {
            color: #4CAF50;
            font-size: 2em;
            margin-bottom: 10px;
        }

        /* Estilo del mensaje de éxito */
        .message {
            font-size: 1.1em;
            color: #333;
            margin-bottom: 20px;
        }

        /* Estilo del botón de regreso */
        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>¡Evento Guardado!</h1>
        <p class="message">El evento ha sido registrado exitosamente.</p>
        <a href="home.jsp" class="back-button">Volver al inicio</a>
    </div>
</body>
</html>
