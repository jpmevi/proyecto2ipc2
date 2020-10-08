/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import Encrypt.Encriptar;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.swing.JOptionPane;

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
        this.EXAMEN_codigo = EXAMEN_codigo;
        insertarLaboratorista();
    }
    
    public Laboratorista(String codigo, LocalDate fecha_inicio){
        this.fecha_inicio=fecha_inicio; 
        this.codigo=codigo;
    }

    public Laboratorista() {

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

    public void insertarLaboratorista() {

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
            st.setString(8,Encriptar.encriptar( getPassword()));
            st.setString(9, getEXAMEN_codigo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }

    public ResultSet buscarLaboratorista(String codigo) {
        try {
            String query = "SELECT L.*,E.nombre AS examen,E.costo,E.orden,E.codigo AS codigoex  FROM LABORATORISTA L INNER JOIN EXAMEN E ON L.EXAMEN_codigo=E.codigo WHERE L.codigo LIKE '%" + codigo + "%'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }

    public void actualizarLaboratorista(String codigo, String nombre, String registro, String dpi, String telefono, String correo, LocalDate fecha_inicio, String password, String EXAMEN_codigo) throws SQLException {

        String query = "UPDATE LABORATORISTA SET nombre=?, registro=?, DPI=?, telefono=?, correo=?, fecha_inicio=?, password=?, EXAMEN_codigo=? WHERE codigo=?";

        try {
            //Se establecen los parametros del PreparedStament

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);

            st.setString(9, codigo);
            st.setString(1, nombre);
            st.setString(2, registro);
            st.setString(3, dpi);
            st.setString(4, telefono);
            st.setString(5, correo);
            st.setDate(6, Date.valueOf(fecha_inicio));
            st.setString(7, Encriptar.encriptar(password));
            st.setString(8, EXAMEN_codigo);
            //Ejecuta el insert
            st.executeUpdate();
            st.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

    }

    public ResultSet obtenerDias(String codigo) {
        try {
            String query = "SELECT* FROM DIAS_TRABAJO WHERE LABORATORISTA_codigo='" + codigo + "'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }
    }

    public String[] obtenerHorasDisponibles() {
        //Obtenemos la diferencia en milisegundos

        //Convertimos la diferencia en horas


        //Obtenemos la hora inicial y final

        //Lo convertimos a int
        int hora_inicio = 0;
        int hora_final = 23;

        //Array para guardar las horas entre el intervalo
        String[] guardarHoras =new String[23];
        //Contador para array
        int contador = 0;

        //Se van guardando las hora entre el intervalo
        for (int i = hora_inicio; i < hora_final; i++) {
            guardarHoras[contador] = String.valueOf(i);
            contador++;
        }

        return guardarHoras;
    }

    public ResultSet citasExamen(String hora) {
        String query = "SELECT* FROM CITA_EXAMEN WHERE hora=? AND fecha=? AND LABORATORISTA_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            int horaEntera = Integer.valueOf(hora);
            st.setTime(1, Time.valueOf(LocalTime.of(horaEntera, 0)));
            st.setDate(2,Date.valueOf( getFecha_inicio()));
            st.setString(3, getCodigo());

            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }

        return null;
    }
    
    public ArrayList citasExamenDisponibles() {
        try {
            int contador=0;
            String[] horas = obtenerHorasDisponibles();
            ArrayList horasDisponibles = new ArrayList();
            
            for (int i = 0; i < horas.length; i++) {
                if (!citasExamen(horas[i]).next()) {

                        horasDisponibles.add(LocalTime.of(Integer.valueOf(horas[i]),0) );
                        contador++;
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }
    
}
