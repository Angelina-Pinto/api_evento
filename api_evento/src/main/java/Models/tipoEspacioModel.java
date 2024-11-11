/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class tipoEspacioModel {
     private int idEspacio;
    private String tipoEspacio;

      public tipoEspacioModel(int idEspacio, String tipoEspacio) {
        this.idEspacio = idEspacio;
        this.tipoEspacio = tipoEspacio;
    }
      
       // Getters y Setters
    public int getIdEspacio() {
        return idEspacio;
    }

    public void setIdEspacio(int idEspacio) {
        this.idEspacio = idEspacio;
    }

    public String getTipoEspacio() {
        return tipoEspacio;
    }

    public void setTipoEspacio(String tipoEspacio) {
        this.tipoEspacio = tipoEspacio;
    }

    @Override
    public String toString() {
        return tipoEspacio; // Esto es útil si deseas mostrar solo el nombre del tipo de espacio
    }
}
