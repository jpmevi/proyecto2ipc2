<%-- 
    Document   : CrearExamen
    Created on : Oct 3, 2020, 12:19:02 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Entity.Examen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,500,700'>
        <title>Crear Examen</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <div class="inputAnimate">
                    <input type="text" placeholder="Nombre" name="nombre">
                </div>
                <div class="inputAnimate">
                    <input type="text" placeholder="Archivo" name="tipo">
                </div>
                <textarea name="descripcion" rows="10" cols="40" style="width: 97%; margin: 10px;" placeholder="Descripcion"></textarea>
                <input type="number" name="costo" step="0.01" min="0" style="width: 97%; margin: 10px;" placeholder="Costo">
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="orden">
                        <option value="0">Orden:</option>
                        <option value="Si">Si</option>
                        <option value="No">No</option>
                    </select>
                </div>
                <button class="draw" type="submit" name="gen">Generar</button>

                <%if (!(request.getParameter("gen") == null)) {
                        if (!(request.getParameter("nombre") == null) && !(request.getParameter("tipo") == null) && !(request.getParameter("descripcion") == null) && !(request.getParameter("costo") == null) && !(request.getParameter("orden") == "0")) {
                            try {
                                boolean orden = false;
                                double costo = Double.parseDouble(request.getParameter("costo"));
                                if (request.getParameter("orden").equals("Si")) {
                                    orden = true;
                                } else {
                                    orden = false;
                                }
                                String nombre = request.getParameter("nombre");
                                String descripcion = request.getParameter("descripcion");
                                String tipo = request.getParameter("tipo");
                                Examen ex = new Examen(nombre, descripcion, orden, costo, tipo);
                            } catch (Exception e) {
                                JOptionPane.showMessageDialog(null, e);
                %><h4>Por favor llene todos los campos</h4><%
                            }

                        } else {

                        }
                    }
                %>
            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
