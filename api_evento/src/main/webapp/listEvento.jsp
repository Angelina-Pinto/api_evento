<%@page import="connection.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Eventos</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Lista de Eventos</h1>
    <table>
        <thead>
            <tr>
                <th>ID Evento</th>
                <th>Nombre Evento</th>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Lugar</th>
                <th>Organizador</th>
                <th>Cliente</th>
                <th>Categoría</th>
                <th>Espacio</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                try {
                    // Establecer la conexión
                    connection = ConnectionManager.getConnection();
                    statement = connection.createStatement();

                    // Consulta SQL para obtener los eventos con INNER JOIN a tablas relacionadas
                    String sql = "SELECT e.idEvento, e.nombreEvento, e.fechaEvento, e.horaEvento, " +
                                 "l.nombreLugar, o.nombreOrganizador, c.nombreCliente, " +
                                 "ce.tipoCategoria, te.tipoEspacio " +
                                 "FROM evento e " +
                                 "INNER JOIN lugar l ON e.idLugar = l.idLugar " +
                                 "INNER JOIN organizador o ON e.idOrganizador = o.idOrganizador " +
                                 "INNER JOIN cliente c ON e.idCliente = c.idCliente " +
                                 "INNER JOIN categoriaEvento ce ON e.idCategoria = ce.idCategoria " +
                                 "INNER JOIN tipoEspacio te ON e.idEspacio = te.idEspacio";
                    resultSet = statement.executeQuery(sql);

                    // Iterar a través de los resultados y mostrarlos en la tabla
                    while (resultSet.next()) {
                        int idEvento = resultSet.getInt("idEvento");
                        String nombreEvento = resultSet.getString("nombreEvento");
                        Date fechaEvento = resultSet.getDate("fechaEvento");
                        Time horaEvento = resultSet.getTime("horaEvento");
                        String nombreLugar = resultSet.getString("nombreLugar");
                        String nombreOrganizador = resultSet.getString("nombreOrganizador");
                        String nombreCliente = resultSet.getString("nombreCliente");
                        String tipoCategoria = resultSet.getString("tipoCategoria");
                        String tipoEspacio = resultSet.getString("tipoEspacio");
            %>
                        <tr>
                            <td><%= idEvento %></td>
                            <td><%= nombreEvento %></td>
                            <td><%= fechaEvento %></td>
                            <td><%= horaEvento %></td>
                            <td><%= nombreLugar %></td>
                            <td><%= nombreOrganizador %></td>
                            <td><%= nombreCliente %></td>
                            <td><%= tipoCategoria %></td>
                            <td><%= tipoEspacio %></td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
            %>
                    <tr>
                        <td colspan="9">Error al cargar los eventos.</td>
                    </tr>
            <%
                } finally {
                    // Cerrar los recursos
                    if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                    if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
                }
            %>
        </tbody>
    </table>
</body>
</html>
