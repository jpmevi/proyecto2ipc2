<%-- 
    Document   : GenerarOrden
    Created on : Oct 6, 2020, 10:36:26 PM
    Author     : potz
--%>

<%@page import="Entity.Examen"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Paciente"%>
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
        <title>Generar Orden</title>
    </head>
    <body>
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

                    <% 
                        String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        }else{
                        filtro="";
                        }
                        try {
                           
                            Paciente ex = new Paciente();
                            ResultSet rs = null;
                            rs = ex.buscarPaciente(filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Paciente para modificar</h4><%
                    } else {
                        rs = ex.buscarPaciente(filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Sexo</h1></th>
                        <th><h1>Fecha Nacimiento</h1></th>
                        <th><h1>DPI</h1></th>
                        <th><h1>Telefono</h1></th>
                        <th><h1>Peso</h1></th>
                        <th><h1>Sangre</h1></th>
                        <th><h1>Correo</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("sexo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha_nacimiento"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("dpi"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("telefono"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("peso"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("sangre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("correo"))%></h2></td>
                        <td>
                            <h2><a href="ConfirmarOrden.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>">Generar Orden</a></h2>
                        </td>
                    </tr>
                    <%
                        }%>
                </table>
               <%
    }
} catch (Exception e) {
                %><h3>Error al modificar el paciente</h3><%
                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
