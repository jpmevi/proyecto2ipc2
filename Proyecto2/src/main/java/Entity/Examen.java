/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author potz
 */
public class Examen {
    private String nombre;
    private String descripcion;
    private boolean orden;
    private double costo;
    private String tipo_archivo;

    public Examen( String nombre, String descripcion, boolean orden, double costo, String tipo_archivo) {

        this.nombre = nombre;
        this.descripcion = descripcion;
        this.orden = orden;
        this.costo = costo;
        this.tipo_archivo = tipo_archivo;
        insertarExamen();
    }
    public Examen(String nombre){
        this.nombre=nombre;
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
            st.setInt(1, 0);
            st.setString(2, getNombre());
            st.setString(3, getDescripcion());
            st.setBoolean(4, isOrden());
            st.setDouble(5, getCosto());
            st.setString(6, getTipo_archivo());
            // execute the preparedstatement insert
           
            st.execute();
            st.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }

    }
    
     public ResultSet buscarExamen(String codigo) {
        try {
            String query = "SELECT* FROM EXAMEN WHERE codigo  LIKE '%"+codigo+"%'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
     public void actualizarExamen_laboratorio(String nombre, String descripcion, boolean orden, double costo, String tipo_archivo, int codigo) throws SQLException{
          
        String query = "UPDATE EXAMEN SET nombre=?, orden=?, descripcion=?, costo=?, tipo_archivo=? WHERE codigo=?";

        try { 
            //Se establecen los parametros del PreparedStament

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);

            
            st.setInt(6,codigo);
            st.setString(1,nombre);
            if(orden){
                st.setInt(2,1);
            }else{
                st.setInt(2,0);
            }
            st.setString(3,descripcion);
            st.setDouble(4,costo);
            st.setString(5,tipo_archivo);
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }

    }
}
