<%-- 
    Document   : MedicosMasExamenes
    Created on : Oct 8, 2020, 4:39:30 AM
    Author     : potz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Orden_Examen"%>
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
        <title>Medicos con mas examenes</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp"%>
        <form>
            <div class="caja">
                
                <% Orden_Examen ie = new Orden_Examen();%>         
                <table class="containero" style="z-index: 99;">
                    <% 

                        try {
                            ResultSet rs = null;

                            rs = ie.buscarInformeExamenesMas();
                            if (!(rs.next())) {
                    %><h4>No hay ningun Examen</h4><%
                    } else {
                        rs = ie.buscarInformeExamenesMas();

                    %> <tr>
                        <th><h1>Cantidad</h1></th>
                        <th><h1>Medico</h1></th>
                        <th><h1>Examen</h1></th>
                    </tr>
                    <%                        while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("cantidad"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("medico"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>No hay ningun Examen</h3><%
                    }%>







            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>



