<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.login.Usuario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
            function validarAlteracao() {
                if (document.formAlterarPagamento.valor.value === "") {
                    alert("Campo valor não informado");
                    return false;
                }
                if (document.formAlterarPagamento.data_pagamento.value === "") {
                    alert("Campo data de pagamento não informado");
                    return false;
                }

                document.formAlterarPagamento.submit();

            }
        </script>
        <title>Alterar</title>
        <link rel="stylesheet" type="text/css" href="../ref/style.css" />
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
            <p class="font">Alteração de Pagamentos <p>
        </div>
        <form name="formAlterarPagamento" action="AlterarPagamento" method="post">
            <%
                int id = 0;
                String valor = "";
                String data_pagamento = "";
                String descricao = "";
                String inquilino = "";
                String inquilinoAntigo = "";
                String dbId = request.getParameter("id");
                String sql = "select * from inquilinos";

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from pagamentos where id_pagamentos =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_pagamentos");
                    valor = rs.getString("valor");
                    data_pagamento = rs.getString("data_pagamento");
                    descricao = rs.getString("descricao");
                    inquilinoAntigo = rs.getString("inquilino");
                }

            %>

            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr >
                            <th>Campos</th>
                            <th>Novos campos</th>
                            <th>Campos no sistema</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Id</td><td><input type="text" class="id_border" name="id_pagamentos" value="<%= id%>" readonly></td><td><%= id%></td></tr>
                        <tr><td>Valor</td><td><input type="text" name="valor" value="<%= valor%>"></td><td><%= valor%></td></tr>
                        <tr><td>Data de pagamento</td><td><input type="date" name="data_pagamento" value="<%= data_pagamento%>"></td><td><%= data_pagamento%></td></tr>
                        <tr><td>Descrição</td><td><input type="text" name="descricao" value="<%= descricao%>"></td><td><%= descricao%></td></tr>
                        <tr><td>Inquilino</td><td><select name="inquilino" id="inquilino_cad">
                                    <%
                                        ResultSet rs2 = stmt.executeQuery(sql);
                                        while (rs2.next()) {
                                            inquilino = rs2.getString("nome_inquilino");
                                    %>
                                    <option  value="<%=inquilino%>" ><%=inquilino%></option>
                                    <% }%>
                                </select><td><%= inquilinoAntigo%></td></tr>
                        <tr><td colspan="3"><input class="btn_table" type="button" value="Alterar" onclick="validarAlteracao()"></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
        <%
            stmt.close();
            conn.close();
        %>
    </body>
</html>