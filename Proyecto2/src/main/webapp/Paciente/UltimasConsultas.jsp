<%-- 
    Document   : UltimasConsultas
    Created on : Oct 8, 2020, 12:24:03 AM
    Author     : potz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Informe_Consulta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?5.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Ultimas consultas</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <% Informe_Consulta ie = new Informe_Consulta();
                   %>
                <table class="containero" style="z-index: 99;">

                    <%            
                        try {                            
                            ResultSet rs = null;
                            String atributo = "";
                            if (!(request.getParameter("atributo") == null)) {
                                atributo = request.getParameter("atributo");
                            } else {
                                atributo = "codigo";
                            }
                            rs = ie.buscarInformeUltimos5(String.valueOf(session.getAttribute("Paciente")));
                            if (!(rs.next())) {
                    %><h4>No hay ninguna consulta</h4><%
                    } else {
                        rs = ie.buscarInformeUltimos5(String.valueOf(session.getAttribute("Paciente")));

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                        <th><h1>Especialidad</h1></th>
                        <th><h1>Medico</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("ESPECIALIDAD_nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("MEDICO_codigo"))%></h2></td>

                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>Error con la cita</h3><%
                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
