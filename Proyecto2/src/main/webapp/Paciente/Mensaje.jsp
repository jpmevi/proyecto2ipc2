<%-- 
    Document   : Mensaje
    Created on : Oct 6, 2020, 9:25:09 PM
    Author     : potz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/pacienteindexstyle.css">
    <title>Paciente Index</title>
</head>

<body>
    <%@include file="header.jsp" %>
    <main>
        <section>
            
            <div class="overlay">
                <div class="contenedor">
                    <% String mensaje=String.valueOf(request.getParameter("mensaje"));%>
                    <h1 class="texto" ><%= mensaje%></h1>
                    </div>
                 </div>
                

        </section>
    </main>
            
</body>

</html>
