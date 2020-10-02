/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Funcion;

import DataBase.Conexion;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import javax.swing.JOptionPane;


/**
 *
 * @author potz
 */
public class IntervaloHoras {
    private Time hora_entrada;
    private Time hora_salida;
    private String codigo;
    private Date fecha;
    private boolean verficar=false;
    
    public IntervaloHoras(String codigo, Date fecha) {
        this.codigo = codigo;
        this.fecha = fecha;
    }
    public IntervaloHoras(){
        
    }

    public boolean isVerficar() {
        return verficar;
    }

    public void setVerficar(boolean verficar) {
        this.verficar = verficar;
    }

    public Time getHora_entrada() {
        return hora_entrada;
    }

    public void setHora_entrada(Time hora_entrada) {
        this.hora_entrada = hora_entrada;
    }

    public Time getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(Time hora_salida) {
        this.hora_salida = hora_salida;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    /**
     * Metodo que usamos para obtener la hora de entrada y salida del medico
     */
    
    public boolean verificar(){
        
        return verficar;
    }
    public void obtenerHoras(){
        try{
            String query="SELECT* FROM MEDICO WHERE codigo='"+getCodigo()+"'";
         PreparedStatement st = Conexion.getConnection().prepareStatement(query);
         ResultSet rs = st.executeQuery();
         while(rs.next()){
             setHora_entrada(rs.getTime("hora_entrada"));
             setHora_salida(rs.getTime("hora_salida"));
                     
         }
        }catch(SQLException e){
            
        }
        
    }
    
    public ResultSet citasMedicas(String hora) {
        String query = "SELECT * FROM CITA_MEDICA WHERE hora=? AND fecha=? AND MEDICO_codigo=?";

        try {
            //Se establecen los parametros del PreparedStament
           PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            String horafix=hora+":00:00";
            st.setTime(1, Time.valueOf(LocalTime.parse(horafix)));
            st.setDate(2, getFecha());
            st.setString(3, getCodigo());

            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            return rs;
        } catch (Exception e) {
             JOptionPane.showMessageDialog(null,e);
        }

        return null;
    }
    
public ArrayList citasMedicasDisponibles() {
        try {
            obtenerHoras();
            int contador=0;
            String[] horas = obtenerHorasDisponibles();
            ArrayList horasDisponibles = new ArrayList();
            
            for (int i = 0; i < horas.length; i++) {
                if (!citasMedicas(horas[i]).next()) {
                   
                        horasDisponibles.add(horas[i] );
                        contador++;
                }
            }
            return horasDisponibles;
        } catch (Exception e) {
            return null;
        }
    }
    
    public String[] obtenerHorasDisponibles() {
        //Obtenemos la diferencia en milisegundos
        long diferencia_milisegundos = getHora_salida().getTime() - getHora_entrada().getTime();
        //Convertimos la diferencia en horas
        int diferencia_horas = (int) ((diferencia_milisegundos / (1000 * 60 * 60)) % 24);
        //Obtenemos la hora inicial y final
        String[] obtener_horainicio = getHora_entrada().toString().split(":");
        String[] obtener_horafinal = getHora_salida().toString().split(":");
        
        //Lo convertimos a int
        int hora_inicio = Integer.parseInt(obtener_horainicio[0]);
        int hora_final = Integer.parseInt(obtener_horafinal[0]);

        //Array para guardar las horas entre el intervalo
        String[] guardarHoras = new String[diferencia_horas];
        //Contador para array
        int contador = 0;
                
        //Se van guardando las hora entre el intervalo
        
        for (int i = hora_inicio; i < hora_final; i++) {
            
            guardarHoras[contador] = String.valueOf(i);
            contador++;
        }
        
        return guardarHoras;
    }
    
      public int obtenerConsulta(String especial){
         String query = "SELECT* FROM CONSULTA WHERE ESPECIALIDAD_nombre=?";

        try {
            //Se establecen los parametros del PreparedStament
           PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setString(1, especial);
            //Ejecuta el select
            ResultSet rs = st.executeQuery();
            int code=0;
            while (rs.next()) {
                code=rs.getInt("codigo");
                
            }
            
                    return code;
        } catch (Exception e) {
             JOptionPane.showMessageDialog(null,e);
        }
        return 0;
     }
}
