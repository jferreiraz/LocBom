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
                    alert("Campo valor n�o informado");
                    return false;
                }
                if (document.formAlterarPagamento.data_pagamento.value === "") {
                    alert("Campo data de pagamento n�o informado");
                    return false;
                }
                if (document.formAlterarPagamento.pagante.value === "") {
                    alert("Campo pagante n�o informado");
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
            <p class="font">Altera��o de Pagamentos <p>
        </div>
        <form name="formAlterarPagamento" action="AlterarPagamento" method="post">
            <%
                int id = 0;
                String valor = "";
                String data_pagamento = "";
                String pagante = "";
                String recebedor = "";
                String descricao = "";
                String inquilino = "";
                String numero_apartamento = "";
                String dbId = request.getParameter("id"); 

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from pagamentos where id_pagamentos =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_pagamentos");
                    valor = rs.getString("valor");
                    data_pagamento = rs.getString("data_pagamento");
                    pagante = rs.getString("pagante");
                    recebedor = rs.getString("recebedor");
                    descricao = rs.getString("descricao");
                    inquilino = rs.getString("inquilino");
                    numero_apartamento = rs.getString("numero_apartamento");
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
                        <tr><td>Pagante</td><td><input type="text" name="pagante" value="<%= pagante%>"></td><td><%= pagante%></td></tr>
                        <tr><td>Recebedor</td><td><input type="text" name="recebedor" value="<%= recebedor%>"></td><td><%= recebedor%></td></tr>
                        <tr><td>Descri��o</td><td><input type="text" name="descricao" value="<%= descricao%>"></td><td><%= descricao%></td></tr>
                        <tr><td>Inquilino</td><td><input type="text" name="inquilino" value="<%= inquilino%>"></td><td><%= inquilino%></td></tr>
                        <tr><td>N�mero de apartamentos</td><td><input type="text" name="numero_apartamento" value="<%= numero_apartamento%>"></td><td><%= numero_apartamento%></td></tr>
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