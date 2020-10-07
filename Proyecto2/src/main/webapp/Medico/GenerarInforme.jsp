<%-- 
    Document   : GenerarInforme
    Created on : Oct 6, 2020, 1:35:09 AM
    Author     : potz
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Entity.Informe_Consulta"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Cita_Medica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String paciente = request.getParameter("paciente");
    String consulta = request.getParameter("consulta");
    String codigo = request.getParameter("codigo");
    try {
        if (!paciente.equals("")) {
            session.setAttribute("Pac", request.getParameter("paciente"));
        }
        if (!consulta.equals("")) {
            session.setAttribute("Consu", request.getParameter("consulta"));
        }
        if (!codigo.equals("")) {
            session.setAttribute("CM", request.getParameter("codigo"));
        }

    } catch (Exception e) {
    }
    String codigoPaciennte = String.valueOf(session.getAttribute("Pac"));
    String codigoConsulta = String.valueOf(session.getAttribute("Consu"));
    String codigoCM = String.valueOf(session.getAttribute("CM"));
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?6.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Generar Informe</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                <% Cita_Medica cm = new Cita_Medica();%>


                <div class="custom-select" style="width:200px; margin: 5px;left: 50%; transform: translate(-50%,0);">
                    <select name="atributo">
                        <option value="codigo">Buscar por:</option>
                        <option value="codigo">Codigo</option>
                        <option value="hora">Hora</option>
                        <option value="fecha">Fecha</option>
                    </select>
                </div>
                <section class="webdesigntuts-workshop" >
                    <div>
                        <input type="search" placeholder="Filtrar por codigo?" name="filtro">		    	
                        <button>Filtrar</button>
                    </div>
                </section>
                <table class="containero" style="z-index: 99;">

                    <%  String filtro;
                        if (!(request.getParameter("filtro") == null)) {
                            filtro = request.getParameter("filtro");

                        } else {
                            filtro = "";
                        }

                        try {
                            ResultSet rs = null;
                            String atributo = "";
                            if (!(request.getParameter("atributo") == null)) {
                                atributo = request.getParameter("atributo");
                            } else {
                                atributo = "codigo";
                            }
                            rs = cm.buscarCitaMedicaMedico(atributo, filtro, String.valueOf(session.getAttribute("Medico")));
                            if (!(rs.next())) {
                    %><h4>No hay ninguna cita medica</h4><%
                    } else {
                        rs = cm.buscarCitaMedicaMedico(atributo, filtro, String.valueOf(session.getAttribute("Medico")));

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                        <th><h1>Paciente</h1></th>
                        <th><h1>Especialidad</h1></th>
                        <th><h1>Generar Informe</h1></th>

                    </tr>
                    <%                        while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("paciente"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("ESPECIALIDAD_nombre"))%></h2></td>
                        <td>
                            <h2><a href="GenerarInforme.jsp?codigo=<%=rs.getString("codigo")%>&paciente=<%=rs.getString("codp")%>&consulta=<%=rs.getString("consulta")%>">Generar Informe</a></h2>
                        </td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>No hay ninguna cita</h3><%
                    }%>


                <% if (!(request.getParameter("codigo") == null)) {


                %>
                <label ><%=LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute())%></label>
                <label ><%=LocalDate.now()%></label>
                <textarea id="subject" name="descripcion" placeholder="Descripcion.." required ></textarea>
                <button class="draw" type="submit" name="gen">Generar</button>
                <%                  }
                    if (!(request.getParameter("gen") == null)) {
                        int consultanum = Integer.valueOf(codigoConsulta);
                        Informe_Consulta ic = new Informe_Consulta(request.getParameter("descripcion"), LocalDate.now(), LocalTime.now(), consultanum, codigoPaciennte, String.valueOf(session.getAttribute("Medico")));
                         cm.eliminarCita(codigoCM);
                        response.sendRedirect("GenerarInforme.jsp");

                %><h3>Informe generado con exito</h3><%                    }
                %>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

