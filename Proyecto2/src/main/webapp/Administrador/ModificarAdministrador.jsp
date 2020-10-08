<%-- 
    Document   : ModificarAdministrador
    Created on : Oct 4, 2020, 5:26:59 AM
    Author     : potz
--%>

<%@page import="Encrypt.Encriptar"%>
<%@page import="DataBase.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("ADMI", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoAdmi = String.valueOf(session.getAttribute("ADMI"));
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
        <title>Modificar Administrador</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por codigo?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>
                <table class="containero" style="z-index: 99;">

                    <% String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        }else{
                        filtro="";
                        }
                       
                        try {
                            
                            Administrador ad = new Administrador();
                            ResultSet rs = null;
                            rs = ad.buscarAdmin(filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Administrador para modificar</h4><%
                    } else {
                        rs = ad.buscarAdmin(filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>DPI</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("dpi"))%></h2></td>

                        <td>
                            <h2><a href="ModificarAdministrador.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&dpi=<%=rs.getString("dpi")%>&password=<%=rs.getString("password")%>">Modificar</a></h2>
                           
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
                    <input type="password" placeholder="Password" required name="password" value=<%=Encriptar.desencriptar( request.getParameter("password"))%>>
                </div>

                <button class="draw" type="submit" name="gen">Modificar</button>
                <%
                    if (!(request.getParameter("gen") == null)) {

                        ad.actualizarAdmin(codigoAdmi, request.getParameter("nombre"), request.getParameter("dpi"), request.getParameter("password"));
                        response.sendRedirect("ModificarAdministrador.jsp");
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
