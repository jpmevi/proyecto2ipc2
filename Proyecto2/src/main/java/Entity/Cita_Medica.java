/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.swing.JOptionPane;

/**
 *
 * @author potz
 */
public class Cita_Medica {
    private LocalDate fecha;
    private LocalTime hora;
    private String PACIENTE_codigo;
    private String MEDICO_codigo;
    private int CONSULTA_codigo;

    public Cita_Medica( LocalDate fecha, LocalTime hora, String PACIENTE_codigo, String MEDICO_codigo, int CONSULTA_codigo) {

        this.fecha = fecha;
        this.hora = hora;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.MEDICO_codigo = MEDICO_codigo;
        this.CONSULTA_codigo = CONSULTA_codigo;
        insertarCita_Medica();
    }



    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
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

    public int getCONSULTA_codigo() {
        return CONSULTA_codigo;
    }

    public void setCONSULTA_codigo(int CONSULTA_codigo) {
        this.CONSULTA_codigo = CONSULTA_codigo;
    }
    
     public void insertarCita_Medica()  {

        String query = "INSERT INTO CITA_MEDICA ("
                + " codigo,"
                + " fecha,"
                + " hora,"
                + " PACIENTE_codigo,"
                + " MEDICO_codigo,"
                + " CONSULTA_codigo) VALUES ("
                + " ? , ? , ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setInt(1, 0);
            st.setDate(2,Date.valueOf( getFecha()));
            st.setTime(3, Time.valueOf(getHora()));
            st.setString(4, getPACIENTE_codigo());
            st.setString(5, getMEDICO_codigo());
            st.setInt(6, getCONSULTA_codigo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

    }
     
    
}
