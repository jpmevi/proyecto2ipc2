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
        <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/pacienteindexstyle.css">
        <title>Buscar Medico</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <section>
                <form>
                <div class="overlay">
                    <div class="contenedor">
                        <input type="text" class="input" name="nombre">

                        <% if (!(request.getParameter("nombre") == null)) {
                                try {
                                    String user = request.getParameter("nombre");
                                    Medico login = new Medico(user);
                                    ResultSet rs = login.buscarMedico("nombre", user);

                        %>
                        <table>
                            <tr>
                                <th>Codigo</th>
                                <th>Nombre</th>
                                <th>Hora Entrada</th>
                                <th>Hora Salida</th>
                                <th>fecha</th>
                            </tr>
                            <%      while (rs.next()) {


                            %>
                            <tr>
                                <td><%= String.valueOf(rs.getObject("codigo"))%></td>
                                <td><%= String.valueOf(rs.getObject("nombre"))%></td>
                            </tr>
                        </table>

                        <%
                            }
                        } catch (Exception e) {
                        %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                    }%>
                    <input type="submit" >
                    </div>
                </div>
                    
                </form>


            </section>
        </main>


    </body>
</html>
