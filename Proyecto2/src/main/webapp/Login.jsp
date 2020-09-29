<%-- 
    Document   : Login
    Created on : Sep 29, 2020, 4:10:21 AM
    Author     : potz
--%>
<%@page import="BackEnd.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <img class="wave" src="img/wave.png">
        <div class="container">
            <div class="img">
                <img src="img/img.svg">
            </div>
            <div class="login-content">
                <form action="Login.jsp">
                    <img src="img/avatar.svg">
                    <h2 class="title">Bienvenido</h2>
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>Usuario</h5>
                            <input type="text" class="input" name="user">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i"> 
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password</h5>
                            <input type="password" class="input" name="password">
                        </div>

                    </div>
                    <div class="custom-select" style="width:200px;">
                        <select>
                            <option value="ADMINISTRADOR">ADMINISTRADOR</option>
                            <option value="PACIENTE">PACIENTE</option>
                            <option value="MEDICO">MEDICO</option>
                            <option value="LABORATORISTA">LABORATORISTA</option>
                        </select>
                    </div>



                    <a href="#">Forgot Password?</a>
                    <input type="submit" class="btn" value="Login">
                </form>

            </div>
        </div>
        <script type="text/javascript" src="js/main.js"></script>

        <% if (!(request.getParameter("user") == null) && !(request.getParameter("password") == null)) {
                try {
                    String user = request.getParameter("user");
                    String password = request.getParameter("password");
                    String atributo = request.getParameter("atributo");
                    Login login = new Login(atributo, user, password);
                } catch (Exception e) {%>
        <h1>No ingreso numeros validos.</h1>
        <%}
            }%>
    </body>
</html>
