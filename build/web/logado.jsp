<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">

<%
    String email = (String) session.getAttribute("email");
    String nome = (String) session.getAttribute("nome");
    String tipoUsuario = (String) session.getAttribute("tipo_usuario");
    String idUsuario = (String) session.getAttribute("id_usuario");
%>

<html>
    <head> 
        <link rel="stylesheet" type="text/css" href="ref/style.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Logado</title>
    </head>
    <body>
        <form action="remover.jsp">
            <div class="navegador">
                <nav>
                    <img src="imagens/LocBomLogo.png" class="logo">
                    <ul>
                        <li><a href="viewEnderecos/gerenciarEnderecos.jsp">Gerenciar Endereços</a></li>
                        <li><a href="viewInquilinos/gerenciarInquilinos.jsp">Gerenciar Inquilinos</a></li>
                        <li><a href="viewPagamentos/gerenciarPagamentos.jsp">Gerenciar Pagamentos</a></li>
                        <li><a href="viewUsuarios/gerenciarUsuarios.jsp">Gerenciar Usuários</a></li>
                    </ul>
                    <button type="submit" class="sair">Encerrar Sessão</button>
                </nav>
            </div>
        </form>
        <div class="menu">
            <p class="font"> Menu Inicial <p>
        </div>
        <div class="main-div">
            <div class="left-div">
                <img src="imagens/rent.svg" class="image" alt="index">
            </div>
            <div class="right-div">
                <label> Seja bem-vindo <%=nome%>,</label><br><br>
                <label> Você está logado com o email: <%=email%>.</label><br><br>
                <label> Sua conta possui acesso de <%=tipoUsuario%>.</label><br><br>
                <label> Sua conta possui acesso de <%=idUsuario%>.</label><br><br>
            </div>
        </div>
    <footer>
        <p>Desenvolvido por jferreiraz<p>
    </footer>
</body>
</html>
