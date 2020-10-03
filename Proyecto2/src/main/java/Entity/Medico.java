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
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.swing.JOptionPane;

/**
 *
 * @author potz
 */
public class Medico {

    /**
     * Atriburos de nuestro objeto
     */
    private String codigo;
    private String nombre;
    private String colegiado;
    private String dpi;
    private String telefono;
    private String correo;
    private LocalTime hora_entrada;
    private LocalTime hora_salida;
    private LocalDate fecha_inicio;
    private String password;
    private String especialidad;
    private String palabra;

    /**
     * Constructor de Medico
     *
     * @param codigo
     * @param nombre
     * @param colegiado
     * @param dpi
     * @param telefono
     * @param correo
     * @param hora_entrada
     * @param hora_salida
     * @param fecha_inicio
     * @param password
     * @param especialidad
     */
    public Medico(String codigo, String nombre, String colegiado, String dpi, String telefono, String correo, LocalTime hora_entrada, LocalTime hora_salida, LocalDate fecha_inicio, String password, String especialidad) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.colegiado = colegiado;
        this.dpi = dpi;
        this.telefono = telefono;
        this.correo = correo;
        this.hora_entrada = hora_entrada;
        this.hora_salida = hora_salida;
        this.fecha_inicio = fecha_inicio;
        this.password = password;
        this.especialidad = especialidad;
        insertarMedico();
    }

    public Medico(String palabra) {
        this.palabra = palabra;
    }

    /**
     * Getters y setters
     *
     * @return
     */
    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
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

    public String getColegiado() {
        return colegiado;
    }

    public void setColegiado(String colegiado) {
        this.colegiado = colegiado;
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

    public LocalTime getHora_entrada() {
        return hora_entrada;
    }

    public void setHora_entrada(LocalTime hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public LocalTime getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(LocalTime hora_salida) {
        this.hora_salida = hora_salida;
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

    /**
     * Metodo para insertar al medico a la base de datos y comprobar si la
     * especializacion ya existe
     */
    public void insertarMedico() {

        String query = "INSERT INTO MEDICO ("
                + " codigo,"
                + " nombre,"
                + " colegiado,"
                + " dpi,"
                + " telefono,"
                + " correo,"
                + " hora_entrada,"
                + " hora_salida,"
                + " fecha_inicio,"
                + " password) VALUES ("
                + " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getNombre());
            st.setString(3, getColegiado());
            st.setString(4, getDpi());
            st.setString(5, getTelefono());
            st.setString(6, getCorreo());
            st.setTime(7, Time.valueOf(getHora_entrada()));
            st.setTime(8, Time.valueOf(getHora_salida()));
            st.setDate(9, Date.valueOf(getFecha_inicio()));
            st.setString(10, Encriptar.encriptar(getPassword()));

            // execute the preparedstatement insert
            st.execute();

            String query2 = "SELECT nombre FROM ESPECIALIDAD WHERE nombre='"+getEspecialidad()+"'";
            st = null;
            st = Conexion.getConnection().prepareStatement(query2);
            ResultSet result = st.executeQuery();
            if (!result.next()) {
                Especialidad especial = new Especialidad(getEspecialidad());
                Especializacion esp = new Especializacion(getEspecialidad(), getCodigo());
                Consulta consulta = new Consulta(200.0, getEspecialidad());
            } else {
               Especializacion especializacion = new Especializacion(getEspecialidad(), getCodigo());
            }
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }

    public ResultSet buscarMedico(String atributo, String valor) {
        try {
            String query = "SELECT M.*,E.ESPECIALIDAD_nombre,C.costo FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.MEDICO_codigo INNER JOIN CONSULTA C ON E.ESPECIALIDAD_nombre=C.ESPECIALIDAD_nombre WHERE M.nombre LIKE '%" + valor + "%'";

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }

    public ResultSet buscarEspecialidad(String atributo, String valor) {
        Conexion conexion = new Conexion();
        conexion.conexionDB();
        try {
            String query = "SELECT M.*,E.ESPECIALIDAD_nombre,C.costo FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.MEDICO_codigo INNER JOIN CONSULTA C ON E.ESPECIALIDAD_nombre=C.ESPECIALIDAD_nombre WHERE E.ESPECIALIDAD_nombre LIKE '%" + valor + "%'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }
    }

    public ResultSet buscarHora(String atributo, String valor) {
        Conexion conexion = new Conexion();
        conexion.conexionDB();
        try {
            String query = "SELECT M.*,E.ESPECIALIDAD_nombre,C.costo FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.MEDICO_codigo INNER JOIN CONSULTA C ON E.ESPECIALIDAD_nombre=C.ESPECIALIDAD_nombre WHERE hora_salida>='" + valor + "' AND '" + valor + "'>=hora_entrada";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }

}
