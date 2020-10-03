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

/**
 *
 * @author potz
 */
public class Administrador {
    private String codigo;
    private String nombre;
    private String dpi;
    private String password;

    public Administrador(String codigo, String nombre, String dpi, String password) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.dpi = dpi;
        this.password = password;
        insertarAdministrador();
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

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public void insertarAdministrador()  {

        String query = "INSERT INTO ADMINISTRADOR ("
                + " codigo,"
                + " nombre,"
                + " dpi,"
                + " password) VALUES ("
                + " ?, ?, ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, getCodigo());
            st.setString(2, getNombre());
            st.setString(3, getDpi());
            st.setString(4,Encriptar.encriptar( getPassword()));

            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
}
