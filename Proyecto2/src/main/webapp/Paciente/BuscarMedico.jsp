<%-- 
    Document   : BuscarMedico
    Created on : Sep 30, 2020, 3:36:04 AM
    Author     : potz
--%>

<%@page import="java.sql.Time"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Medico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/search.css">
        <link rel="stylesheet" href="../css/select.css">
        <title>Buscar Medico</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <form>
            <div class="caja"style="z-index: 100;">
                <div class="contenedorselect1"  >
                    <div class="custom-select" style="width:200px;">
                        <select name="atributo">
                            <option value=0>TIPO DE BUSQUEDA:</option>
                            <option value="Nombre">Nombre</option>
                            <option value="Especialidad">Especialidad</option>
                            <option value="Hora">Hora</option>
                            <option value="Fecha">Fecha</option>
                        </select>
                    </div>
                </div>
                <div class="wrap" >
                    <div class="search" >
                        <input type="text" class="searchTerm" placeholder="Buscar Medico por nombre" name="dato">
                        <button type="submit" class="searchButton">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>


                <% if (!(request.getParameter("dato") == null)) {
                        try {
                            ResultSet rs = null;
                            String dato = request.getParameter("dato");
                            Medico login = new Medico(dato);
                            switch (request.getParameter("atributo")) {
                                case "Nombre":
                                    rs = login.buscarMedico("nombre", dato);
                                    break;
                                case "Especialidad":
                                    rs = login.buscarEspecialidad("especialidad", dato);
                                    break;
                                case "Hora":
                                    rs = login.buscarHora("especialidad", dato);
                                    break;
                            }


                %>
            </div>
            <div class="tbla" style="z-index: 99;">
                <table class="containero" style="z-index: 99;">
                    <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Hora Entrada</h1></th>
                        <th><h1>Hora Salida</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Especialidad</h1></th>
                        <th><h1>Costo</h1></th>
                        <th><h1>Cita</h1></th>

                    </tr>
                    <%      while (rs.next()) {


                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora_entrada"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora_salida"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha_inicio"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("especialidad_nombre"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("costo"))%></h2></td>
                        <td>

                            <h2><a href="AgendarConsulta.jsp?codigo=<%=rs.getString("codigo")%>&especialidad=<%=rs.getString("especialidad_nombre")%>">Agendar Cita</a></h2>
                        </td>
                    </tr>


                    <%
                        }
                    %></table><%
                    } catch (Exception e) {
                    %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                        }%>



            </div>



        </form>



        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
