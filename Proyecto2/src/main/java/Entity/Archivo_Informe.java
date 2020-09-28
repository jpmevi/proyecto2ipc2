/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Blob;

/**
 *
 * @author potz
 */
public class Archivo_Informe {
    private Blob archivo;
    private String INFORME_EXAMEN_codigo;

    public Archivo_Informe(Blob archivo, String INFORME_EXAMEN_codigo) {
        this.archivo = archivo;
        this.INFORME_EXAMEN_codigo = INFORME_EXAMEN_codigo;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public String getINFORME_EXAMEN_codigo() {
        return INFORME_EXAMEN_codigo;
    }

    public void setINFORME_EXAMEN_codigo(String INFORME_EXAMEN_codigo) {
        this.INFORME_EXAMEN_codigo = INFORME_EXAMEN_codigo;
    }
    
    
}
