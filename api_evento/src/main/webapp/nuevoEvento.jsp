<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Nuevo Evento</title>
</head>
<body>
    <h1>Registrar Nuevo Evento</h1>
    
    <form action="guardarEvento.jsp" method="post">
        <label for="nombreEvento">Nombre del Evento:</label>
        <input type="text" id="nombreEvento" name="nombreEvento" required><br>

        <label for="fechaEvento">Fecha del Evento:</label>
        <input type="date" id="fechaEvento" name="fechaEvento" required><br>

        <label for="horaEvento">Hora del Evento:</label>
        <input type="time" id="horaEvento" name="horaEvento" required><br>

        <label for="idLugar">Lugar:</label>
        <select id="idLugar" name="idLugar" required>
            <%
                // Conexión a la base de datos y obtención de lugares
                Connection con = null;
                Statement stmt = null;
                ResultSet rs = null;
                List<String> lugares = new ArrayList<>();

                try {
                    Class.forName("com.mysql.jdbc.Driver"); // Cambia esto si usas otro driver
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tu_base_de_datos", "tu_usuario", "tu_contraseña");
                    stmt = con.createStatement();
                    rs = stmt.executeQuery("SELECT idLugar, nombreLugar FROM lugar");

                    while (rs.next()) {
                        int idLugar = rs.getInt("idLugar");
                        String nombreLugar = rs.getString("nombreLugar");
            %>
                <option value="<%= idLugar %>"><%= nombreLugar %></option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                }
            %>
        </select><br>

        <label for="idOrganizador">Organizador:</label>
        <select id="idOrganizador" name="idOrganizador" required>
            <%
                // Similar lógica para obtener organizadores
                // ...
            %>
        </select><br>

        <label for="idCliente">Cliente:</label>
        <select id="idCliente" name="idCliente" required>
            <%
                // Similar lógica para obtener clientes
                // ...
            %>
        </select><br>

        <label for="idEspacio">Tipo de Espacio:</label>
        <select id="idEspacio" name="idEspacio" required>
            <%
                // Similar lógica para obtener tipos de espacio
                // ...
            %>
        </select><br>

        <label for="idCategoria">Categoría:</label>
        <select id="idCategoria" name="idCategoria" required>
            <%
                // Similar lógica para obtener categorías
                // ...
            %>
        </select><br>

        <input type="submit" value="Guardar Evento">
    </form>
</body>
</html>
