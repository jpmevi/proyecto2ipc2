/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.Blob;
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
public class Cita_Examen {

    private LocalDate fecha;
    private LocalTime hora;
    private String orden_medico;
    private String PACIENTE_codigo;
    private String EXAMEN_codigo;
    private String LABORATORISTA_codigo;

    public Cita_Examen(LocalDate fecha, LocalTime hora, String orden_medico, String PACIENTE_codigo, String EXAMEN_codigo, String LABORATORISTA_codigo) {
        this.fecha = fecha;
        this.hora = hora;
        this.orden_medico = orden_medico;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.EXAMEN_codigo = EXAMEN_codigo;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
        insertarCita_Examen();
    }
public Cita_Examen() {
        
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

    public String getOrden_medico() {
        return orden_medico;
    }

    public void setOrden_medico(String orden_medico) {
        this.orden_medico = orden_medico;
    }

    public String getPACIENTE_codigo() {
        return PACIENTE_codigo;
    }

    public void setPACIENTE_codigo(String PACIENTE_codigo) {
        this.PACIENTE_codigo = PACIENTE_codigo;
    }

    public String getEXAMEN_codigo() {
        return EXAMEN_codigo;
    }

    public void setEXAMEN_codigo(String EXAMEN_codigo) {
        this.EXAMEN_codigo = EXAMEN_codigo;
    }

    public String getLABORATORISTA_codigo() {
        return LABORATORISTA_codigo;
    }

    public void setLABORATORISTA_codigo(String LABORATORISTA_codigo) {
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }

    public void insertarCita_Examen() {

        String query = "INSERT INTO CITA_EXAMEN ("
                + " codigo,"
                + " fecha,"
                + " hora,"
                + " orden_medico,"
                + " PACIENTE_codigo,"
                + " EXAMEN_codigo,"
                + " LABORATORISTA_codigo) VALUES ("
                + " ? , ? , ?, ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setInt(1, 0);
            st.setDate(2, Date.valueOf(getFecha()));
            st.setTime(3, Time.valueOf(getHora()));
            st.setString(4, getOrden_medico());
            st.setString(5, getPACIENTE_codigo());
            st.setString(6, getEXAMEN_codigo());
            st.setString(7, getLABORATORISTA_codigo());

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
    public ResultSet buscarCitaExamen(String atributo, String valor, String codigopa) {
        try {
            String query = "SELECT CE.*,E.nombre AS examen,L.nombre AS laboratorista FROM CITA_EXAMEN CE INNER JOIN EXAMEN E ON CE.EXAMEN_codigo=E.codigo INNER JOIN LABORATORISTA L ON CE.LABORATORISTA_codigo=L.codigo WHERE CE.PACIENTE_codigo='"+ codigopa+"' && CE."+atributo+" LIKE '%" + valor + "%'";
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
     
     public void eliminarCita(String codigo){
          String query = "DELETE FROM CITA_EXAMEN WHERE codigo=?";
          try {
               PreparedStatement st = Conexion.getConnection().prepareStatement(query);
              st.setString(1, codigo);
            st.execute();
            st.close();
         } catch (Exception e) {
             JOptionPane.showMessageDialog(null, e);
         }
         
     }

}
