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
public class Dias_Trabajo {
    private String dia;
    private String LABORATORISTA_codigo;

    public Dias_Trabajo(String dia, String LABORATORISTA_codigo) {
        this.dia = dia;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
        insertarDias_Trabajo();
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getLABORATORISTA_codigo() {
        return LABORATORISTA_codigo;
    }

    public void setLABORATORISTA_codigo(String LABORATORISTA_codigo) {
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }
    
    public void insertarDias_Trabajo() {

        String query = "INSERT INTO DIAS_TRABAJO ("
                + " dia,"
                + " LABORATORISTA_codigo) VALUES ("
                + " ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getDia());
            st.setString(2, getLABORATORISTA_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
}
