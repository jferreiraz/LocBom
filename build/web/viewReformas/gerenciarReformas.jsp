<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.endereco.Endereco"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    String dbEndereco = request.getParameter("dbEndereco");
%>
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
                    <li><a href="../viewInquilinos/gerenciarInquilinos.jsp">Gerenciar Inquilinos</a></li>
                    <li><a href="../viewPagamentos/gerenciarPagamentos.jsp">Gerenciar Pagamentos</a></li>
                    <li><a href="../viewUsuarios/gerenciarUsuarios.jsp">Gerenciar Usuários</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font"> Página de Controle de Reformas <%=dbEndereco%><p>
                <a href="../viewEnderecos/gerenciarEnderecos.jsp">   Voltar ao Gerenciar Endereços   </a>
        </div>
        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th colspan="2"><strong>ID</strong></th>
                        <th colspan="2"><strong>Descrição</strong></th>
                        <th colspan="2"><strong>Valor</strong></th>
                        <th colspan="2"><strong>Endereço</strong></th>
                        <th colspan="2"><strong>Id do Usuário</strong></th>

                        <th colspan="2"><strong>Reformas</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        String descricao = "";
                        String valor = "";

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM reformas WHERE id_usuario = \'" + idUsuario + "\' AND endereco= \'" + dbEndereco + "\' ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_reformas");
                            descricao = rs.getString("descricao");
                            valor = rs.getString("valor");
                            dbEndereco = rs.getString("endereco");
                            idUsuario = rs.getString("id_usuario");
                    %>

                    <tr>

                        <td colspan="2"><%=id%></td>
                        <td colspan="2"><%=descricao%></td>
                        <td colspan="2"><%=valor%></td>
                        <td colspan="2"><%=dbEndereco%></td>
                        <td colspan="2"><%=idUsuario%></td>

                        <td><a href="alterarEnderecos.jsp?id=<%=id%>">Editar</a></td>
                        <td><a href="deletarEnderecos.jsp?id=<%=id%>">Deletar</a></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>