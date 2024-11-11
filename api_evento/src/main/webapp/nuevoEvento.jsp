<%@page import="com.mycompany.api_evento.servlets.eventoServlet"%>
<%@page import="Models.evento"%>
<%@page import="Models.categoriaEventoModel"%>
<%@page import="Models.tipoEspacioModel"%>
<%@page import="Models.clienteModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="Models.lugarModel"%>
<%@page import="Models.organizadorModel"%> 
<%@page import="connection.ConnectionManager"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuevo Evento</title>
    <style>
        /* Centrar el formulario en la pantalla */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f9;
        }

        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 400px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
   <div class="form-container">
    <h1>Formulario de Registro para Nuevo Evento</h1>

    <form action="servletEvento" method="POST">
        <label for="nombreEvento">Nombre del Evento:</label>
        <input type="text" id="nombreEvento" name="nombreEvento" required><br>

        <label for="fechaEvento">Fecha del Evento:</label>
        <input type="date" id="fechaEvento" name="fechaEvento" required><br>

        <label for="horaEvento">Hora del Evento:</label>
        <input type="time" id="horaEvento" name="horaEvento" required><br>

        <label for="idLugar">Lugar:</label>
        <select id="idLugar" name="idLugar" required>
            <%
                // Conectar a la base de datos y cargar los lugares
                List<lugarModel> lugares = new ArrayList<>();
                Connection connection = null;
                Statement stmt = null;
                ResultSet rs = null;
                try {
                    connection = ConnectionManager.getConnection();
                    String sql = "SELECT idLugar, nombreLugar FROM lugar";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        int idLugar = rs.getInt("idLugar");
                        String nombreLugar = rs.getString("nombreLugar");
                        lugares.add(new lugarModel(idLugar, nombreLugar, "", 0, 0));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) ConnectionManager.closeConnection(connection);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if (lugares != null && !lugares.isEmpty()) {
                    for (lugarModel lugar : lugares) {
            %>
                <option value="<%= lugar.getIdLugar() %>"><%= lugar.getNombreLugar() %></option>
            <%
                    }
                } else {
            %>
                <option>No hay lugares disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="idOrganizador">Organizador:</label>
        <select id="idOrganizador" name="idOrganizador" required>
            <%
                // Conectar a la base de datos y cargar los organizadores
                List<organizadorModel> organizadores = new ArrayList<>();
                try {
                    connection = ConnectionManager.getConnection();
                    String sql = "SELECT idOrganizador, nombreOrganizador FROM organizador";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        int idOrganizador = rs.getInt("idOrganizador");
                        String nombreOrganizador = rs.getString("nombreOrganizador");
                        organizadores.add(new organizadorModel(idOrganizador, nombreOrganizador));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) ConnectionManager.closeConnection(connection);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if (organizadores != null && !organizadores.isEmpty()) {
                    for (organizadorModel organizador : organizadores) {
            %>
                <option value="<%= organizador.getIdOrganizador() %>"><%= organizador.getNombreOrganizador() %></option>
            <%
                    }
                } else {
            %>
                <option>No hay organizadores disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="idCliente">Cliente:</label>
        <select id="idCliente" name="idCliente" required>
            <%
                // Conectar a la base de datos y cargar los clientes
                List<clienteModel> clientes = new ArrayList<>();
                try {
                    connection = ConnectionManager.getConnection();
                    String sql = "SELECT idCliente, nombreCliente FROM cliente";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        int idCliente = rs.getInt("idCliente");
                        String nombreCliente = rs.getString("nombreCliente");
                        clientes.add(new clienteModel(idCliente, nombreCliente));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) ConnectionManager.closeConnection(connection);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if (clientes != null && !clientes.isEmpty()) {
                    for (clienteModel cliente : clientes) {
            %>
                <option value="<%= cliente.getIdCliente() %>"><%= cliente.getNombreCliente() %></option>
            <%
                    }
                } else {
            %>
                <option>No hay clientes disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="idEspacio">Tipo de Espacio:</label>
        <select id="idEspacio" name="idEspacio" required>
            <%
                // Conectar a la base de datos y cargar los tipos de espacio
                List<tipoEspacioModel> tiposEspacio = new ArrayList<>();
                try {
                    connection = ConnectionManager.getConnection();
                    String sql = "SELECT idEspacio, tipoEspacio FROM tipoEspacio";
                    stmt = connection.createStatement();
                    rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        int idEspacio = rs.getInt("idEspacio");
                        String tipoEspacio = rs.getString("tipoEspacio");
                        tiposEspacio.add(new tipoEspacioModel(idEspacio, tipoEspacio));
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) ConnectionManager.closeConnection(connection);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                if (tiposEspacio != null && !tiposEspacio.isEmpty()) {
                    for (tipoEspacioModel espacio : tiposEspacio) {
            %>
                <option value="<%= espacio.getIdEspacio() %>"><%= espacio.getTipoEspacio() %></option>
            <%
                    }
                } else {
            %>
                <option>No hay tipos de espacio disponibles</option>
            <%
                }
            %>
        </select><br>
    <label for="idCategoria">Categoría del Evento:</label>
    <select id="idCategoria" name="idCategoria" required>
        <%
            // Conectar a la base de datos y cargar las categorías de eventos
            List<categoriaEventoModel> categoriasEvento = new ArrayList<>();
            try {
                connection = ConnectionManager.getConnection();
                String sql = "SELECT idCategoria, tipoCategoria FROM categoriaEvento";
                stmt = connection.createStatement();
                rs = stmt.executeQuery(sql);
                while (rs.next()) {
                    int idCategoria = rs.getInt("idCategoria");
                    String tipoCategoria = rs.getString("tipoCategoria");
                    categoriasEvento.add(new categoriaEventoModel(idCategoria, tipoCategoria));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (connection != null) ConnectionManager.closeConnection(connection);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (categoriasEvento != null && !categoriasEvento.isEmpty()) {
                for (categoriaEventoModel categoria : categoriasEvento) {
        %>
            <option value="<%= categoria.getIdCategoria() %>"><%= categoria.getTipoCategoria() %></option>
        <%
                }
            } else {
        %>
            <option>No hay categorías disponibles</option>
        <%
            }
        %>
    </select><br>

            <input type="submit" value="Registrar Evento">
        </form>
    </div>

</body>
</html>
    