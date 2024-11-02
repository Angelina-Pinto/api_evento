package com.mycompany.api_evento.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.ConnectionManager;

@WebServlet(name = "servletLogin", urlPatterns = {"/servletLogin"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recuperar parámetros
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Intentar autenticación como cliente
        boolean isAuthenticated = authenticateUser(username, password, "cliente");

        // Si no es cliente, intentar autenticación como organizador
        if (!isAuthenticated) {
            isAuthenticated = authenticateUser(username, password, "organizador");
        }

        // Respuesta al cliente
        if (isAuthenticated) {
            // Redirigir a la página home.jsp si la autenticación es exitosa
            response.sendRedirect("home.jsp");
        } else {
            // Si la autenticación falla, puedes redirigir a una página de error o mostrar un mensaje
            request.setAttribute("errorMessage", "Nombre de usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean authenticateUser(String username, String password, String userType) {
        boolean isAuthenticated = false;
        Connection connection = null;
        String sql;

        try {
            connection = ConnectionManager.getConnection();
            
            // Definir la consulta SQL en función del tipo de usuario
            if (userType.equals("cliente")) {
                sql = "SELECT * FROM cliente WHERE nombreLoginCliente = ? AND passwordCliente = ?";
            } else {
                sql = "SELECT * FROM organizador WHERE nombreLoginOrganizador = ? AND passwordOrganizador = ?";
            }

            // Preparar la consulta
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();

            // Comprobar si el usuario existe
            if (resultSet.next()) {
                isAuthenticated = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectionManager.closeConnection(connection);
        }
        return isAuthenticated;
    }

    @Override
    public String getServletInfo() {
        return "Login servlet para clientes y organizadores";
    }
}
