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
public class Orden_Examen {

    private String descripcion;
    private String PACIENTE_codigo;
    private String MEDICO_codigo;
    private String EXAMEN_codigo;

    public Orden_Examen(String descripcion, String PACIENTE_codigo, String MEDICO_codigo, String EXAMEN_codigo) {
        this.descripcion = descripcion;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.MEDICO_codigo = MEDICO_codigo;
        this.EXAMEN_codigo = EXAMEN_codigo;
        insertarOrden_Examen();
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPACIENTE_codigo() {
        return PACIENTE_codigo;
    }

    public void setPACIENTE_codigo(String PACIENTE_codigo) {
        this.PACIENTE_codigo = PACIENTE_codigo;
    }

    public String getMEDICO_codigo() {
        return MEDICO_codigo;
    }

    public void setMEDICO_codigo(String MEDICO_codigo) {
        this.MEDICO_codigo = MEDICO_codigo;
    }

    public String getEXAMEN_codigo() {
        return EXAMEN_codigo;
    }

    public void setEXAMEN_codigo(String EXAMEN_codigo) {
        this.EXAMEN_codigo = EXAMEN_codigo;
    }

    public void insertarOrden_Examen() {

        String query = "INSERT INTO ORDEN_EXAMEN ("
                + " codigo,"
                + " descripcion,"
                + " PACIENTE_codigo,"
                + " MEDICO_codigo,"
                + " EXAMEN_codigo) VALUES ("
                + " ?, ?,?,?,?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setInt(1, 0);
            st.setString(2, getDescripcion());
            st.setString(3, getPACIENTE_codigo());
            st.setString(4, getMEDICO_codigo());
            st.setString(5, getEXAMEN_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }

}
