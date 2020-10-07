<%-- 
    Document   : VerOrdenExamen
    Created on : Oct 7, 2020, 2:14:45 AM
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
        <link rel="stylesheet" href="../css/textstyle.css?5.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Ver orden</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <% Orden_Examen cm = new Orden_Examen();
                    %>


                
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
                            rs = cm.buscarOrden( String.valueOf(session.getAttribute("Paciente")),filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ninguna cita medica</h4><%
                    } else {
                        rs = cm.buscarOrden( String.valueOf(session.getAttribute("Paciente")),filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Medico</h1></th>
                        <th><h1>Examen</h1></th>
                        <th><h1>Ver Pdf</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("MEDICO_codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                        <td>
                            <h2><a href="../DescargarArchivo?orden=<%=rs.getString("codigo")%>">Ver pdf</a></h2>
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
