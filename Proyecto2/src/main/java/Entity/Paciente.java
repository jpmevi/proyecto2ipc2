/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import DataBase.Conexion;
import java.sql.Date;

/**
 *
 * @author potz
 */
public class Paciente {

    private String codigo;
    private String nombre;
    private String sexo;
    private LocalDate fecha_nacimiento;
    private String dpi;
    private String telefono;
    private String peso;
    private String sangre;
    private String correo;
    private String password;

    public Paciente(String codigo, String nombre, String sexo, LocalDate fecha_nacimiento, String dpi, String telefono, String peso, String sangre, String correo, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.sexo = sexo;
        this.fecha_nacimiento = fecha_nacimiento;
        this.dpi = dpi;
        this.telefono = telefono;
        this.peso = peso;
        this.sangre = sangre;
        this.correo = correo;
        this.password = password;
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

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public LocalDate getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(LocalDate fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
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

    public String getPeso() {
        return peso;
    }

    public void setPeso(String peso) {
        this.peso = peso;
    }

    public String getSangre() {
        return sangre;
    }

    public void setSangre(String sangre) {
        this.sangre = sangre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void insertarPaciente()  {

        String query = "INSERT INTO PACIENTE ("
                + " codigo,"
                + " nombre,"
                + " sexo,"
                + " fecha_nacimiento,"
                + " dpi,"
                + " telefono,"
                + " peso,"
                + " sangre,"
                + " correo,"
                + " password) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getNombre());
            st.setString(3, getSexo());
            st.setDate(4, Date.valueOf(getFecha_nacimiento()));
            st.setString(5, getDpi());
            st.setString(6, getTelefono());
            st.setString(7, getPeso());
            st.setString(8, getSangre());
            st.setString(9, getCorreo());
            st.setString(10, getPassword());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }

}
