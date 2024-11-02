<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inicio</title>
    <style>
        /* Estilos para el contenedor y el menú */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            margin: 0;
            height: 100vh;
        }
        .sidebar {
            width: 200px;
            background-color: #f4f4f4;
            padding: 15px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar h2 {
            text-align: center;
        }
        .sidebar a {
            display: block;
            padding: 10px;
            margin: 5px 0;
            color: #333;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .content {
            flex: 1;
            padding: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Menú</h2>
        <a href="nuevoEvento.jsp">Registro de Nuevo Evento</a>
        <a href="listClient.jsp">Mis Clientes</a> <!-- Opción agregada -->
         <a href="categoriaEvento.jsp">Categorias de eventos</a> <!-- Opción agregada -->
          <a href="tipoEspacio.jsp">Tipos de espacios</a> <!-- Opción agregada -->
        <a href="lugar.jsp">lugares</a> <!-- Opción agregada -->
        
    </div>
    <div class="content">
        <h1>¡Bienvenido!</h1>
        <p>Esta es la página de inicio.</p>
    </div>
</body>
</html>
