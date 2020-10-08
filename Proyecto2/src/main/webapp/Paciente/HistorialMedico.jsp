<%-- 
    Document   : HistorialMedico
    Created on : Oct 7, 2020, 9:06:39 PM
    Author     : potz
--%>

<%@page import="Entity.Informe_Examen"%>
<%@page import="Entity.Informe_Consulta"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
         <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Ver historial</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">  
                <h4  >Informes de consulta:</h4>
                <%                   
                    try {
                        ResultSet rs = null;
                        String dato = request.getParameter("dato");
                       Informe_Consulta ic=new Informe_Consulta();
                        rs = ic.buscarInforme(String.valueOf(session.getAttribute("Paciente")));
                %>
                 <table class="containero" style="z-index: 99;">
                    <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                    </tr>
                    <%      while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                    </tr>
                    <%
                        }
                    %></table><%
                    } catch (Exception e) {
                    %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                %>
                
                <h4  >Informes de examen:</h4>
                 <%                   
                    try {
                        ResultSet rs = null;
                        String dato = request.getParameter("dato");
                       Informe_Examen ie=new Informe_Examen();
                        rs = ie.buscarInforme(String.valueOf(session.getAttribute("Paciente")));
                %>
                 <table class="containero" style="z-index: 99;">
                    <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                    </tr>
                    <%      while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                    </tr>
                    <%
                        }
                    %></table><%
                    } catch (Exception e) {
                    %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                %>





    </div>
                </div>
        </form>


<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>

    </body>
</html>
