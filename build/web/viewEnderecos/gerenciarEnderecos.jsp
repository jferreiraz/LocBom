<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.endereco.Endereco"%>
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
                    <li><a href="../viewInquilinos/gerenciarInquilinos.jsp">Gerenciar Inquilinos</a></li>
                    <li><a href="../viewPagamentos/gerenciarPagamentos.jsp">Gerenciar Pagamentos</a></li>
                    <li><a href="../viewUsuarios/gerenciarUsuarios.jsp">Gerenciar Usuários</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font"> Página de Gerenciamento dos Endereços <p>
                <a href="adicionarEnderecos.jsp">Adicionar Endereços</a>
        </div>
        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th colspan="2"><strong>Cidade</strong></th>
                        <th colspan="2"><strong>Bairro</strong></th>
                        <th colspan="2"><strong>Endereço</strong></th>

                        <th><strong>Reformas</strong><br><i>Controlar</i></th>
                        <th><strong>Alterações</strong><br><i>Editar/Excluir</i></th>
                        <th><strong>Inquilinos</strong><br><i>Adicionar/Visualizar</i></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        String cidade = "";
                        String bairro = "";
                        String dbEndereco = "";
                        int quantidadeApartamentos = 0;

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM endereco WHERE id_usuario = ? ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        stmt.setString(1, idUsuario);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_endereco");
                            cidade = rs.getString("cidade");
                            bairro = rs.getString("bairro");
                            dbEndereco = rs.getString("endereco");
                            quantidadeApartamentos = rs.getInt("quantidade_apartamentos");

                    %>

                    <tr>

                        <td colspan="2"><%=cidade%></td>
                        <td colspan="2"><%=bairro%></td>
                        <td colspan="2"><%=dbEndereco%></td>

                        <td><a href="../viewInquilinos/gerenciarInquilinos.jsp?dbEndereco=<%=dbEndereco%>"><img height="25" width="25" class="btnSize" src="../imagens/estoque.png"></a></td>
                        
                        <td><a href="alterarEnderecos.jsp?id=<%=id%>"><img height="25" width="25" class="btnSize" src="../imagens/editar-arquivo.png"></a>
                            <a href="deletarEnderecos.jsp?id=<%=id%>"><img height="25" width="25" class="btnSize" src="../imagens/botao-apagar.png"></a></td>

                        <td><a href="../viewInquilinos/adicionarInquilinos.jsp?id=<%=id%>"><img height="25" width="25" class="btnSize" src="../imagens/adicionar-ficheiro.png"></a>
                            <a href="../viewInquilinos/gerenciarInquilinos.jsp?dbEndereco=<%=dbEndereco%>"><img height="25" width="25" class="btnSize" src="../imagens/documento.png"></a></td>

                        
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