/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class organizadorModel {
     private int idOrganizador;
    private String nombreOrganizador;

     public organizadorModel(int idOrganizador, String nombreOrganizador) {
        this.idOrganizador = idOrganizador;
        this.nombreOrganizador = nombreOrganizador;
    }
     
       public int getIdOrganizador() {
        return idOrganizador;
    }

    public String getNombreOrganizador() {
        return nombreOrganizador;
    }
    
}
