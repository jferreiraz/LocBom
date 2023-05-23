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
                if (document.formAlterarLogin.nome.value === "") {
                    alert("Campo nome não informado");
                    return false;
                }
                if (document.formAlterarLogin.email.value === "") {
                    alert("Campo email não informado");
                    return false;
                }
                if (document.formAlterarLogin.senha.value === "") {
                    alert("Campo senha não informado");
                    return false;
                }

                document.formAlterarLogin.submit();

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
                    <li><a href="gerenciarUsuarios.jsp">Voltar ao gerenciar usuarios</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Alteração de Usuários <p>
        </div>
        <form name="formAlterarLogin" action="AlterarLogin" method="post">

            <%
                int id = 0;
                String nome = "";
                String email = "";
                String senha = "";
                String tipoUsuario = "";
                String dbId = request.getParameter("id");

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from login where id_usuario =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_usuario");
                    nome = rs.getString("nome");
                    email = rs.getString("email");
                    senha = rs.getString("senha");
                    tipoUsuario = rs.getString("tipo_usuario");
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
                        <tr><td>Id</td><td><input type="text" class="id_border" name="id" value="<%= id%>" readonly></td><td><%= id%></td></tr>
                        <tr><td>Nome</td><td><input type="text" name="nome" value="<%= nome%>"></td><td><%= nome%></td></tr>
                        <tr><td>Email</td><td><input type="text" name="email" value="<%= email%>"></td><td><%= email%></td></tr>
                        <tr><td>Senha</td><td><input type="password" name="senha" value="<%= senha%>"></td><td><%= senha%></td></tr>
                        <tr><td>Tipo Usuário</td><td><input type="text" name="tipo_usuario" value="<%= tipoUsuario%>"></td><td><%= tipoUsuario%></td></tr>
                        <tr><td colspan="3"><input type="button" value="cadastrar" onclick="validarAlteracao()"></td></tr>
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
