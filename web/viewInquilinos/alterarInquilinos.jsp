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
                if (document.formAlterarInquilinos.nome_inquilino.value === "") {
                    alert("Campo nome do inquilino não informado");
                    return false;
                }
                if (document.formAlterarInquilinos.quantidade_pessoas.value === "") {
                    alert("Campo quantidade de pessoas não informado");
                    return false;
                }
                if (document.formAlterarInquilinos.data_entrada.value === "") {
                    alert("Campo de data de entrada não informado");
                    return false;
                }
                if (document.formAlterarInquilinos.endereco.value === "") {
                    alert("Campo de endereço não informado");
                    return false;
                }

                document.formAlterarInquilinos.submit();

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
                    <li><a href="gerenciarInquilinos.jsp">Voltar ao gerenciar inquilinos</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Alteração de Inquilinos <p>
        </div>
        <form name="formAlterarInquilinos" action="AlterarInquilino" method="post">
            <%
                int id = 0;
                String nome_inquilino = "";
                String quantidade_pessoas = "";
                String data_entrada = "";
                String enderecoAntigo = "";
                String endereco = "";
                String dbId = request.getParameter("id");
                String sql = "select (endereco) from endereco";

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from inquilinos where id_inquilinos =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_inquilinos");
                    nome_inquilino = rs.getString("nome_inquilino");
                    quantidade_pessoas = rs.getString("quantidade_pessoas");
                    data_entrada = rs.getString("data_entrada");
                    enderecoAntigo = rs.getString("endereco");
                }

            %>
            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Campos</th>
                            <th>Novos campos</th>
                            <th>Campos no sistema</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Id</td><td><input class="id_border" type="text" name="id_inquilinos" value="<%= id%>" readonly></td><td><%= id%> </td></tr>
                        <tr><td>Nome do inquilino</td><td><input type="text" name="nome_inquilino" value="<%= nome_inquilino%>"></td><td><%= nome_inquilino%> </td></tr>
                        <tr><td>Quantidade de pessoas</td><td><input type="text" name="quantidade_pessoas" value="<%= quantidade_pessoas%>"></td><td><%= quantidade_pessoas%> </td></tr>
                        <tr><td>Data de entrada</td><td><input type="date" name="data_entrada" value="<%= data_entrada%>"></td><td><%= data_entrada%></td></tr>
                       
                        <tr><td>Endereço</td><td><select name="endereco" id="enderecos">
                                    <%                                       
                                                        ResultSet rs2 = stmt.executeQuery(sql);
                                        while (rs2.next()) {
                                            endereco = rs2.getString("endereco");
                                    %>
                                    <option  value="<%=endereco%>" ><%=endereco%></option>
                                    <% } %>
                                </select></td><td><%= enderecoAntigo%></td></tr>
                        <tr><td colspan="3"><input class="btn_alterar" type="button" value="Alterar" onclick="validarAlteracao()"></td></tr>
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