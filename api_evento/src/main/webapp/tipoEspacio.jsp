<%-- 
    Document   : registerCliente
    Created on : 1 nov 2024, 9:29:12 p.m.
    Author     : Dell
--%>
<%@page import="connection.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Tipos de Espacio</title>
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
    <h1>Lista de Tipos de Espacio</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Tipo de Espacio</th>
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

                    // Consulta SQL para obtener los tipos de espacio
                    String sql = "SELECT idEspacio, tipoEspacio FROM tipoespacio";
                    resultSet = statement.executeQuery(sql);

                    // Iterar a través de los resultados y mostrarlos en la tabla
                    while (resultSet.next()) {
                        int idEspacio = resultSet.getInt("idEspacio");
                        String tipoEspacio = resultSet.getString("tipoEspacio");
            %>
                        <tr>
                            <td><%= idEspacio %></td>
                            <td><%= tipoEspacio %></td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
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
