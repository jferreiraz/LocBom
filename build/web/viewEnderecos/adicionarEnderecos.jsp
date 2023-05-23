<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head>
        <title>Página de cadastro dos Endereços</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="../ref/style.css" />
        <script type="text/javascript">
            function validar() {
                var cidade_cad = frmCadastrarEndereco.cidade_cad.value;
                var bairro_cad = frmCadastrarEndereco.bairro_cad.value;
                var endereco_cad = frmCadastrarEndereco.endereco_cad.value;

                if (cidade_cad == "") {
                    alert("Preencha o campo de sua cidade!");
                    frmCadastrarEndereco.cidade_cad.focus();
                    return false;
                }

                if (bairro_cad == "") {
                    alert("Preencha o campo de seu bairro!");
                    frmCadastrarEndereco.bairro_cad.focus();
                    return false;
                }

                if (endereco_cad == "") {
                    alert("Preencha com seu endereço!");
                    frmCadastrarEndereco.endereco_cad.focus();
                    return false;
                } else {
                    alert("Cadastro de endereço realizado com sucesso! ");
                    return false;
                }
        </script>
    </head> 
    <body>
        <div class="navegador">
            <nav>
                <img src="../imagens/LocBomLogo.png" class="logo">
                <ul>
                    <li><a href="gerenciarEnderecos.jsp">Voltar ao gerenciar endereços</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Adição de Endereços <p>
        </div>
        <form name="frmCadastrarEndereco" action="CadastroEndereco" method="post">
            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr>
                            <th colspan="4">Realize o cadastro abaixo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><label for="cidade_cad">Cidade</label></td>
                            <td><label for="bairro_cad">Bairro</label></td>
                            <td><label for="endereco_cad">Endereço</label></td>
                        </tr>
                        <tr>
                            <td><input id="cidade_cad" name="cidade" required="required" type="text" placeholder="ex. Brasília"/></td>
                            <td><input id="bairro_cad" name="bairro" required="required" type="text" placeholder="ex. Taguatinga Sul "/></td>
                            <td><input id="endereco_cad" name="endereco" required="required" type="text" placeholder="ex. St D Sul QSD 28 casa 12"/></td>
                            <%
            String id_usuario = (String) session.getAttribute("id_usuario");
%>
                        </tr>
                        <tr><td colspan="4"><input type="submit" value="Cadastrar" onclick="return validar()"/></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
    </body>
</html>