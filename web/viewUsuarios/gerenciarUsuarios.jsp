<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head> 
        <link rel="stylesheet" type="text/css" href="../ref/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Logado</title>
    </head>
    <body>
        <div class="navegador">
            <nav>
                <img src="../imagens/LocBomLogo.png" class="logo">
                <ul>
                    <li><a href="../viewEnderecos/gerenciarEnderecos.jsp">Gerenciar Endereços</a></li>
                    <li><a href="../viewPagamentos/gerenciarPagamentos.jsp">Gerenciar Pagamentos</a></li>
                    <li><a href="../viewInquilinos/gerenciarInquilinos.jsp">Gerenciar Inquilinos</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font"> Página  de Gerenciamento dos Usuários <p>
        </div>
        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                <tr>
                    <th><strong>Nome</strong></th>
                    <th><strong>Email</strong></th>
                    <th><strong>Senha</strong></th>
                    <th><strong>Alterações</strong><br><i>Editar/Remover</i></th>
                </tr>
                </thead>
                <tbody>
                <%
                    int id = 0;
                    String nome = "";
                    String email = "";
                    String senha = "";

                    Connection conn = CriarConexao.getConexao();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from login");
                    while (rs.next()) {
                        id = rs.getInt("id_usuario");
                        nome = rs.getString("nome");
                        email = rs.getString("email");
                        senha = rs.getString("senha");
                %>

                <tr>
                    <td><%=nome%></td>
                    <td><%=email%></td>
                    <td><%=senha%></td>
                    <td><a href="alterarUsuarios.jsp?id=<%=id%>"><img height="25" width="25" class="btnSize" src="../imagens/logoEditar.png"></a>
                        <a href="deletarUsuarios.jsp?id=<%=id%>"><img height="25" width="25" class="btnSize" src="../imagens/logoRemover.png"></a></td>
                </tr>
                <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                %>
                </tbody>
            </table>
        </div>
    </body>
</html>

