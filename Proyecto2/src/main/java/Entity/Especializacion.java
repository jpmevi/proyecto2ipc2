/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author potz
 */
public class Especializacion {
    private String ESCPECIALIDAD_nombre;
    private String MEDICO_codigo;

    public Especializacion(String ESCPECIALIDAD_nombre, String MEDICO_codigo) {
        this.ESCPECIALIDAD_nombre = ESCPECIALIDAD_nombre;
        this.MEDICO_codigo = MEDICO_codigo;
        insertarEspecializacion();
    }
public Especializacion(){
    
}
    public String getESCPECIALIDAD_nombre() {
        return ESCPECIALIDAD_nombre;
    }

    public void setESCPECIALIDAD_nombre(String ESCPECIALIDAD_nombre) {
        this.ESCPECIALIDAD_nombre = ESCPECIALIDAD_nombre;
    }

    public String getMEDICO_codigo() {
        return MEDICO_codigo;
    }

    public void setMEDICO_codigo(String MEDICO_codigo) {
        this.MEDICO_codigo = MEDICO_codigo;
    }
    
    
    public void insertarEspecializacion() {

        String query = "INSERT INTO ESPECIALIZACION ("
                + " ESPECIALIDAD_nombre,"
                + " MEDICO_codigo) VALUES ("
                + " ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getESCPECIALIDAD_nombre());
            st.setString(2, getMEDICO_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
    public ResultSet obtenerEspecializacion(String codigo){
        try {
            String query = "SELECT* FROM ESPECIALIZACION WHERE MEDICO_codigo='"+codigo+"'" ;
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }
    }
    
}
