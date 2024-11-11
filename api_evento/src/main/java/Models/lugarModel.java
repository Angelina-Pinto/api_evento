/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Dell
 */
public class lugarModel {
      private int idLugar;
    private String nombreLugar;
    private String direccionLugar;
    private int capacidadLugar;
    private int idEspacio;
    
     public lugarModel() {
    }

    public lugarModel(int idLugar, String nombreLugar, String direccionLugar, int capacidadLugar, int idEspacio) {
        this.idLugar = idLugar;
        this.nombreLugar = nombreLugar;
        this.direccionLugar = direccionLugar;
        this.capacidadLugar = capacidadLugar;
        this.idEspacio = idEspacio;
    }

    /**
     * @return the idLugar
     */
    public int getIdLugar() {
        return idLugar;
    }

    /**
     * @param idLugar the idLugar to set
     */
    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
    }

    /**
     * @return the nombreLugar
     */
    public String getNombreLugar() {
        return nombreLugar;
    }

    /**
     * @param nombreLugar the nombreLugar to set
     */
    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    /**
     * @return the direccionLugar
     */
    public String getDireccionLugar() {
        return direccionLugar;
    }

    /**
     * @param direccionLugar the direccionLugar to set
     */
    public void setDireccionLugar(String direccionLugar) {
        this.direccionLugar = direccionLugar;
    }

    /**
     * @return the capacidadLugar
     */
    public int getCapacidadLugar() {
        return capacidadLugar;
    }

    /**
     * @param capacidadLugar the capacidadLugar to set
     */
    public void setCapacidadLugar(int capacidadLugar) {
        this.capacidadLugar = capacidadLugar;
    }

    /**
     * @return the idEspacio
     */
    public int getIdEspacio() {
        return idEspacio;
    }

    /**
     * @param idEspacio the idEspacio to set
     */
    public void setIdEspacio(int idEspacio) {
        this.idEspacio = idEspacio;
    }
}
