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
public class Informe_Examen {

    private String codigo;
    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private String EXAMEN_codigo;
    private String PACIENTE_codigo;
    private String LABORATORISTA_codigo;

    public Informe_Examen(String codigo, String descripcion, LocalDate fecha, LocalTime hora, String EXAMEN_codigo, String PACIENTE_codigo, String LABORATORISTA_codigo) {
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.EXAMEN_codigo = EXAMEN_codigo;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
        insertarInforme_Examen();
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

    public String getEXAMEN_codigo() {
        return EXAMEN_codigo;
    }

    public void setEXAMEN_codigo(String EXAMEN_codigo) {
        this.EXAMEN_codigo = EXAMEN_codigo;
    }

    public String getPACIENTE_codigo() {
        return PACIENTE_codigo;
    }

    public void setPACIENTE_codigo(String PACIENTE_codigo) {
        this.PACIENTE_codigo = PACIENTE_codigo;
    }

    public String getLABORATORISTA_codigo() {
        return LABORATORISTA_codigo;
    }

    public void setLABORATORISTA_codigo(String LABORATORISTA_codigo) {
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }

    public void insertarInforme_Examen() {

        String query = "INSERT INTO INFORME_EXAMEN ("
                + " codigo,"
                + " descripcion,"
                + " fecha,"
                + " hora,"
                + " EXAMEN_codigo,"
                + " PACIENTE_codigo,"
                + " LABORATORISTA_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getDescripcion());
            st.setDate(3, Date.valueOf(getFecha()));
            st.setTime(4, Time.valueOf(getHora()));
            st.setString(5, getEXAMEN_codigo());
            st.setString(6, getPACIENTE_codigo());
            st.setString(7, getLABORATORISTA_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
}
