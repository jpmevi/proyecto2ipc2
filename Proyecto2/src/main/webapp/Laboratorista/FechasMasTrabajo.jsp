<%-- 
    Document   : FechasMasTrabajo
    Created on : Oct 7, 2020, 8:34:14 PM
    Author     : potz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Informe_Examen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Fechas con mas trabajo</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp"%>
        <form>
            <div class="caja">
                
                <% Informe_Examen cm = new Informe_Examen();%>         
                <table class="containero" style="z-index: 99;">
                    <%
                            String filtro;
                            try {
                                ResultSet rs = null;
                                
                                rs = cm.buscarInforme10fechas( String.valueOf(session.getAttribute("Laboratorista")));
                                if (!(rs.next())) {
                    %><h4>No hay ningun Examen realizado</h4><%
                    } else {
                        rs = cm.buscarInforme10fechas( String.valueOf(session.getAttribute("Laboratorista")));

                    %> <tr>
                        <th><h1>Cantidad</h1></th>
                        <th><h1>Fecha</h1></th>
                    </tr>
                    <%                        while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("cantidad"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>No hay ningun Examen realizado</h3><%
                        
                    }%>







            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>


