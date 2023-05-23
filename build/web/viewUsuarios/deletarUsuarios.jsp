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

                document.formDeletarLogin.submit();

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
                    <li><a href="gerenciarUsuarios.jsp">Voltar ao gerenciar usuarios</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Deletar Usuários <p>
        </div>
        <form name="formDeletarLogin" action="DeletarLogin" method="post">
            <%
                int id = 0;
                String nome = "";
                String email = "";
                String senha = "";
                String dbId = request.getParameter("id");

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from login where id_usuario =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_usuario");
                    nome = rs.getString("nome");
                    email = rs.getString("email");
                    senha = rs.getString("senha");
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
                        <tr><td><strong>Nome</strong></td><td><%= nome%></td></tr>
                        <tr><td><strong>Email</strong></td><td><%= email%></td></tr>
                        <tr><td><strong>Senha</strong></td><td><%= senha%></td></tr>
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
