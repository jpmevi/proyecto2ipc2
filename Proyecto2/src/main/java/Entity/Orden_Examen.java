/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

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
        
    }

    public Orden_Examen(){
        
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

    public int insertarOrden_Examen() {

        String query = "INSERT INTO ORDEN_EXAMEN ("
                + " codigo,"
                + " descripcion,"
                + " PACIENTE_codigo,"
                + " MEDICO_codigo,"
                + " EXAMEN_codigo) VALUES ("
                + " ?, ?,?,?,?)";
        try {
            // set all the preparedstatement parameters
            int codigoOrden;
            PreparedStatement st = Conexion.getConnection().prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, 0);
            st.setString(2, getDescripcion());
            st.setString(3, getPACIENTE_codigo());
            st.setString(4, getMEDICO_codigo());
            st.setString(5, getEXAMEN_codigo());
            // execute the preparedstatement insert
            st.execute();
            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                codigoOrden = rs.getInt(1);
                st.close();
                return codigoOrden;
            }

        } catch (Exception e) {
            // log exception
        }
        return 0;
    }
    public ResultSet buscarOrden(String codigo, String valor) {
        try {
            String query = "SELECT O.*,E.nombre AS examen FROM ORDEN_EXAMEN O INNER JOIN EXAMEN E ON E.codigo=O.EXAMEN_codigo WHERE O.PACIENTE_codigo ='"+codigo+"' && O.codigo LIKE '%"+valor+"%'";

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }

}
