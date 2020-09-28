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
public class Especializacion {
    private String ESCPECIALIDAD_nombre;
    private String MEDICO_codigo;

    public Especializacion(String ESCPECIALIDAD_nombre, String MEDICO_codigo) {
        this.ESCPECIALIDAD_nombre = ESCPECIALIDAD_nombre;
        this.MEDICO_codigo = MEDICO_codigo;
    }

    public String getESCPECIALIDAD_nombre() {
        return ESCPECIALIDAD_nombre;
    }

    public void setESCPECIALIDAD_nombre(String ESCPECIALIDAD_nombre) {
        this.ESCPECIALIDAD_nombre = ESCPECIALIDAD_nombre;
    }

    public String getMEDICO_codigo() {
        return MEDICO_codigo;
    }

    public void setMEDICO_codigo(String MEDICO_codigo) {
        this.MEDICO_codigo = MEDICO_codigo;
    }
    
    
}
