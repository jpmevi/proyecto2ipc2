/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd;

import DataBase.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/**
 *
 * @author potz
 */
public class Login {

    private String atributo;
    private String user;
    private String password;
    private boolean ingreso = false;

    public Login(String atributo, String user, String password) {
        this.atributo = atributo;
        this.user = user;
        this.password = password;
    }

    public String getAtributo() {
        return atributo;
    }

    public void setAtributo(String atributo) {
        this.atributo = atributo;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean  comprobarLogin() {
        if (getAtributo() == null || getPassword() == null || getUser() == null) {
            JOptionPane.showMessageDialog(null, "Por favor llene todos los campos");
        } else {
            buscarUsuario(atributo);

        }
        return ingreso;
    }

    public void buscarUsuario(String entidad) {
        try {

            // set all the preparedstatement parameters
            Conexion conexion = new Conexion();
            conexion.conexionDB();
            String query = "SELECT* FROM " + entidad;
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st = null;
            st = Conexion.getConnection().prepareStatement(query);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                if (getUser().equals(String.valueOf(result.getObject("codigo"))) && getPassword().equals(String.valueOf(result.getObject("password")))) {
                    ingreso = true;
                    break;
                }
            }

            st.close();
        } catch (Exception e) {
            // log exception
        } finally {
            Conexion.disconnectDB();
        }
    }

}
