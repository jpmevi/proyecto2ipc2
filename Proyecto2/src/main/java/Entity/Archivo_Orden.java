/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

/**
 *
 * @author potz
 */
public class Archivo_Orden {
    private FileInputStream archivo;
    private int ORDEN_EXAMEN_codigo;

    public Archivo_Orden(FileInputStream archivo, int ORDEN_EXAMEN_codigo) {
        this.archivo = archivo;
        this.ORDEN_EXAMEN_codigo = ORDEN_EXAMEN_codigo;
        insertarArchivo_Orden();
    }

    public Archivo_Orden(){
        
    }
    public void setArchivo(FileInputStream archivo) {
        this.archivo = archivo;
    }

    public void setORDEN_EXAMEN_codigo(int ORDEN_EXAMEN_codigo) {
        this.ORDEN_EXAMEN_codigo = ORDEN_EXAMEN_codigo;
    }

    public FileInputStream getArchivo() {
        return archivo;
    }

    public int getORDEN_EXAMEN_codigo() {
        return ORDEN_EXAMEN_codigo;
    }
    
    public void insertarArchivo_Orden() {

        String query = "INSERT INTO ARCHIVO_ORDEN ("
                + " archivo,"
                + " ORDEN_EXAMEN_codigo) VALUES ("
                + " ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setBlob(1, getArchivo());
            st.setInt(2, getORDEN_EXAMEN_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
    public ResultSet buscarOrden(String codigo) {
        try {
            String query = "SELECT* FROM ARCHIVO_ORDEN WHERE ORDEN_EXAMEN_codigo='"+codigo+"'";

            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            ResultSet rs = st.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }
    
    
}
