<%-- 
    Document   : AgendarConsulta
    Created on : Oct 1, 2020, 12:36:57 AM
    Author     : potz
--%>

<%@page import="DataBase.Conexion"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Time"%>
<%@page import="Entity.Cita_Medica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Funcion.IntervaloHoras"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");
    String especialidad = request.getParameter("especialidad");
    try {
        if (!codigo.equals("")) {
            session.setAttribute("Medico", request.getParameter("codigo"));
        }
        if (!especialidad.equals("")) {
            session.setAttribute("Especialidad", request.getParameter("especialidad"));
        }
    } catch (Exception e) {
    }
    String codigoMedico = String.valueOf(session.getAttribute("Medico"));
    String nombreEspecialidad = String.valueOf(session.getAttribute("Especialidad"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/button.css">
        <title>Agendar Consulta</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form action="AgendarConsulta.jsp">
            <div class="caja">
                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="atributo">
                        <%
                            if (!(request.getParameter("cita") == null) && ((request.getParameter("atributo") != "No existen horas disponibles en esa fecha") || (request.getParameter("atributo") != "No ha verificado") || (request.getParameter("atributo") != "Seleccione Hora:"))) {
                                try {
                                    String fecha = String.valueOf(session.getAttribute("Fecha"));
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                    LocalDate localDate = LocalDate.parse(fecha, formatter);
                                    IntervaloHoras in = new IntervaloHoras();
                                    Cita_Medica cita = new Cita_Medica(localDate, LocalTime.parse(request.getParameter("atributo")), String.valueOf(session.getAttribute("Paciente")), codigoMedico, in.obtenerConsulta(nombreEspecialidad));
                                   
                                } catch (Exception e) {
                                    %><h4 class="err" >Debe verificar antes la hora</h4><%   
                                }

                            }

                            if (!(request.getParameter("disponible") == null)) {
                                try {

                                    String fecha = request.getParameter("fecha");
                                    IntervaloHoras in = new IntervaloHoras(codigoMedico, Date.valueOf(fecha));
                                    ArrayList listahoras = in.citasMedicasDisponibles();
                                    if (listahoras.size() == 0) {
                                        listahoras.add("No existen horas disponibles en esa fecha");
                                    } else {
                            }
                            for (int i = 0; i < listahoras.size(); i++) {
                        %>

                        <option value<%=listahoras.get(i)%>><%=listahoras.get(i)%></option>

                        <%
                            }
                            String fechain = request.getParameter("fecha");
                            try {
                                if (!fechain.equals("")) {
                                    session.setAttribute("Fecha", request.getParameter("fecha"));
                                }

                            } catch (Exception e) {
                            }

                        } catch (Exception e) {

                        %><h4 class="err" >Ingreso mal las credenciales</h4><%                     }
                        } else {
                        %><option value="No ha verificado">No ha verificado</option><%
                            }
                        %>





                    </select>
                </div>



                <div class="inputAnimate">
                    
                    <input type="date" id="start" name="fecha"
                           value<%=request.getParameter("fecha")%>
                           min="2018-01-01" max="2022-12-31" >
                </div>
                           <% if (!(request.getParameter("disponible") == null) && !(request.getParameter("fecha").equals(""))) {
                           %><button class="draw" type="submit" name="cita">Crear Cita</button><%
                               }%>
                               <% if (!(request.getParameter("cita") == null)&& !(request.getParameter("atributo").equals("No existen horas disponibles en esa fecha"))) {
                           %><h3>Cita medica creada con exito<h3><%  
                               }%>
                
                <button class="draw" type="submit" name="disponible">Ver disponbilidad</button>


            </div>

            <!-- partial -->
            <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>

            <script type="text/javascript" src="../js/select.js"></script>

        </form>
    </body>
</html>
