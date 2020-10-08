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
                <h3 class="logo">Labo<span>ratorista</span></h3>
            </div>
            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="LaboratoristaIndex.jsp">Home</a>
                        </li>
                        <li class="nav-link" style="--i: .6s">
                            <a href="#">Examen<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="SubirResultados.jsp">Subir resultados</a>
                                    </li>
                                     <li class="dropdown-link">
                                         <a href="EliminarCita.jsp">Eliminar cita</a>
                                    </li>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.35s">
                            <a href="#">Reportes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                                        <ul>
                                                            <li class="dropdown-link">
                                                                <a href="CitasExamenDia.jsp">Examenes en el turno</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="ExamenesRealizados.jsp">Examenes realizados en el dia</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="UtilizacionCadaDia.jsp">Utilizacion de cada dia</a>
                                                            </li>
                                                            <li class="dropdown-link">
                                                                <a href="FechasMasTrabajo.jsp">10 fechas con mas trabajo</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                        </li>
                    </ul>
                </div>

                <div class="log-sign" style="--i: 1.8s">
                    <a href="../Login.jsp" class="btn solid">Cerrar Sesion</a>
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
