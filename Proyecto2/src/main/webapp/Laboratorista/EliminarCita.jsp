<%-- 
    Document   : EliminarCita
    Created on : Oct 7, 2020, 7:24:14 PM
    Author     : potz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Cita_Examen"%>
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
        <title>Eliminar Cita</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <% Cita_Examen cm = new Cita_Examen();
                    if (!(request.getParameter("codigo") == null)) {
                        cm.eliminarCita(request.getParameter("codigo"));
                %><h3>Cita eliminada con exito</h3>
                <%}%>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="atributo">
                        <option value="codigo">Buscar por:</option>
                        <option value="codigo">Codigo</option>
                        <option value="hora">Hora</option>
                        <option value="fecha">Fecha</option>
                    </select>
                </div>
                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por codigo?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>
                <table class="containero" style="z-index: 99;">

                    <%            String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        }else{
                        filtro="";
                        }
                      
                        try {
                            

                            ResultSet rs = null;
                            String atributo = "";
                            if (!(request.getParameter("atributo") == null)) {
                                atributo = request.getParameter("atributo");
                            } else {
                                atributo = "codigo";
                            }
                            rs = cm.buscarCitaExamenLaboratorista(atributo, filtro, String.valueOf(session.getAttribute("Laboratorista")));
                            if (!(rs.next())) {
                    %><h4>No hay ninguna cita medica</h4><%
                    } else {
                       rs = cm.buscarCitaExamenLaboratorista(atributo, filtro, String.valueOf(session.getAttribute("Laboratorista")));

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                        <th><h1>Examen</h1></th>
                        <th><h1>Paciente</h1></th>
                        <th><h1>Eliminar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("paciente"))%></h2></td>
                        <td>
                            <h2><a href="EliminarCita.jsp?&codigo=<%=rs.getString("codigo")%>">Eliminar</a></h2>
                        </td>
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



