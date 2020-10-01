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
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <link rel="stylesheet" href="../css/buscarmedicostyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/search.css">
        <link rel="stylesheet" href="../css/select.css">
        <title>Buscar Medico</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section>
                <form >
                    <div class="overlay">



<div class="contenedor">
                        <div class="custom-select" style="width:200px;">
                            <select name="atributo">
                                <option value=0>TIPO DE BUSQUEDA:</option>
                                <option value="Nombre">Nombre</option>
                                <option value="Especialidad">Especialidad</option>
                                <option value="Hora">Hora</option>
                                <option value="Fecha">Fecha</option>
                            </select>
                        </div>

                        <div class="wrap">
                            <div class="search">
                                <input type="text" class="searchTerm" placeholder="Buscar Medico por nombre" name="dato">
                                <button type="submit" class="searchButton">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
    
</div>
                        <div class="tabla"  style="z-index: 0;">
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
                        <table class="containero">
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Hora Entrada</th>
                                <th>Hora Salida</th>
                                <th>Fecha</th>
                                <th>Especialidad</th>
                                <th>Cita</th>
                            </tr>
                            <%      while (rs.next()) {


                            %>
                            <tr>
                                <td><%= String.valueOf(rs.getObject("codigo"))%></td>
                                <td><%= String.valueOf(rs.getObject("nombre"))%></td>
                                <td><%= String.valueOf(rs.getObject("hora_entrada"))%></td>
                                <td><%= String.valueOf(rs.getObject("hora_salida"))%></td>
                                <td><%= String.valueOf(rs.getObject("fecha_inicio"))%></td>
                                <td><%= String.valueOf(rs.getObject("especialidad_nombre"))%></td>
                                <td>
                                    
                                    <a href="AgendarConsulta.jsp?codigo=<%=rs.getString("codigo")%>">Agendar Cita</a>
                                </td>
                            </tr>


                            <%
                                }
                            %></table><%
                            } catch (Exception e) {
                            %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                                    }%>




                        </div>
                        
                    </div>
                </form>


            </section>
        </main>
                                    <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
