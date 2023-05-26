<%@page isErrorPage="true" %>
<%@page import="java.util.Enumeration" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="ref/styleLogin.css" />
        <title>Página de erro de usuário</title>
    </head>
    <body>
        <div class="main-login">
            <div class="left-login">
                <h1>Sistema LocBom, <br> O melhor para o melhor!</h1>
                <img src="imagens/wrongPassword.svg" class="left-login-image" alt="walk">
            </div>
            <form name="formLogin" method="post" action="Login">
                <div class="right-login">
                    <div class="card-login">
                        <div class="textfield">
                            <h1>Email e/ou senha inválidos</h1>
                            <label for="cadastro">Cadastre-se</label>
                            <a href="index.jsp">Cadastro</a>
                        </div>
                        <div class="textfield">
                            <label for="login">Tente Novamente</label> 
                            <a href="login.jsp">Login</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>