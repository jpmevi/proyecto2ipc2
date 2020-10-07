<%-- 
    Document   : ModificarPaciente
    Created on : Oct 3, 2020, 6:49:02 PM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="DataBase.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("PAC", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoPaciente = String.valueOf(session.getAttribute("PAC"));
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
        <title>Modificar Paciente</title>
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
                            <h2><a href="ModificarPaciente.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&sexo=<%=rs.getString("sexo")%>&fecha=<%=rs.getDate("fecha_nacimiento")%>&dpi=<%=rs.getString("dpi")%>&telefono=<%=rs.getString("telefono")%>&peso=<%=rs.getString("peso")%>&sangre=<%=rs.getString("sangre")%>&correo=<%=rs.getString("correo")%>&password=<%=rs.getString("password")%>">Modificar</a></h2>
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
                    <input type="text" placeholder="Dpi" name="dpi" required value=<%=request.getParameter("dpi")%>>
                </div>
                <div class="inputAnimate">
                    <input type="number" placeholder="Telefono" required name="telefono" value=<%=request.getParameter("telefono")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Peso" required name="peso" value=<%=request.getParameter("peso")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Sangre" required name="sangre" value=<%=request.getParameter("sangre")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Correo" required name="correo" value=<%=request.getParameter("correo")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Password" required name="password" value=<%=request.getParameter("password")%>>
                </div>
                <h4>Fecha de Nacimiento:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required value=<%=request.getParameter("fecha")%> >

                </div>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="sexo">
                        <% String sexo = request.getParameter("sexo");

                        %>
                        <option value=<%=sexo%>><%=sexo%></option>
                        <option value="Masculino">Hombre</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Modificar</button>
                <%
                    if (!(request.getParameter("gen") == null)) {
                        String nombre = request.getParameter("nombre");
                        int telefono = Integer.parseInt(request.getParameter("telefono"));
                        String fecha = String.valueOf(request.getParameter("fecha"));
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        LocalDate localDate = LocalDate.parse(fecha, formatter);
                        Paciente ps = new Paciente();

                        ps.actualizarPaciente(codigoPaciente, nombre, sexo, localDate, request.getParameter("dpi"), String.valueOf(request.getParameter("telefono")), request.getParameter("peso"), request.getParameter("sangre"), request.getParameter("correo"), request.getParameter("password"));
                        response.sendRedirect("ModificarPaciente.jsp");
                %><h3>Paciente Modificado con exito</h3><%
                }
        }

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
