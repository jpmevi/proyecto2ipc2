/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author potz
 */
public class Informe_Consulta {

    private String codigo;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private int CONSULTA_codigo;
    private String PACIENTE_codigo;
    private String MEDICO_codigo;

    public Informe_Consulta(String codigo, String descripcion, LocalDate fecha, LocalTime hora, int CONSULTA_codigo, String PACIENTE_codigo, String MEDICO_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.CONSULTA_codigo = CONSULTA_codigo;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.MEDICO_codigo = MEDICO_codigo;
        insertarInforme_Consulta();
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public int getCONSULTA_codigo() {
        return CONSULTA_codigo;
    }

    public void setCONSULTA_codigo(int CONSULTA_codigo) {
        this.CONSULTA_codigo = CONSULTA_codigo;
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

    public void insertarInforme_Consulta() {

        String query = "INSERT INTO INFORME_CONSULTA ("
                + " codigo,"
                + " descripcion,"
                + " fecha,"
                + " hora,"
                + " CONSULTA_codigo,"
                + " PACIENTE_codigo,"
                + " MEDICO_codigo) VALUES ("
                + " ? , ? , ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getDescripcion());
            st.setDate(3, Date.valueOf(getFecha()));
            st.setTime(4, Time.valueOf(getHora()));
            st.setInt(5, getCONSULTA_codigo());
            st.setString(6, getPACIENTE_codigo());
            st.setString(7, getMEDICO_codigo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }

}
