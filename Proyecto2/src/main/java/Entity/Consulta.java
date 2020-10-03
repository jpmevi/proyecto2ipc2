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
public class Consulta {
    private Double costo;
    private String ESPECIALIDAD_nombre;

    public Consulta(Double costo, String ESPECIALIDAD_nombre) {
        this.costo = costo;
        this.ESPECIALIDAD_nombre = ESPECIALIDAD_nombre;
        
        insertarConsulta();
    }
    public Consulta(){
        
    }

    public Double getCosto() {
        return costo;
    }

    public void setCosto(Double costo) {
        this.costo = costo;
    }

    public String getESPECIALIDAD_nombre() {
        return ESPECIALIDAD_nombre;
    }

    public void setESPECIALIDAD_nombre(String ESPECIALIDAD_nombre) {
        this.ESPECIALIDAD_nombre = ESPECIALIDAD_nombre;
    }
    
    
    
     public void insertarConsulta()  {

        String query = "INSERT INTO CONSULTA ("
                + " codigo,"
                + " costo,"
                + " ESPECIALIDAD_nombre) VALUES ("
                + " ? , ? , ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setInt(1, 0);
            st.setDouble(2, getCosto());
            st.setString(3, getESPECIALIDAD_nombre());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
     public ResultSet buscarConsulta() {
        try {
            String query = "SELECT* FROM CONSULTA";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
      public void actualizarConsulta(int codigo, double costo) throws SQLException{
          
        String query = "UPDATE CONSULTA SET costo=? WHERE codigo=?";

        try { 
            //Se establecen los parametros del PreparedStament

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);

            

            st.setDouble(1,costo);
            st.setInt(2, codigo);
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error "+e);
        }

    }
   
}
