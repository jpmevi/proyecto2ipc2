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
public class Archivo_Orden {
    private Blob archivo;
    private int ORDEN_EXAMEN_codigo;

    public Archivo_Orden(Blob archivo, int ORDEN_EXAMEN_codigo) {
        this.archivo = archivo;
        this.ORDEN_EXAMEN_codigo = ORDEN_EXAMEN_codigo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public void setORDEN_EXAMEN_codigo(int ORDEN_EXAMEN_codigo) {
        this.ORDEN_EXAMEN_codigo = ORDEN_EXAMEN_codigo;
    }

    public Blob getArchivo() {
        return archivo;
    }

    public int getORDEN_EXAMEN_codigo() {
        return ORDEN_EXAMEN_codigo;
    }
    
}
