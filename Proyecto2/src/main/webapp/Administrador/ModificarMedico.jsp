<%-- 
    Document   : ModificarMedico
    Created on : Oct 4, 2020, 12:59:13 AM
    Author     : potz
--%>

<%@page import="Encrypt.Encriptar"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Medico"%>
<%@page import="DataBase.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("Medi", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoMedico = String.valueOf(session.getAttribute("Medi"));
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
        <title>Modificar Medico</title>
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



                    <% String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        } else {
                            filtro = "";
                        }

                        try {

                            Medico ex = new Medico("");
                            ResultSet rs = null;
                            rs = ex.buscarMedico(filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Medico para modificar</h4><%
                    } else {
                        rs = ex.buscarMedico(filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Colegiado</h1></th>
                        <th><h1>DPI</h1></th>
                        <th><h1>Telefono</h1></th>
                        <th><h1>Correo</h1></th>
                        <th><h1>Hora entrada</h1></th>
                        <th><h1>Hora salida</h1></th>
                        <th><h1>Fecha inicio</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("colegiado"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("DPI"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("telefono"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("correo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora_entrada"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora_salida"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha_inicio"))%></h2></td>
                        <td>
                            <h2><a href="ModificarMedico.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&colegiado=<%=rs.getString("colegiado")%>&fecha=<%=rs.getDate("fecha_inicio")%>&dpi=<%=rs.getString("DPI")%>&telefono=<%=rs.getString("telefono")%>&correo=<%=rs.getString("correo")%>&horaentrada=<%=rs.getTime("hora_entrada")%>&horasalida=<%=rs.getTime("hora_salida")%>&password=<%=rs.getString("password")%>">Modificar</a></h2>
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
                    <input type="text" placeholder="Colegiado" required name="colegiado" value=<%=request.getParameter("colegiado")%>>
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
                    <input type="password" placeholder="Password" required name="password" value=<%=Encriptar.desencriptar( request.getParameter("password"))%>>
                </div>
                <div class="inputAnimate">
                    <input type="time" value="<%=String.valueOf(request.getParameter("horaentrada"))%>" name="horaentrada" required>
                </div>
                <div class="inputAnimate">
                    <input type="time" value="<%=String.valueOf(request.getParameter("horasalida"))%>" name="horasalida" required>
                </div>
                <h4>Fecha de Inicio:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required value=<%=request.getParameter("fecha")%> >
                </div>
                <button class="draw" type="submit" name="gen">Modificar</button>
                <%
                    if (!(request.getParameter("gen") == null)) {
                        LocalTime horaentrada = LocalTime.parse(request.getParameter("horaentrada"));
                        LocalTime horasalida = LocalTime.parse(request.getParameter("horasalida"));
                        if (horaentrada.isBefore(horasalida)) {
                            String nombre = request.getParameter("nombre");
                            String fecha = String.valueOf(request.getParameter("fecha"));
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                            LocalDate localDate = LocalDate.parse(fecha, formatter);
                            ex.actualizarMedico(codigoMedico, nombre, request.getParameter("colegiado"), request.getParameter("dpi"), request.getParameter("telefono"), request.getParameter("correo"), horaentrada, horasalida, localDate, request.getParameter("password"));
                            response.sendRedirect("ModificarMedico.jsp");
                %><h3>Medico Modificado con exito</h3><%
                } else {
                %><h3>No ingreso bien la hora</h3><%
                                }

                            }
                        }

                    }
                } catch (Exception e) {
                %><h3>Error al modificar el medico</h3><%
                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

