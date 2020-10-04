<%-- 
    Document   : CrearLaboratorista
    Created on : Oct 4, 2020, 2:33:34 AM
    Author     : potz
--%>

<%@page import="Entity.Dias_Trabajo"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entity.Laboratorista"%>
<%@page import="DataBase.Conexion"%>
<%@page import="Entity.Examen"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700'>
        <title>Crear Paciente</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <h4>Ingresar Laboratorista:</h4>
                <div class="inputAnimate">
                    <input type="text" placeholder="Codigo" name="codigo" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" name="nombre" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Registro" name="registro" required>
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
                    <input type="text" placeholder="Password" name="password" required>
                </div>
                <h4>Fecha de inicio:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required >
                </div>



                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="examen">

                        <%  
                            Examen exa = new Examen("");
                            ResultSet rs = exa.buscarExamen("");
                            if (!rs.next()) {
                        %><option value="0">No hay Examenes</option><%
                        } else {
                            rs = exa.buscarExamen("");
                        %><option value="0">Seleccione Examen:</option><%
                            while (rs.next()) {
                        %><option value=<%=rs.getString("codigo")%>><%=rs.getString("nombre")%></option><%
                                }
                            }%>



                    </select>
                </div>
                            <h4>Dias que trabaja:</h4>
                            <input type="checkbox" id="lunes" name="Lunesd" value="Lunes">
                            <label for="lunes">Lunes</label>
                            <input type="checkbox" id="martes" name="Martesd" value="Martes">
                            <label for="martes">Martes</label>
                            <input type="checkbox" id="miercoles" name="Miercolesd" value="Miercoles">
                            <label for="miercoles">Martes</label>
                            <input type="checkbox" id="jueves" name="Juevesd" value="Jueves">
                            <label for="jueves">Jueves</label>
                            <input type="checkbox" id="viernes" name="Viernesd" value="Viernes">
                            <label for="viernes">Viernes</label>
                            <input type="checkbox" id="sabado" name="Sabadod" value="Sabado">
                            <label for="sabado">Sabado</label>
                            <input type="checkbox" id="domingo" name="Domingod" value="Domingo">
                            <label for="domingo">Domingo</label></br>
                <button class="draw" type="submit" name="gen">Generar</button>

                <%
                    if (!(request.getParameter("gen") == null)) {
                        try {
                        JOptionPane.showMessageDialog(null, "si");
                            String fecha = String.valueOf(request.getParameter("fecha"));
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                            LocalDate localDate = LocalDate.parse(fecha, formatter);
                            Laboratorista lab = new Laboratorista(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("registro"), request.getParameter("dpi"), request.getParameter("telefono"), request.getParameter("correo"), localDate, request.getParameter("password"), request.getParameter("examen"));
                            if (!(request.getParameter("Lunesd") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Lunesd"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Martesd") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Martesd"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Miercolesd") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Miercolesd"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Juevesd") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Juevesd"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Viernesd") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Viernesd"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Sabadod") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Sabadod"), request.getParameter("codigo"));
                            }
                            if (!(request.getParameter("Domingod") == null)) {
                            Dias_Trabajo dias= new Dias_Trabajo(request.getParameter("Domingod"), request.getParameter("codigo"));
                            }

                %><h3>Laboratorista creado con exito</h3><%                } catch (Exception e) {

                %><h4>Error al crear el laboratorista</h4><%                            }
                    }
                %>
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

