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
        <title>header</title>
    </head>
    <body>
        <header>
        <div class="container">
            <input type="checkbox" name="" id="check">
            
            <div class="logo-container">
                <h3 class="logo">Me<span>dico</span></h3>
            </div>

            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="MedicoIndex.jsp">Home</a>
                        </li>
                        <li class="nav-link" style="--i: .6s">
                            <a href="#">Informes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="GenerarInforme.jsp">Generar Informe</a>
                                    </li>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: .6s">
                            <a href="#">Orden<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="GenerarOrden.jsp">Generar Orden</a>
                                    </li>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="#">Citas<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="BuscarPaciente.jsp">Agendar Cita</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="BuscarLab.jsp">Cancelar Cita</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="#">Reportes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                                        <ul>
                                                            <li class="dropdown-link">
                                                                <a href="#">Historial Medico</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="#">Citas Agendadas en intervalo</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="#">Citas Agendadas ese dia</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="#">Pacientes con mas informes</a>
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
