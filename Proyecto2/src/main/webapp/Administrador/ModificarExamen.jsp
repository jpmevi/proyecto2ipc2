<%-- 
    Document   : ModificarExamen
    Created on : Oct 3, 2020, 3:46:32 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DataBase.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Examen"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("Examen", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoExamen = String.valueOf(session.getAttribute("Examen"));
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
        <title>Modificar Examen</title>
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

                    <% if (!(request.getParameter("filtro") == null)) {
                            String filtro = request.getParameter("filtro");
                            try {
                                if (!filtro.equals("")) {
                                    session.setAttribute("Filtro", request.getParameter("filtro"));
                                }
                            } catch (Exception e) {
                            }

                        }
                        String filtrofinal = String.valueOf(session.getAttribute("Filtro"));
                        try {
                            if (filtrofinal.equals("null")) {
                                filtrofinal = "";
                            }
                            Examen ex = new Examen("");
                            ResultSet rs = null;
                            rs = ex.buscarExamen(filtrofinal);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Examen para modificar</h4><%
                    } else {
                        rs = ex.buscarExamen(filtrofinal);

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Orden</h1></th>
                        <th><h1>Costo</h1></th>
                        <th><h1>Tipo Archivo</h1></th>
                        <th><h1>Modificar</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("orden"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("costo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("tipo_archivo"))%></h2></td>

                        <td>

                            <h2><a href="ModificarExamen.jsp?nombre=<%=rs.getString("nombre")%>&codigo=<%=rs.getString("codigo")%>&descripcion=<%=rs.getString("descripcion")%>&tipo=<%=rs.getString("tipo_archivo")%>&orden=<%=rs.getString("orden")%>&costo=<%=rs.getString("costo")%>">Modificar</a></h2>
                        </td>
                    </tr>

                    <%
                        }%>

                </table>
                <% if (!(request.getParameter("nombre") == null)) {


                %>
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" required name="nombre" value=<%=request.getParameter("nombre")%>>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Tipo" name="tipo" required value=<%=request.getParameter("tipo")%>>
                </div>
                <textarea name="descripcion" rows="10" cols="40" style="width: 97%; margin: 10px;" placeholder="Descripcion" required><%=request.getParameter("descripcion")%></textarea>
                <input value=<%=request.getParameter("costo")%> type="number" name="costo" step="0.01" min="0" style="width: 97%; margin: 10px;" placeholder="Costo" required>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="orden">
                        <% String orden = request.getParameter("orden");
                            if (orden.equals("0")) {
                                orden = "No";
                            } else {
                                orden = "Si";
                            }
                        %>
                        <option value=<%=orden%>><%=orden%></option>
                        <option value="Si">Si</option>
                        <option value="No">No</option>
                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Modificar</button>
                <%

                            if (!(request.getParameter("gen") == null)) {
                                boolean ordenboo = false;

                                double costo = Double.parseDouble(request.getParameter("costo"));
                                if (request.getParameter("orden").equals("Si")) {
                                    ordenboo = true;
                                } else {
                                    ordenboo = false;
                                }
                                String nombre = request.getParameter("nombre");
                                String descripcion = request.getParameter("descripcion");
                                String tipo = request.getParameter("tipo");
                                int codigod = Integer.parseInt(codigoExamen);
                                ex.actualizarExamen_laboratorio(nombre, descripcion, ordenboo, costo, tipo, codigod);
                                response.sendRedirect("ModificarExamen.jsp");

                            }
                        }

                    }
                } catch (Exception e) {
                %><h3>Error al modificar el Examen</h3><%
     }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
