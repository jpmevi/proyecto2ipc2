<%-- 
    Document   : CrearPaciente
    Created on : Oct 3, 2020, 5:30:36 PM
    Author     : potz
--%>

<%@page import="DataBase.Conexion"%>
<%@page import="Entity.Paciente"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
        <title>Crear Paciente</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <h4>Ingresar Paciente:</h4>
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
                    <input type="number" placeholder="Telefono" name="telefono" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Peso" name="peso" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Correo" name="correo" required>
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Password" name="password" required>
                </div>
                <h4>Fecha de Nacimiento:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" required>
                    
                </div>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="sangre">

                        <option value="a+">Seleccione sangre:</option>
                        <option value="a+" >A+</option>
                        <option value="a-" >A-</option>
                        <option value="b+" >B+</option>
                        <option value="b-" >B-</option>
                        <option value="ab+" >AB+</option>
                        <option value="ab-" >AB-</option>
                        <option value="o+" >O+</option>
                        <option value="o-" >O-</option>
                    </select>
                </div>
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="sexo">
                        <option value="Masculino">Sexo:</option>
                        <option value="Masculino">Hombre</option>
                        <option value="Femenino">Femenino</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Generar</button>

                <%
                    if (!(request.getParameter("gen") == null)) {
                            try {
                                int telefono = Integer.parseInt(request.getParameter("telefono"));
                                String fecha = String.valueOf(request.getParameter("fecha"));
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate localDate = LocalDate.parse(fecha, formatter);

                                Paciente pa = new Paciente(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("sexo"), localDate, request.getParameter("dpi"), request.getParameter("telefono"), request.getParameter("peso"), request.getParameter("sangre"), request.getParameter("correo"), request.getParameter("password"));
                %><h3>Paciente creado con exito</h3><%
                                 } catch (Exception e) {

                %><h4>Error al crear el paciente</h4><%                            }
                    }
                %>
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
