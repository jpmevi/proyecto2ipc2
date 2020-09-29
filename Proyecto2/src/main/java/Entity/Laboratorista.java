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

/**
 *
 * @author potz
 */
public class Laboratorista {
    private String codigo;
    private String nombre;
    private String registro;
    private String dpi;
    private String telefono;
    private String correo;
    private LocalDate fecha_inicio;
    private String password;
    private String EXAMEN_codigo;

    public Laboratorista(String codigo, String nombre, String registro, String dpi, String telefono, String correo, LocalDate fecha_inicio, String password, String EXAMEN_codigo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.registro = registro;
        this.dpi = dpi;
        this.telefono = telefono;
        this.correo = correo;
        this.fecha_inicio = fecha_inicio;
        this.password = password;
        this.EXAMEN_codigo=EXAMEN_codigo;
        insertarLaboratorista();
    }

    public String getEXAMEN_codigo() {
        return EXAMEN_codigo;
    }

    public void setEXAMEN_codigo(String EXAMEN_codigo) {
        this.EXAMEN_codigo = EXAMEN_codigo;
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

    public String getRegistro() {
        return registro;
    }

    public void setRegistro(String registro) {
        this.registro = registro;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public LocalDate getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(LocalDate fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
    public void insertarLaboratorista()  {

        String query = "INSERT INTO LABORATORISTA ("
                + " codigo,"
                + " nombre,"
                + " registro,"
                + " dpi,"
                + " telefono,"
                + " correo,"
                + " fecha_inicio,"
                + " password,"
                + " EXAMEN_codigo) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getNombre());
            st.setString(3, getRegistro());
            st.setString(4, getDpi());
            st.setString(5, getTelefono());
            st.setString(6, getCorreo());
            st.setDate(7, Date.valueOf(getFecha_inicio()));
            st.setString(8, getPassword());
            st.setString(9, getEXAMEN_codigo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
}
