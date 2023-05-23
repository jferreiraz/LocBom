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
                    <li><a href="../viewInquilinos/gerenciarInquilinos.jsp">Gerenciar Inquilinos</a></li>
                    <li><a href="../viewUsuarios/gerenciarUsuarios.jsp">Gerenciar Usuários</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font"> Página de Gerenciamento dos Pagamentos <p>
                <a href="adicionarPagamentos.jsp">Adicionar Pagamentos</a>
        </div>

        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th><strong>Id</strong></th>
                        <th><strong>Valor</strong></th>
                        <th><strong>Data de pagamento</strong></th>
                        <th><strong>Pagante</strong></th>
                        <th><strong>Recebedor</strong></th>
                        <th><strong>Descricao</strong></th>
                        <th><strong>Inquilino</strong></th>
                        <th><strong>Número Apartamento</strong></th>
                        <th colspan="2"><strong>Alterações</strong></th>
                    </tr>
                </thead>
                <tbody>

                    <%

                        String dbInquilino = request.getParameter("dbInquilino");

                        if (dbInquilino != null) {

                            int id = 0;
                            double valor = 0;
                            String data_pagamento = "";
                            String pagante = "";
                            String recebedor = "";
                            String descricao = "";
                            String inquilino = "";
                            String numero_apartamento = "";

                            Connection conn = CriarConexao.getConexao();
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from pagamentos where inquilino =\'" + dbInquilino + "\' ");

                            while (rs.next()) {
                                id = rs.getInt("id_pagamentos");
                                valor = rs.getDouble("valor");
                                data_pagamento = rs.getString("data_pagamento");
                                pagante = rs.getString("pagante");
                                recebedor = rs.getString("recebedor");
                                descricao = rs.getString("descricao");
                                inquilino = rs.getString("inquilino");
                                numero_apartamento = rs.getString("numero_apartamento");
                    %>

                    <tr>
                        <td><%=id%></td>
                        <td><%=valor%></td>
                        <td><%=data_pagamento%></td>
                        <td><%=pagante%></td>
                        <td><%=recebedor%></td>
                        <td><%=descricao%></td>
                        <td><%=inquilino%></td>
                        <td><%=numero_apartamento%></td>
                        <td><a href="alterarPagamentos.jsp?id=<%=id%>">Editar</a></td>
                        <td><a href="deletarPagamentos.jsp?id=<%=id%>">Deletar</a></td>
                    </tr>
                    <%
                        }
                        rs.close();
                        stmt.close();
                        conn.close();

                    } else {
                        int id = 0;
                        double valor = 0;
                        String data_pagamento = "";
                        String pagante = "";
                        String recebedor = "";
                        String descricao = "";
                        String inquilino = "";
                        String numero_apartamento = "";

                        Connection conn = CriarConexao.getConexao();
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("select * from pagamentos");
                        while (rs.next()) {
                            id = rs.getInt("id_pagamentos");
                            valor = rs.getDouble("valor");
                            data_pagamento = rs.getString("data_pagamento");
                            pagante = rs.getString("pagante");
                            recebedor = rs.getString("recebedor");
                            descricao = rs.getString("descricao");
                            inquilino = rs.getString("inquilino");
                            numero_apartamento = rs.getString("numero_apartamento");
                    %>

                    <tr>
                        <td><%=id%></td>
                        <td><%=valor%></td>
                        <td><%=data_pagamento%></td>
                        <td><%=pagante%></td>
                        <td><%=recebedor%></td>
                        <td><%=descricao%></td>
                        <td><%=inquilino%></td>
                        <td><%=numero_apartamento%></td>
                        <td><a href="alterarPagamentos.jsp?id=<%=id%>">Editar</a></td>
                        <td><a href="deletarPagamentos.jsp?id=<%=id%>">Deletar</a></td>
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

