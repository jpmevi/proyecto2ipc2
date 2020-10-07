<%-- 
    Document   : AgendarCita
    Created on : Oct 7, 2020, 5:10:41 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entity.Cita_Medica"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Funcion.IntervaloHoras"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");
    try {
        if (!codigo.equals("")) {
            session.setAttribute("Paci", request.getParameter("codigo"));
        }
        
    } catch (Exception e) {
    }
    String codigoPaciente = String.valueOf(session.getAttribute("Paci"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/button.css">
        <title>Agendar Consulta</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form action="ConfirmarCita.jsp?fecha=<%=request.getParameter("fecha")%>">
            <div class="caja">




                <div class="inputAnimate">

                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required>
                </div>
                <button class="draw" type="submit" name="disponible">Ver disponbilidad</button>


            </div>
            <!-- partial -->
            <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>

            <script type="text/javascript" src="../js/select.js"></script>

        </form>
    </body>
</html>

