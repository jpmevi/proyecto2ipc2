<%-- 
    Document   : BuscarPaciente
    Created on : Oct 7, 2020, 4:46:53 AM
    Author     : potz
--%>

<%@page import="Entity.Paciente"%>
<%@page import="java.sql.ResultSet"%>
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
        <title>Buscar Paciente</title>
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


                <%String filtro;
                    if (!(request.getParameter("filtro") == null)) {
                        filtro = request.getParameter("filtro");

                    } else {
                        filtro = "";
                    }

                    try {
                        ResultSet rs = null;
                        String dato = request.getParameter("dato");
                        Paciente login = new Paciente();
                        rs = login.buscarPaciente(filtro);


                %>
        

                 <table class="containero" style="z-index: 99;">
                    <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Nombre</h1></th>
                        <th><h1>Sexo</h1></th>
                        <th><h1>Fecha Nacimiento</h1></th>
                        <th><h1>DPI</h1></th>
                        <th><h1>Telefono</h1></th>
                        <th><h1>Peso</h1></th>
                        <th><h1>Sangre</h1></th>
                        <th><h1>Correo</h1></th>
                        <th><h1>Agendar</h1></th>

                    </tr>
                    <%      while (rs.next()) {


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

                            <h2><a href="AgendarCita.jsp?codigo=<%=rs.getString("codigo")%>">Agendar Cita</a></h2>
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

