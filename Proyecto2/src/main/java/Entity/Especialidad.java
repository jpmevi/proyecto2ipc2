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
public class Especialidad {
    private String nombre;

    public Especialidad(String nombre) {
        this.nombre = nombre;
        insertarEspecialidad();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void insertarEspecialidad()  {

        String query = "INSERT INTO ESPECIALIDAD ("
                + " nombre) VALUES ("
                + " ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getNombre());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
}
