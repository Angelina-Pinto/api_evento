<%@page import="connection.ConnectionManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Clientes</title>
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
    <h1>Lista de Clientes</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Celular</th>
                <th>Nombre de Usuario</th>
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

                    // Consulta SQL para obtener los clientes
                    String sql = "SELECT idCliente, nombreCliente, celularCliente, nombreLoginCliente FROM cliente";
                    resultSet = statement.executeQuery(sql);

                    // Iterar a través de los resultados y mostrarlos en la tabla
                    while (resultSet.next()) {
                        int idCliente = resultSet.getInt("idCliente");
                        String nombreCliente = resultSet.getString("nombreCliente");
                        String celularCliente = resultSet.getString("celularCliente");
                        String nombreLoginCliente = resultSet.getString("nombreLoginCliente");
            %>
                        <tr>
                            <td><%= idCliente %></td>
                            <td><%= nombreCliente %></td>
                            <td><%= celularCliente %></td>
                            <td><%= nombreLoginCliente %></td>
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
