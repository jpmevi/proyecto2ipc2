<%-- 
    Document   : AgendarConsulta
    Created on : Oct 1, 2020, 12:36:57 AM
    Author     : potz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/search.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/buttonstyle.css">
        <title>Agendar Consulta</title>
        
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="contenedoro">
<div class="inputAnimate" >
    <input type="text" placeholder="Codigo" name="codigo">
</div>
            <div class="inputAnimate" >
    <input type="text" placeholder="Hora" name="hora">
</div>
            <div class="contenedorselect1">
            <div class="custom-select" style="width:220px;">
                            <select name="atributo">
                                <option value=0>TIPO DE BUSQUEDA:</option>
                                <option value="Nombre">Nombre</option>
                                <option value="Especialidad">Especialidad</option>
                                <option value="Hora">Hora</option>
                                <option value="Fecha">Fecha</option>
                            </select>
                        </div>
            <div class="contenedorselect">
            <div class="custom-select" style="width:220px; ">
                            <select name="atributo">
                                <option value=0>TIPO DE BUSQUEDA:</option>
                                <option value="Nombre">Nombre</option>
                                <option value="Especialidad">Especialidad</option>
                                <option value="Hora">Hora</option>
                                <option value="Fecha">Fecha</option>
                            </select>
                        </div>
               
        </div>
                
            </div>
            <div class="contenedorhorafecha">
            <div class="contenedorfecha">
            <input type="date" id="start" name="trip-start"
                   value="2018-07-22"
                   min="2018-01-01" max="2018-12-31">
            <div class="contenedorhora">
  <input id="appt-time" type="time" name="appt-time" value="13:30">
            </div>
             </div>
            </div>
            <div class="contenedorbotones">
            <a href="https://twitter.com/Dave_Conner" class="bton bton-5">Hover</a> 
            </div>
        </div>
         
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>

<script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
