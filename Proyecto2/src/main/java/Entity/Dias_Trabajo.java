/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author potz
 */
public class Dias_Trabajo {
    private String dia;
    private String LABORATORISTA_codigo;

    public Dias_Trabajo(String dia, String LABORATORISTA_codigo) {
        this.dia = dia;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getLABORATORISTA_codigo() {
        return LABORATORISTA_codigo;
    }

    public void setLABORATORISTA_codigo(String LABORATORISTA_codigo) {
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }
    
    
}
