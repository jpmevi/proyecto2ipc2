<%-- 
    Document   : ConfirmarInforme
    Created on : Oct 7, 2020, 6:58:54 PM
    Author     : potz
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String paciente = request.getParameter("paciente");
    String examen = request.getParameter("examen");
    String codigo = request.getParameter("codigo");
    try {
        if (!paciente.equals("")) {
            session.setAttribute("Pac", request.getParameter("paciente"));
        }
        if (!examen.equals("")) {
            session.setAttribute("Exa", request.getParameter("examen"));
        }
        if (!codigo.equals("")) {
            session.setAttribute("Cita", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoPaciennte = String.valueOf(session.getAttribute("Pac"));
    String codigoExa = String.valueOf(session.getAttribute("Exa"));
    String codigocita = String.valueOf(session.getAttribute("Cita"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?6.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Confirmar Informe</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp"%>
        <form method="post" action="../ArchivoInforme">
            <div class="caja">
                <label ><%=LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute())%></label>
                <label ><%=LocalDate.now()%></label>
                <textarea id="subject" name="descripcion" placeholder="Descripcion.." required ></textarea>
                <button class="draw" type="submit" name="gen">Generar</button>
            </div>
        </form>
                <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
