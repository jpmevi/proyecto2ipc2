<%-- 
    Document   : index
    Created on : Sep 28, 2020, 12:56:13 AM
    Author     : potz
--%>
<%@page import="java.sql.Blob"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="Entity.*"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entity.Paciente"%>
<%@page import="DataBase.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% 
                Conexion conexion = new Conexion();
                conexion.conexionDB();
                Paciente paciente = new Paciente("pa1", "pedro", "pepe", LocalDate.now(), "123", "4566", "10kg", "o positivo", "prueba@gmail.com", "paciente");
                Medico medico = new Medico("A5", "GFRE", "555", "3007", "352311", "GFREI@GMAIL.COM", LocalTime.of(10, 00, 00), LocalTime.of(20, 00, 00), LocalDate.now(), "ELSABROSON","Urologo");
                Administrador admin = new Administrador("A4", "POPO", "1234567890", "252525");
                //Especialidad especial = new Especialidad("OTORRINO");
                //Consulta consulta = new Consulta(13.4, "OTORRINO");
                //Cita_Medica medica = new Cita_Medica("A6", LocalDate.now(), LocalTime.now(), "a1", "A2", "3");
                //Informe_Consulta consi = new Informe_Consulta("Cod1", "PRUEBA", LocalDate.now(), LocalTime.now(), 2, "a1", "A2");
                //Examen exa =new Examen("E1", "Examen", "Descripcion", true, 23.7, "pdf");
                //Laboratorista labo = new Laboratorista("A3", "PEPE", "12345", "11111", "222233", "LABORATORISTA@GMAIL.COM", LocalDate.now(), "ALmamarcelagozo", "E1");
                /*Cita_Examen exaM = new Cita_Examen(LocalDate.now(), LocalTime.now(), null, "a1", "E1", "A3");
                Informe_Examen infr = new Informe_Examen("IE1", "DESCRIPCION", LocalDate.now(), LocalTime.now(), "E1", "a1", "A3");
                Archivo_Informe or = new Archivo_Informe(null, "IE1");
                Especializacion esp = new Especializacion("OTORRINO", "A2");
                Orden_Examen OE = new Orden_Examen("PRUEBN", "a1", "A2", "E1");
                //Archivo_Orden archivsse = new Archivo_Orden(, 1);
                Dias_Trabajo dias = new Dias_Trabajo("LUNES", "A3");*/
    %>
    </body>
</html>
