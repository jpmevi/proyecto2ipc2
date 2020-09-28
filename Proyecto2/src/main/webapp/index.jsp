<%-- 
    Document   : index
    Created on : Sep 28, 2020, 12:56:13 AM
    Author     : potz
--%>
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
                Paciente paciente = new Paciente("a1", "pedro", "pepe", LocalDate.now(), "123", "4566", "10kg", "o positivo", "prueba@gmail.com", "Juanpablo07");
                paciente.insertarPaciente();
    %>
    </body>
</html>
