/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.PreparedStatement;

/**
 *
 * @author potz
 */
public class Examen {
    private String codigo;
    private String nombre;
    private String descripcion;
    private boolean orden;
    private double costo;
    private String tipo_archivo;

    public Examen(String codigo, String nombre, String descripcion, boolean orden, double costo, String tipo_archivo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.orden = orden;
        this.costo = costo;
        this.tipo_archivo = tipo_archivo;
        insertarExamen();
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isOrden() {
        return orden;
    }

    public void setOrden(boolean orden) {
        this.orden = orden;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public String getTipo_archivo() {
        return tipo_archivo;
    }

    public void setTipo_archivo(String tipo_archivo) {
        this.tipo_archivo = tipo_archivo;
    }


    
    
    public void insertarExamen() {

        String query = "INSERT INTO EXAMEN ("
                + " codigo,"
                + " nombre,"
                + " descripcion,"
                + " orden,"
                + " costo,"
                + " tipo_archivo) VALUES ("
                + " ? , ? , ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getNombre());
            st.setString(3, getDescripcion());
            st.setInt(4, 0);
            st.setDouble(5, getCosto());
            st.setString(6, getTipo_archivo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
}
