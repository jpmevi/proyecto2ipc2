<%-- 
    Document   : Login
    Created on : Sep 29, 2020, 4:10:21 AM
    Author     : potz
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="BackEnd.Login"%>
<%@page import="Encrypt.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <img class="wave" src="img/waveazul.png">
        <div class="container">
            <div class="img">
                <img src="img/img2.svg">
            </div>
            <div class="login-content">
                <form >
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
                        <select name="atributo">
                            <option value=0>TIPO DE USUARIO:</option>
                            <option value="ADMINISTRADOR">Administrador</option>
                            <option value="PACIENTE">Paciente</option>
                            <option value="MEDICO">Medico</option>
                            <option value="LABORATORISTA">Laboratorista</option>
                        </select>
                    </div>
                    <div class="error" >
                     <% if (!(request.getParameter("user") == null) && !(request.getParameter("password") == null)) {
                try {
                    String user = request.getParameter("user");
                    String password =Encriptar.encriptar( request.getParameter("password"));
                    String atributo = request.getParameter("atributo").toUpperCase();
                    Login login = new Login(atributo, user, password);
                    if (login.comprobarLogin() == true) {
                    switch(atributo){
                    case "PACIENTE":
                    session.setAttribute("codigouser", request.getParameter("user"));
                        response.sendRedirect("Paciente/PacienteIndex.jsp"); 
                         }
                        
                    }else{
                     %><h4 class="err" >Ingreso mal las credenciales</h4><%
                         }
                }
            catch (Exception e) {
            
             %><h4 class="err" >Ingreso mal las credenciales</h4><%
        }
            }%>
 <a href="#">Forgot Password?</a>
                    <input type="submit" class="btn" value="Login">
                </form>
            </div>
        </div>
           
        <script type="text/javascript" src="js/main.js"></script>

       
    </body>
</html>
