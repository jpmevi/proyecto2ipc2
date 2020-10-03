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
    String codigoExamen = String.valueOf(session.getAttribute("Examen"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css?2.0">
        <link rel="stylesheet" href="../css/textstyle.css?4.0">
        <link rel="stylesheet" href="../css/tablestyle.css?4.0">
        <link rel="stylesheet" href="../css/select.css?2.0">
        <link rel="stylesheet" href="../css/button.css?2.0">
        <title>Modificar Examen</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">

                <table class="containero" style="z-index: 99;">
                    <%  Conexion conexion = new Conexion();
                        conexion.conexionDB();
                        try {
                            Examen ex = new Examen("");
                            ResultSet rs = null;
                            rs = ex.buscarExamen();
                            if (!(rs.next())) {
                    %><h4>No hay ningun Examen para modificar</h4><%
                    } else {
                        rs = ex.buscarExamen();

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
                    <input type="text" placeholder=<%=request.getParameter("nombre")%> name="nombre" value=<%=request.getParameter("nombre")%> >
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder=<%=request.getParameter("tipo")%> name="tipo" value=<%=request.getParameter("tipo")%>>
                </div>
                <textarea name="descripcion" rows="10" cols="40" style="width: 97%; margin: 10px;" placeholder=<%=request.getParameter("descripcion")%>><%=request.getParameter("descripcion")%></textarea>
                <input value=<%=request.getParameter("costo")%> type="number" name="costo" step="0.01" min="0" style="width: 97%; margin: 10px;" placeholder=<%=request.getParameter("costo")%> >
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

                                if (!(request.getParameter("gen") == null) && !(request.getParameter("nombre") == null) && !(request.getParameter("tipo") == null) && !(request.getParameter("descripcion") == null) && !(request.getParameter("costo") == null) && !(request.getParameter("orden") == "0")) {
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

                    }%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
