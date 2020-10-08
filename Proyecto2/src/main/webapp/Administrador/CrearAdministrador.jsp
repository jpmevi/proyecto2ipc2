<%-- 
    Document   : CrearAdministrador
    Created on : Oct 4, 2020, 5:18:06 AM
    Author     : potz
--%>

<%@page import="DataBase.Conexion"%>
<%@page import="Entity.Administrador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700'>
        <title>Crear Administrador</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <h4>Ingresar Administrador:</h4>
                <div class="inputAnimate">
                    <input type="text" placeholder="Codigo" name="codigo" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" name="nombre" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="DPI" name="dpi" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Password" name="password" required>
                </div>
               
                <button class="draw" type="submit" name="gen">Generar</button>

                <% 
                    if (!(request.getParameter("gen") == null)) {
                            try {
                                
                            Administrador ad = new Administrador(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("dpi"), request.getParameter("password"));
                                
                %><h3>Administrador creado con exito</h3><%
                                 } catch (Exception e) {

                %><h4>Error al crear el Administrador</h4><%                            }
                    }
                %>
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

