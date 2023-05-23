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
                if (document.formAlterarEndereco.cidade.value === "") {
                    alert("Campo cidade não informado");
                    return false;
                }
                if (document.formAlterarEndereco.bairro.value === "") {
                    alert("Campo bairro não informado");
                    return false;
                }
                if (document.formAlterarEndereco.endereco.value === "") {
                    alert("Campo endereço não informado");
                    return false;
                }

                document.formAlterarEndereco.submit();

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
                    <li><a href="gerenciarEnderecos.jsp">Voltar ao gerenciar endereços</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Alteração de Endereços <p>
        </div>
        <form name="formAlterarEndereco" action="AlterarEndereco" method="post">
            <%
                int idEndereco = 0;
                String cidade = "";
                String bairro = "";
                String endereco = "";
                String dbId = request.getParameter("id");

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from endereco where id_endereco =\'" + dbId + "\' ");

                while (rs.next()) {
                    idEndereco = rs.getInt("id_endereco");
                    cidade = rs.getString("cidade");
                    bairro = rs.getString("bairro");
                    endereco = rs.getString("endereco");
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
                        <tr><td>Id</td><td><input type="text" name="id_endereco" value="<%= idEndereco%>" class="id_border" readonly></td><td><%= idEndereco%></td></tr>
                        <tr><td>Cidade</td><td><input type="text" name="cidade" value="<%= cidade%>"></td><td><%= cidade%></td></tr>
                        <tr><td>Bairro</td><td><input type="text" name="bairro" value="<%= bairro%>"></td><td><%= bairro%></td></tr>
                        <tr><td>Endereço</td><td><input type="text" name="endereco" value="<%= endereco%>"></td><td><%= endereco%></td></tr>
                        <tr><td colspan="3"><input type="button" value="Alterar" onclick="validarAlteracao()"></td></tr>
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