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
                    <li><a href="../viewUsuarios/gerenciarUsuarios.jsp">Gerenciar Usuários</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font"> Página de Gerenciamento dos Inquilinos <p>
                <a href="adicionarInquilinos.jsp">Adicionar Inquilinos</a>
        </div>
        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th><strong>Id</strong></th>
                        <th><strong>Nome do inquilino</strong></th>
                        <th><strong>Quantidade de pessoas</strong></th>
                        <th><strong>Data de entrada</strong></th>
                        <th><strong>Endereco</strong></th>
                        <th colspan="2"><strong>Alterações</strong></th>
                        <th colspan="2"><strong>Pagamentos</strong></th>
                    </tr>
                </thead>
                <tbody>

                    <%

                        String dbEndereco = request.getParameter("dbEndereco");

                        if (dbEndereco != null) {

                            int id = 0;
                            String nome_inquilino = "";
                            String quantidade_pessoas = "";
                            String data_entrada = "";
                            String endereco = "";

                            Connection conn = CriarConexao.getConexao();
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from inquilinos where endereco =\'" + dbEndereco + "\' ");
                            while (rs.next()) {
                                id = rs.getInt("id_inquilinos");
                                nome_inquilino = rs.getString("nome_inquilino");
                                quantidade_pessoas = rs.getString("quantidade_pessoas");
                                data_entrada = rs.getString("data_entrada");
                                endereco = rs.getString("endereco");

                    %>

                    <tr>
                        <td><%=id%></td>
                        <td><%=nome_inquilino%></td>
                        <td><%=quantidade_pessoas%></td>
                        <td><%=data_entrada%></td>
                        <td><%=endereco%></td>
                        <td><a href="alterarInquilinos.jsp?id=<%=id%>">Editar</a></td>
                        <td><a href="deletarInquilinos.jsp?id=<%=id%>">Deletar</a></td>
                        <td><a href="../viewPagamentos/adicionarPagamentos.jsp?id=<%=id%>">Adicionar</a></td>
                        <td><a href="../viewPagamentos/gerenciarPagamentos.jsp?dbInquilino=<%=nome_inquilino%>">Visualizar</a></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();

                    } else {
                        int id = 0;
                        String nome_inquilino = "";
                        String quantidade_pessoas = "";
                        String data_entrada = "";
                        String endereco = "";

                        Connection conn = CriarConexao.getConexao();
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from inquilinos");
                        while (rs.next()) {
                            id = rs.getInt("id_inquilinos");
                            nome_inquilino = rs.getString("nome_inquilino");
                            quantidade_pessoas = rs.getString("quantidade_pessoas");
                            data_entrada = rs.getString("data_entrada");
                            endereco = rs.getString("endereco");
                    %>

                    <tr>
                        <td><%=id%></td>
                        <td><%=nome_inquilino%></td>
                        <td><%=quantidade_pessoas%></td>
                        <td><%=data_entrada%></td>
                        <td><%=endereco%></td>
                        <td><a href="alterarInquilinos.jsp?id=<%=id%>">Editar</a></td>
                        <td><a href="deletarInquilinos.jsp?id=<%=id%>">Deletar</a></td>
                        <td><a href="../viewPagamentos/adicionarPagamentos.jsp?id=<%=nome_inquilino%>">Adicionar</a></td>
                        <td><a href="../viewPagamentos/gerenciarPagamentos.jsp?dbInquilino=<%=nome_inquilino%>">Visualizar</a></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            stmt.close();
                            conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
