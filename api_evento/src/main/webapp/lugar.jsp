<%@page import="connection.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Lugares</title>
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
        <h1>Lista de Lugares</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Dirección</th>
                    <th>Capacidad</th>
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
                        connection = ConnectionManager.getConnection(); // Asegúrate de que esta línea sea correcta
                        statement = connection.createStatement();

                        // Consulta SQL para obtener los lugares
                        String sql = "SELECT l.idLugar, l.nombreLugar, l.direccionLugar, l.capacidadLugar, t.tipoEspacio " +
                                     "FROM lugar l LEFT JOIN tipoEspacio t ON l.idEspacio = t.idEspacio";
                        resultSet = statement.executeQuery(sql);

                        // Iterar a través de los resultados y mostrarlos en la tabla
                        while (resultSet.next()) {
                            int idLugar = resultSet.getInt("idLugar");
                            String nombreLugar = resultSet.getString("nombreLugar");
                            String direccionLugar = resultSet.getString("direccionLugar");
                            int capacidadLugar = resultSet.getInt("capacidadLugar");
                            String tipoEspacio = resultSet.getString("tipoEspacio");
                %>
                            <tr>
                                <td><%= idLugar %></td>
                                <td><%= nombreLugar %></td>
                                <td><%= direccionLugar %></td>
                                <td><%= capacidadLugar %></td>
                                <td><%= tipoEspacio != null ? tipoEspacio : "N/A" %></td>
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
