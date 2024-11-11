/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Services;

import Models.evento;
import connection.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class eventoService {
    
    
     public boolean insertarEvento(evento evento) {
    Connection connection = null;
    PreparedStatement pstmt = null;
    boolean resultado = false;

    try {
        connection = ConnectionManager.getConnection();
        String sql = "INSERT INTO evento (nombreEvento, fechaEvento, horaEvento, idLugar, idOrganizador, idCliente, idEspacio) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = connection.prepareStatement(sql);
        
        pstmt.setString(1, evento.getNombreEvento());
        pstmt.setString(2, evento.getFechaEvento());
        pstmt.setString(3, evento.getHoraEvento());
        pstmt.setInt(4, evento.getIdLugar());
        pstmt.setInt(5, evento.getIdOrganizador());
        pstmt.setInt(6, evento.getIdCliente());
        pstmt.setInt(7, evento.getIdEspacio());
        
        resultado = pstmt.executeUpdate() > 0;
        
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (connection != null) ConnectionManager.closeConnection(connection);
    }
    return resultado;
}

    
}
