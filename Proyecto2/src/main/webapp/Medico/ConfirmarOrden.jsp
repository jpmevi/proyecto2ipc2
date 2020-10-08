<%-- 
    Document   : ConfirmarOrden
    Created on : Oct 6, 2020, 11:13:45 PM
    Author     : potz
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Examen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");

    try {
        if (!codigo.equals("")) {
            session.setAttribute("PAC", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoPaciente = String.valueOf(session.getAttribute("PAC"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Confirmar Orden</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form action="../GenerarOrden" method="post">
        <div class="caja">
         <textarea id="subject" name="descripcion" placeholder="Descripcion.." required ></textarea>
               <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="examen">
                        <%  
                            Examen exa = new Examen("");
                           ResultSet  rs = exa.buscarExamen("");
                            if (!rs.next()) {

                        } else {
                            rs = exa.buscarExamen("");

                            while (rs.next()) {
                        %><option value=<%=rs.getString("codigo")%>><%=rs.getString("nombre")%></option><%
                                }
                            }%>
                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Generar</button>
        </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
