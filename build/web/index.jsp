<html lang="en">
    <head>
        <link rel="stylesheet" type="text/css" href="ref/styleLogin.css" />
        <script type="text/javascript">
            function validar() {
                var nome_cad = frmCadastrarLogin.nome_cad.value;
                var email_cad = frmCadastrarLogin.email_cad.value;
                var senha_cad = frmCadastrarLogin.senha_cad.value;
                var tipo_usuario_cad = frmCadastrarLogin.tipo_usuario_cad.value;

                if (nome_cad == "") {
                    alert("Preencha com seu nome!");
                    frmCadastrarLogin.nome_cad.focus();
                    return false;
                }

                if (email_cad == "") {
                    alert("Preencha com seu email!");
                    frmCadastrarLogin.email_cad.focus();
                    return false;
                }

                if (senha_cad == "") {
                    alert("Preencha com sua senha!");
                    frmCadastrarLogin.senha_cad.focus();
                    return false;
                }
                if (tipo_usuario_cad == "") {
                    alert("Preencha com o tipo do usuario!");
                    frmCadastrarLogin.tipo_usuario_cad.focus();
                    return false;
                }

                if (senha_cad.length < 6 | senha_cadastro.length > 8) {
                    alert("Sua senha deve ter entre 6 e 8 caracteres!");
                    frmCadastrarLogin.senha_cad.focus();
                    return false;
                } else {
                    alert("Cadastro realizado com sucesso! no email de " + email_cad);
                    return true;
                }

        </script>
        <title>Página de Cadastro</title>
    </head>
    <body>
        <div class="main-login">
            <div class="left-login">
                <h1>Sistema LocBom, <br> O melhor para o melhor!</h1>
                <img src="imagens/index.svg" class="left-login-image" alt="index">
            </div>
            <form name="frmCadastrarLogin" action="CadastroLogin" method="post">
                <div class="right-login">
                    <div class="card-login">
                        <h1>CADASTRO</h1>
                        <div class="textfield">
                            <label for="nome_cad">Seu  nome</label>
                            <input id="nome_cad" name="nome" required="required" type="text" placeholder="ex. João Felipe"/>
                        </div>
                        <div class="textfield">
                            <label for="email_cad">Seu email</label>
                            <input id="email_cad" name="email" required="required" type="text" placeholder="ex. exemplo@gmail.com "/>
                        </div>
                        <div class="textfield">
                            <label for="senha_cad">Sua senha</label>
                            <input id="senha_cad" name="senha" required="required" type="password" placeholder="ex. 12345"/>
                        </div>
                        <div class="textfield">
                            <label for="tipo_usuario_cad">Tipo do usuário</label>
                            <input id="tipo_usuario_cad" name="tipo_usuario" required="required" type="text" placeholder="ex. 0-1"/>
                        </div>
                        <input class="btn-login" type="submit" value="Cadastrar" onclick="return validar()"/>
                        <a href="login.jsp">Acesse sua conta!</a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
