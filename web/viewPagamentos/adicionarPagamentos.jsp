<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>

<%
    String inquilino = "";
    String dbInquilino = request.getParameter("dbInquilino");
    String sql = "";
    String inquilinoTitulo = "";

    if (dbInquilino == null) {
        sql = "select * from inquilinos";
        inquilinoTitulo = "";
    } else {
        sql = "select * from inquilinos where nome_inquilino =\'" + dbInquilino + "\' ";
        inquilinoTitulo = dbInquilino;
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
                var valor_cad = frmCadastrarPagamento.valor_cad.value;
                var data_pag_cad = frmCadastrarPagamento.data_pag_cad.value;
                var descricao_cad = frmCadastrarPagamento.descricao_cad.value;
                var inquilino_cad = frmCadastrarPagamento.inquilino_cad.value;

                if (valor_cad == "") {
                    alert("Preencha o campo do valor!");
                    frmCadastrarPagamento.valor_cad.focus();
                    return false;
                }

                if (data_pag_cad == "") {
                    alert("Preencha a data de pagamento!");
                    frmCadastrarPagamento.data_pag_cad.focus();
                    return false;
                }
                if (descricao_cad == "") {
                    alert("Preencha o campo de descrição!");
                    frmCadastrarPagamento.descricao_cad.focus();
                    return false;
                }
                if (inquilino_cad == "") {
                    alert("Preencha o campo inquilino!");
                    frmCadastrarPagamento.inquilino_cad.focus();
                    return false;
                } else {
                    alert("Cadastro de pagamento realizado com sucesso! ");
                    return false;
                }
        </script>
    </head> 
    <body>
        <div class="navegador">
            <nav>
                <img src="../imagens/LocBomLogo.png" class="logo">
                <ul>
                    <li><a href="gerenciarPagamentos.jsp">Voltar ao gerenciar pagamentos</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Adição de Pagamentos no <br><i><%=inquilinoTitulo%></i><p>
        </div>
        <form name="frmCadastrarPagamento" action="CadastroPagamento" method="post">

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
                            <td><label for="data_pag_cad">Data de pagamento</label></td>
                            <td><label for="descricao_cad">Descrição</label></td>
                            <td><label for="inquilino_cad">Inquilino</label></td>
                        </tr>
                        <tr>
                            <td><input id="valor_cad" name="valor" required="required" type="text" placeholder="ex. 20,50"/></td>
                            <td><input id="data_pag_cad" name="data_pagamento" required="required" type="date" placeholder="ex. 20/05/2023 "/></td>
                            <td><input id="descricao_cad" name="descricao" type="text" placeholder="ex. Pago adiantado uma semana"/></td>
                            <td><select name=inquilino id="inquilino_cad">
                                    <%                                        while (rs.next()) {
                                            inquilino = rs.getString("nome_inquilino");
                                    %>
                                    <option  value="<%=inquilino%>" ><%=inquilino%></option>
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