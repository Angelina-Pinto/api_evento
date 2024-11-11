package com.mycompany.api_evento.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.ConnectionManager;
import java.sql.SQLException;

@WebServlet(name = "servletEvento", urlPatterns = {"/servletEvento"})
public class eventoServlet extends HttpServlet {

    // Constructor público sin parámetros
    public eventoServlet() {
        super(); // Llamada al constructor de la superclase (HttpServlet)
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Este método se podría usar para cargar algún formulario o vista, si es necesario
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Capturar los datos del formulario
            String nombreEvento = request.getParameter("nombreEvento");
            String fechaEvento = request.getParameter("fechaEvento");
            String horaEvento = request.getParameter("horaEvento");
            int idLugar = Integer.parseInt(request.getParameter("idLugar"));
            int idOrganizador = Integer.parseInt(request.getParameter("idOrganizador"));
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            int idEspacio = Integer.parseInt(request.getParameter("idEspacio"));
            int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));

            // Guardar el evento en la base de datos
            boolean isSaved = guardarEvento(nombreEvento, fechaEvento, horaEvento, idLugar, idOrganizador, idCliente, idEspacio, idCategoria);

            // Redirigir según el resultado
            if (isSaved) {
                response.sendRedirect("eventoGuardado.jsp");
            } else {
                response.sendRedirect("errorGuardarEvento.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("errorGuardarEvento.jsp");
        }
    }

    public boolean guardarEvento(String nombreEvento, String fechaEvento, String horaEvento, int idLugar, int idOrganizador, int idCliente, int idEspacio, int idCategoria) {
        Connection connection = null;
        PreparedStatement pstmt = null;
        boolean isSaved = false;

        try {
            // Obtener la conexión de la base de datos
            connection = ConnectionManager.getConnection();

            // Consulta SQL para insertar el evento
            String sql = "INSERT INTO evento (nombreEvento, fechaEvento, horaEvento, idLugar, idOrganizador, idCliente, idEspacio, idCategoria) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, nombreEvento);
            pstmt.setString(2, fechaEvento);
            pstmt.setString(3, horaEvento);
            pstmt.setInt(4, idLugar);
            pstmt.setInt(5, idOrganizador);
            pstmt.setInt(6, idCliente);
            pstmt.setInt(7, idEspacio);
            pstmt.setInt(8, idCategoria);

            // Ejecutar la consulta de inserción
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                isSaved = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (pstmt != null) pstmt.close();
                if (connection != null) ConnectionManager.closeConnection(connection);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isSaved;
    }

    @Override
    public String getServletInfo() {
        return "Servlet para guardar eventos en la base de datos";
    }
}
