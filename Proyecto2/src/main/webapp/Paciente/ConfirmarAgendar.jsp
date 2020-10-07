<%-- 
    Document   : ConfirmarAgendar
    Created on : Oct 6, 2020, 7:21:35 PM
    Author     : potz
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Laboratorista"%>
<%@page import="Entity.Cita_Examen"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigolab = String.valueOf(session.getAttribute("LAB"));
    String codigoexa = String.valueOf(session.getAttribute("EX"));
    String orden = String.valueOf(session.getAttribute("OR"));
    String fecha = String.valueOf(session.getAttribute("Fecha"));%>
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
        <form action="../AgendarCita" enctype="multipart/form-data" method="post">
        <div class="caja">
            <% if (orden.equals("true")) {
            %><input type="file" name="fichero" accept=".pdf" required><%
                        }%>
            <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                <select name="hora">
                    <%
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate localDate = LocalDate.parse(fecha, formatter);
                        Laboratorista labo = new Laboratorista(codigolab, localDate);
                        ArrayList listahoras = labo.citasExamenDisponibles();

                        if (listahoras.size() == 0) {
                            listahoras.add("No existen horas disponibles en esa fecha");
                        } else {
                        for (int i = 0; i < listahoras.size(); i++) {
                    %>

                    <option value<%=listahoras.get(i)%>><%=listahoras.get(i)%></option>

                    <%
                        }%>
                </select>
            </div><%
                }

                if (!(request.getParameter(
                        "gen") == null) && !(request.getParameter("hora") == "0")) {

                    
                }
            %>
            <label>Fecha: <%=fecha%></label></br>
            <button class="draw" type="submit" name="gen">Generar</button>
        </div>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
        </form>
    </body>
</html>
