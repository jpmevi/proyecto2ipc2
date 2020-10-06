<%-- 
    Document   : BuscarMedico
    Created on : Sep 30, 2020, 3:36:04 AM
    Author     : potz
--%>

<%@page import="DataBase.Conexion"%>
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
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Buscar Medico</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="capa">
            <div class="caja">
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="atributo">
                        <option value="codigo">TIPO DE BUSQUEDA:</option>
                        <option value="nombre">Nombre</option>
                        <option value="especialidad">Especialidad</option>
                        <option value="hora">Hora</option>
                        <option value="fecha">Fecha</option>
                    </select>
                </div>
                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por nombre?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>


                <%String filtro;
                    if (!(request.getParameter("filtro") == null)) {
                        filtro = request.getParameter("filtro");

                    } else {
                        filtro = "";
                    }

                    try {
                        ResultSet rs = null;
                        String dato = request.getParameter("dato");
                        Medico login = new Medico(dato);
                        rs = login.buscarMedico(request.getParameter("atributo"), filtro);


                %>
        

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
                %>





    </div>
                </div>
        </form>


<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>

    </body>
</html>
