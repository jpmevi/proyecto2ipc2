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

/**
 *
 * @author potz
 */
public class Informe_Examen {

    private String descripcion;
    private LocalDate fecha;
    private LocalTime hora;
    private String EXAMEN_codigo;
    private String PACIENTE_codigo;
    private String LABORATORISTA_codigo;

    public Informe_Examen( String descripcion, LocalDate fecha, LocalTime hora, String EXAMEN_codigo, String PACIENTE_codigo, String LABORATORISTA_codigo) {

        this.descripcion = descripcion;
        this.fecha = fecha;
        this.hora = hora;
        this.EXAMEN_codigo = EXAMEN_codigo;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
        insertarInforme_Examen();
    }
public Informe_Examen(){
    
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
            st.setInt(1, 0);
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
    
    public ResultSet buscarInforme(String codigo) {
        try {
            String query = "SELECT* FROM INFORME_EXAMEN WHERE PACIENTE_codigo='"+codigo+"'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    public ResultSet buscarInformeLab(String codigo, String filtro) {
        try {
            String query = "SELECT* FROM INFORME_EXAMEN WHERE LABORATORISTA_codigo='"+codigo+"' && fecha='"+LocalDate.now()+"' && codigo LIKE '%"+filtro+"%'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    public ResultSet buscarInformeUtilizacion(LocalDate fechainicio, LocalDate fechafinal, String codigo) {
        try {
            String query = "SELECT COUNT(*) AS cantidad,fecha FROM INFORME_EXAMEN WHERE LABORATORISTA_codigo='"+codigo+"' && fecha BETWEEN '"+fechainicio+"' AND '"+fechafinal+"' GROUP BY fecha;";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    
    public ResultSet buscarInforme10fechas(String codigo) {
        try {
            String query = "SELECT COUNT(*) AS cantidad,fecha FROM INFORME_EXAMEN WHERE LABORATORISTA_codigo='"+codigo+"' GROUP BY fecha LIMIT 10";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    
    public ResultSet buscarInformeUltimos5(String codigo) {
        try {
            String query = "SELECT IE.*,E.nombre AS examen FROM INFORME_EXAMEN IE INNER JOIN EXAMEN E ON IE.EXAMEN_codigo=E.codigo WHERE PACIENTE_codigo='"+codigo+"' ORDER BY fecha DESC LIMIT 5";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    
    public ResultSet buscarInformeIntervalo(String codigo, String examen, LocalDate fechainicio, LocalDate fechafinal) {
        try {
            String query = "SELECT I.*,E.nombre AS examen FROM INFORME_EXAMEN I INNER JOIN EXAMEN E ON E.codigo=I.EXAMEN_codigo WHERE I.PACIENTE_codigo='"+codigo+"' && E.codigo='"+examen+"' && I.fecha BETWEEN '"+fechainicio+"' AND '"+fechafinal+"'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
}
