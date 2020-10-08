<%-- 
    Document   : ConfirmarCita
    Created on : Oct 7, 2020, 5:36:34 AM
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
<%String fecha =request.getParameter("fecha");
try {
        if (!fecha.equals("")) {
            session.setAttribute("Fecha", request.getParameter("fecha"));
        }
        
    } catch (Exception e) {
    
    }
    String fechaFinal = String.valueOf(session.getAttribute("Fecha"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Confirmar cita</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form action="../AgendarConsulta" method="post">
            <div class="caja">
        <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
            <select name="atributo">
                <% 
                    IntervaloHoras in = new IntervaloHoras(String.valueOf(session.getAttribute("Medico")), Date.valueOf(fecha));
                    ArrayList listahoras = in.citasMedicasDisponibles();
                    if (listahoras.size() == 0) {
                        listahoras.add("No existen horas disponibles en esa fecha");
                    } else {
                %> <option value="Seleccione Hora:">Seleccione Hora:</option><%
                    }
                    for (int i = 0; i < listahoras.size(); i++) {
                %>
                <option value<%=listahoras.get(i)%>><%=listahoras.get(i)%></option>
                <%}%>
            </select>
        </div>
            
        <button class="draw" type="submit" name="cita">Crear Cita</button>
        </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
