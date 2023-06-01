<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>

<%
    String endereco = "";
    String dbEndereco = request.getParameter("dbEndereco");
    String sql = "";
    String enderecoTitulo = "";

    if (dbEndereco == null) {
        sql = "select * from endereco";
        enderecoTitulo = "";
    } else {
        sql = "select * from endereco where endereco =\'" + dbEndereco + "\' ";
        enderecoTitulo = "no" + dbEndereco;
    }

    Connection conn = CriarConexao.getConexao();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

%>
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
                var valor_cad = frmCadastrarEndereco.valor_cad.value;
                var endereco_cad = frmCadastrarEndereco.data_pag_cad.value;
                var descricao_cad = frmCadastrarEndereco.descricao_cad.value;

                if (valor_cad == "") {
                    alert("Preencha o campo do valor!");
                    frmCadastrarEndereco.valor_cad.focus();
                    return false;
                }

                if (endereco_cad == "") {
                    alert("Preencha o endereço!");
                    frmCadastrarEndereco.endereco_cad.focus();
                    return false;
                }
                if (descricao_cad == "") {
                    alert("Preencha o campo de descrição!");
                    frmCadastrarEndereco.descricao_cad.focus();
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
                    <li><a href="gerenciarReformas.jsp">Voltar ao gerenciar reformas</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Adição de Reformas <br><i><%=enderecoTitulo%></i><p>
        </div>
        <form name="frmCadastrarEndereco" action="CadastroReforma" method="post">

            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr>
                            <th colspan="7">Realize o cadastro abaixo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><label for="valor_cad">Valor do pagamento</label></td>
                            <td><label for="descricao_cad">Descrição</label></td>
                            <td><label for="endereco_cad">Endereço</label></td>
                        </tr>
                        <tr>
                            <td><input id="valor_cad" name="valor" required="required" type="text" placeholder="ex. 20,50"/></td>
                            <td><input id="descricao_cad" name="descricao" type="text" placeholder="ex. Pago adiantado uma semana"/></td>
                            <td><select name="endereco" id="endereco_cad">
                                    <%                                        while (rs.next()) {
                                            endereco = rs.getString("endereco");
                                    %>
                                    <option  value="<%=endereco%>" ><%=endereco%></option>
                                    <% }%>
                                </select></td>
                        </tr>
                        <tr><td colspan="7"><input type="submit" value="Cadastrar" onclick="return validar()"/></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
    </body>
</html>
