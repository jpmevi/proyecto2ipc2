<%-- 
    Document   : AgendarExamen
    Created on : Oct 4, 2020, 11:39:15 PM
    Author     : potz
--%>

<%@page import="DataBase.Conexion"%>
<%@page import="Entity.Examen"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Laboratorista"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Ver Laboratorista</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por nombre?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>
                <table class="containero" style="z-index: 99;">

                    <% Conexion conexion = new Conexion();
                        conexion.conexionDB();
                        String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        } else {
                            filtro = "";
                        }
                        try {

                            Laboratorista ex = new Laboratorista();
                            ResultSet rs = null;
                            rs = ex.buscarLaboratorista(filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Medico para modificar</h4><%
                    } else {
                        rs = ex.buscarLaboratorista(filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Examen</h1></th>
                        <th><h1>Costo</h1></th>
                        <th><h1>Agendar Examen</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("costo"))%></h2></td>
                        <td>
                            <h2><a href="AgeExamen.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&codigoex=<%=rs.getString("codigoex")%>&orden=<%=rs.getBoolean("orden")%>">Agendar</a></h2>
                             
                        </td>
                    </tr>

                    <%
                        }%>

                </table>
                
                <%
                        }
                } catch (Exception e) {
                %><h3>Error al modificar el laboratorista</h3><%
                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
