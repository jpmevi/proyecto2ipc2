<%-- 
    Document   : CrearMedico
    Created on : Oct 3, 2020, 9:58:33 PM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DataBase.Conexion"%>
<%@page import="Entity.Medico"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700'>
        <title>Crear Medico</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <h4>Ingresar Medico:</h4>
                <div class="inputAnimate">
                    <input type="text" placeholder="Codigo" name="codigo" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" name="nombre" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Colegiado" name="colegiado" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Dpi" name="dpi" required>
                </div>
                <div class="inputAnimate">
                    <input type="number" placeholder="Telefono" name="telefono" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Correo" name="correo" required>
                </div>
                <div class="inputAnimate">
                    <input type="time" id="appt" value="00:00" name="horaentrada" required>
                </div>
                <div class="inputAnimate">
                    <input type="time" value="00:00" name="horasalida" required>
                </div>
                <h4>Fecha de inicio:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required >

                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Especialidad" name="especialidad" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Password" name="password" required>
                </div>
                
                
                <button class="draw" type="submit" name="gen">Generar</button>

                <%
                    if (!(request.getParameter("gen") == null)) {
                        
                            try {
                                LocalTime horaentrada= LocalTime.parse(request.getParameter("horaentrada"));
                                 LocalTime horasalida= LocalTime.parse(request.getParameter("horasalida"));
                                 
                                 if(horaentrada.isBefore(horasalida)){
                                 String fecha = String.valueOf(request.getParameter("fecha"));
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate localDate = LocalDate.parse(fecha, formatter);
                                Medico me = new Medico(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("colegiado"), request.getParameter("dpi"), request.getParameter("telefono"), request.getParameter("correo"), horaentrada, horasalida, localDate, request.getParameter("password"), request.getParameter("especialidad"));
                                %><h3>Medico creado con exito</h3><%
                    }else{
                    %><h3>Horas mal ingresadas</h3><%
}
                                
                
                } catch (Exception e) {

                %><h4>Error al ingresar el medico</h4><%                            }

                    }
                %>
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
