<%-- 
    Document   : ConfirmarEspecialidad
    Created on : Oct 8, 2020, 5:18:51 AM
    Author     : potz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("Medic", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700'>
        <title>Confirmar Especialidad</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form action="../CrearEspecialidad" method="post">
            <div class="caja">
                <h4>Ingresar Especialidad:</h4>
                <div class="inputAnimate">
                    <input type="text" placeholder="Especialidad" name="especialidad" required>
                </div>
               
                <button class="draw" type="submit" name="gen">Generar</button>

                
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

