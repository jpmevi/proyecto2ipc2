<%-- 
    Document   : ModificarLaboratorista
    Created on : Oct 4, 2020, 4:07:14 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entity.Examen"%>
<%@page import="DataBase.Conexion"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Entity.Laboratorista"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");
    String codigo2 = request.getParameter("codigoexamen");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("Lab", request.getParameter("codigo"));
        }
        if (!codigo2.equals("")) {
            session.setAttribute("EX", request.getParameter("codigoexamen"));
        }

    } catch (Exception e) {
    }
    String codigoLabora = String.valueOf(session.getAttribute("Lab"));
    String codigoex = String.valueOf(session.getAttribute("EX"));
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
        <title>Modificar Laboratorista</title>
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
                        <th><h1>Registro</h1></th>
                        <th><h1>DPI</h1></th>
                        <th><h1>Telefono</h1></th>
                        <th><h1>Correo</h1></th>
                        <th><h1>Fecha inicio</h1></th>
                        <th><h1>Codigo Examen</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("registro"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("DPI"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("telefono"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("correo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha_inicio"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                        <td>
                            <h2><a href="ModificarLaboratorista.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&registro=<%=rs.getString("registro")%>&fecha=<%=rs.getDate("fecha_inicio")%>&dpi=<%=rs.getString("DPI")%>&telefono=<%=rs.getString("telefono")%>&correo=<%=rs.getString("correo")%>&codigoexamen=<%=rs.getString("EXAMEN_codigo")%>&password=<%=rs.getString("password")%>">Modificar</a></h2>
                        </td>
                    </tr>

                    <%
                        }%>

                </table>
                <% if (!(request.getParameter("nombre") == null)) {


                %>
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" name="nombre" required value=<%=request.getParameter("nombre")%> >
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Registro" required name="registro" value=<%=request.getParameter("registro")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Dpi" name="dpi" required value=<%=request.getParameter("dpi")%>>
                </div>
                <div class="inputAnimate">
                    <input type="number" placeholder="Telefono" required name="telefono" value=<%=request.getParameter("telefono")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Correo" required name="correo" value=<%=request.getParameter("correo")%>>
                </div>

                <div class="inputAnimate">
                    <input type="text" placeholder="Password" required name="password" value=<%=request.getParameter("password")%>>
                </div>
                <h4>Fecha de Inicio:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required value=<%=request.getParameter("fecha")%> >
                </div>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="examen">

                        <%
                            Examen exa = new Examen("");
                            ResultSet restabla = exa.buscarExamen(codigoex);
                            ResultSet res = exa.buscarExamen("");

                            if (!res.next()) {
                        %><option value="0">No hay Examenes</option><%
                        } else {
                            res = exa.buscarExamen("");
                            restabla.next();
                        %><option value=<%=restabla.getInt("codigo")%>><%=restabla.getString("nombre")%></option><%

                            while (res.next()) {

                        %><option value=<%=res.getInt("codigo")%>><%=res.getString("nombre")%></option><%

                                }
                            }%>



                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Modificar</button>
                <%
                    if (!(request.getParameter("gen") == null)) {
                        String nombre = request.getParameter("nombre");
                        String fecha = String.valueOf(request.getParameter("fecha"));
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate localDate = LocalDate.parse(fecha, formatter);
                        ex.actualizarLaboratorista(codigoLabora, nombre, request.getParameter("registro"), request.getParameter("dpi"), request.getParameter("telefono"), request.getParameter("correo"), localDate, request.getParameter("password"), request.getParameter("examen"));
                        response.sendRedirect("ModificarLaboratorista.jsp");
                %><h3>Laboratorista Modificado con exito</h3><%
                                     }
                                 }

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


