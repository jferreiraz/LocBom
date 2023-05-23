<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="ref/styleLogin.css" />
        <script type="text/javascript">
            function validarLogin() {
                var email_login = formLogin.email_login.value;
                var senha_login = formLogin.senha_login.value;

                if (email_login == "") {
                    alert("Preencha com seu email!");
                    formLogin.email_login.focus();
                    return false;
                }

                if (senha_login == "") {
                    alert("Preencha com sua senha!");
                    formLogin.senha_login.focus();
                    return false;
                }

            }
        </script>
        <title>Página de login</title>
    </head>
    <body>
        <div class="main-login">
            <div class="left-login">
                <h1>Sistema LocBom, <br> O melhor para o melhor!</h1>
                <img src="imagens/walk.svg" class="left-login-image" alt="walk">
            </div>
            <form name="formLogin" method="post" action="Login">
                <div class="right-login">
                    <div class="card-login">
                        <h1>LOGIN</h1>
                        <div class="textfield">
                            <label for="email_login">Email</label>
                            <input type="text" id="email_login" name="email" required="required" placeholder="Email"></label>
                        </div>
                        <div class="textfield">
                            <label for="senha_login">Senha</label> 
                            <input type="password" id="senha_login" name="senha" required="required" placeholder="Senha"></label>
                        </div>
                        <input class="btn-login" type="submit" value="Logar" onclick="return validarLogin()"/>
                        <a href="index.jsp">Cadastre-se</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>