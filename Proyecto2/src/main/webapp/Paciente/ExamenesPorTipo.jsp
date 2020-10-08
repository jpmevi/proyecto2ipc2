<%-- 
    Document   : ExamenesPorTipo
    Created on : Oct 7, 2020, 11:58:38 PM
    Author     : potz
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Entity.Informe_Examen"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Examen"%>
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
        <title>Examenes Por tipo</title>
    </head>
    <body>
       <%@include file="header.jsp" %>
        <form>
        <div class="caja">
            <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                <select name="examen">
                    <%  Examen exa = new Examen("");
                        ResultSet rs = exa.buscarExamen("");
                        if (!rs.next()) {
                    %><option value="0">No hay Examenes</option><%
                    } else {
                        rs = exa.buscarExamen("");
                        while (rs.next()) {
                    %><option value=<%=rs.getString("codigo")%>><%=rs.getString("nombre")%></option><%
                            }
                        }%>
                </select>
            </div>
            <h4>Fecha inicio:</h4>
            <div class="inputAnimate">
                <input type="date" id="start" name="fechainicio" 
                       min="1900-01-01" max="2022-12-31" required >

            </div>
            <h4>Fecha final:</h4>
            <div class="inputAnimate">
                <input type="date" id="start" name="fechafinal"
                       min="1900-01-01" max="2022-12-31" required >

            </div>
            <button class="draw" type="submit" name="gen">Filtrar</button>
             <table class="containero" style="z-index: 99;">
            <% if(!(request.getParameter("gen")==null)){ Informe_Examen cm = new Informe_Examen();
            
                      String fechainicio = String.valueOf(request.getParameter("fechainicio"));
                      String fechafinal = String.valueOf(request.getParameter("fechafinal"));
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate fechai= LocalDate.parse(fechainicio, formatter);
                                LocalDate fechaf= LocalDate.parse(fechafinal, formatter);
                        try {
                            

                             rs = null;
                            String atributo = "";
                            if (!(request.getParameter("atributo") == null)) {
                                atributo = request.getParameter("atributo");
                            } else {
                                atributo = "codigo";
                            }
                            rs = cm.buscarInformeIntervalo(String.valueOf(session.getAttribute("Paciente")),request.getParameter("examen"),fechai,fechaf);
                            if (!(rs.next())) {
                    %><h4>No hay ningun Examen</h4><%
                    } else {
                        rs = cm.buscarInformeIntervalo(String.valueOf(session.getAttribute("Paciente")),request.getParameter("examen"),fechai,fechaf);
                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Descripcion</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                        <th><h1>Examen</h1></th>


                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("descripcion"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("examen"))%></h2></td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>Error con la cita</h3><%
                    }}%>
        </div>
         </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
