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
            function deletar() {

                document.formDeletarPagamentos.submit();

            }
        </script>
        <title>Deletar</title>
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
            <p class="font">Deletar Pagamentos <p>
        </div>
        <form name="formDeletarPagamentos" action="DeletarPagamento" method="post">
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
                        <tr>
                            <th>Campos</th>
                            <th>Dados no sistema</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td><strong>ID</strong></td><td><input type="text" name="id" class="id_border" value="<%= id%>" readonly></td></tr>
                        <tr><td><strong>Valor</strong></td><td><%= valor%></td></tr>
                        <tr><td><strong>Data de Pagamento</strong></td><td><%= data_pagamento%></td></tr>
                        <tr><td><strong>Pagante</strong></td><td><%= pagante%></td></tr>
                        <tr><td><strong>Recebedor</strong></td><td><%= recebedor%></td></tr>
                        <tr><td><strong>Descrição</strong></td><td><%= descricao%></td></tr>
                        <tr><td><strong>Inquilino</strong></td><td><%= inquilino%></td></tr>
                        <tr><td><strong>Número do apartamento</strong></td><td><%= numero_apartamento%></td></tr>
                        <tr><td colspan="2"><input type="button" value="deletar" onclick="deletar()"></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
        <%
            rs.close();
            stmt.close();
            conn.close();
        %>
    </body>
</html>
