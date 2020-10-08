<%-- 
    Document   : header
    Created on : Sep 30, 2020, 3:39:00 AM
    Author     : potz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <header>
        <div class="container">
            <input type="checkbox" name="" id="check">
            
            <div class="logo-container">
                <h3 class="logo">Pa<span>Ciente</span></h3>
            </div>

            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="PacienteIndex.jsp">Home</a>
                        </li>
                        <li class="nav-link" style="--i: .6s">
                            <a href="#">Consulta<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="BuscarMedico.jsp">Programar una consulta</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="VerCitaMedica.jsp">Ver citas programadas</a>
                                    </li>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="#">Examenes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="BuscarLab.jsp">Programar examen</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="VerCitaExamen.jsp">Ver examenes programados</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.1s">
                            <a href="#">Ordenes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="VerOrdenExamen.jsp">Ver Ordenes</a>
                                    </li>                        
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="#">Reportes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                                        <ul>
                                                            <li class="dropdown-link">
                                                                <a href="HistorialMedico.jsp">Historial Medico</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="UltimosExamenes.jsp">Ultimos 5 Examenes</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="ExamenesPorTipo.jsp">Examenes por tipo</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="UltimasConsultas.jsp">Ultimas 5 consultas</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="ConsultaIntervalo.jsp">Consultas con un medico</a>
                                                            </li>
                                                            <div class="arrow"></div>
                                                        </ul>
                                                    </div>
                        </li>
                    </ul>
                </div>

                <div class="log-sign" style="--i: 1.8s">
                    <a href="#" class="btn solid">Cerrar Sesion</a>
                </div>
            </div>

            <div class="hamburger-menu-container">
                <div class="hamburger-menu">
                    <div></div>
                </div>
            </div>
        </div>
    </header>
    </body>
</html>
