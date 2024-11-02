package com.mycompany.api_evento.servlets;

import connection.ConnectionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "client", urlPatterns = {"/client"})
public class client extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista de Clientes</title>");
            out.println("<link rel='stylesheet' href='styles.css'>"); // Asegúrate de tener el CSS correspondiente
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Lista de Clientes</h1>");
            out.println("<table>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>ID</th>");
            out.println("<th>Nombre</th>");
            out.println("<th>Celular</th>");
            out.println("<th>Nombre de Usuario</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

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
                    out.println("<tr>");
                    out.println("<td>" + idCliente + "</td>");
                    out.println("<td>" + nombreCliente + "</td>");
                    out.println("<td>" + celularCliente + "</td>");
                    out.println("<td>" + nombreLoginCliente + "</td>");
                    out.println("</tr>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                // Cerrar los recursos
                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
            }
            out.println("</tbody>");
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Puedes implementar la lógica para manejar POST si es necesario
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
