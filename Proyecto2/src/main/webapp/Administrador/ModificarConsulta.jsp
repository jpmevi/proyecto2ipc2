<%-- 
    Document   : ModificarConsulta
    Created on : Oct 3, 2020, 6:01:06 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entity.Consulta"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");
    try {
        if (!codigo.equals("")) {
            session.setAttribute("Consulta", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoConsulta = String.valueOf(session.getAttribute("Consulta"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css?3.0">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Modificar Examen</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">

                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por especialidad?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>
                <table class="containero" style="z-index: 99;">
                    <%String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        }else{
                        filtro="";
                        }
                        try {
                            
                            Consulta ex = new Consulta();
                            ResultSet rs = null;
                            rs = ex.buscarConsulta(filtro);
                            if (!(rs.next())) {
                    %><h4>No hay ninguna Consulta para modificar</h4><%
                    } else {
                        rs = ex.buscarConsulta(filtro);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Costo</h1></th>
                        <th><h1>Especialidad</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("costo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("ESPECIALIDAD_nombre"))%></h2></td>

                        <td>

                            <h2><a href="ModificarConsulta.jsp?codigo=<%=rs.getInt("codigo")%>&costo=<%=rs.getString("costo")%>">Modificar</a></h2>
                        </td>
                    </tr>

                    <%
                        }%>

                </table>
                <% if (!(request.getParameter("costo") == null)) {

                %>


                <input value=<%=request.getParameter("costo")%> type="number" name="costo" step="0.01" min="0" style="width: 97%; margin: 10px;" placeholder="Costo" required>

                <button class="draw" type="submit" name="gen">Modificar</button>
                <%

                                if (!(request.getParameter("gen") == null)) {

                                    double costo = Double.parseDouble(request.getParameter("costo"));

                                    int codigod = Integer.parseInt(codigoConsulta);

                                    ex.actualizarConsulta(codigod, costo);
                                    response.sendRedirect("ModificarConsulta.jsp");

                                }
                            }

                        }
                    } catch (Exception e) {
 %><h3>Error al modificar La consulta</h3><%
                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
    </body>
</html>
