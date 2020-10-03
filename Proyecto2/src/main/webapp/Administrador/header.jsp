<%-- 
    Document   : header
    Created on : Oct 2, 2020, 11:38:25 PM
    Author     : potz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
        <div class="container">
            <input type="checkbox" name="" id="check">
            <div class="logo-container">
                <h3 class="logo">Admin<span>istrador</span></h3>
            </div>

            <div class="nav-btn">
                <div class="nav-links">
                    <ul>
                        <li class="nav-link" style="--i: .6s">
                            <a href="AdministradorIndex.jsp">Home</a>
                        </li>
                        <li class="nav-link" style="--i: .6s">
                            <a href="#">Examenes<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="CrearExamen.jsp">Crear</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">Modificar y ver</a>
                                    </li>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: .85s">
                            <a href="#">Uusarios<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="#">Crear Paciente</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">Crear Medico</a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">Crear Laboratorista<i class="fas fa-caret-down"></i></a>
                                    </li>
                                    <li class="dropdown-link">
                                        <a href="#">Crear Administrador</a>
                                    </li>
                                    <div class="arrow"></div>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-link" style="--i: 1.1s">
                            <a href="#">Consulta<i class="fas fa-caret-down"></i></a>
                            <div class="dropdown">
                                <ul>
                                    <li class="dropdown-link">
                                        <a href="BuscarMedico.jsp">Modificar Consulta</a>
                                    </li>
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

