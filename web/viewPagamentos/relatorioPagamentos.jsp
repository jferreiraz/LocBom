<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.pagamento.Pagamento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page contentType="application-/vnd.ms-excel"%>

<%
    String nomeArquivo = "relatorioPagamentos.xls";
    response.setHeader("Content-Disposition","attachment;filename="+nomeArquivo);
%>

<html>
    <head>
        <title>Relatório Endereços</title>
    </head>
    <body>
        <div class="table_body">
            <table width="700px" border="1" cellspacing="0">
                <thead>
                    <tr>
                        <th><strong>Id Pagamento</strong></th>
                        <th><strong>Valor Pagamento</strong></th>
                        <th><strong>Data Pagamento</strong></th>
                        <th><strong>Descrição</strong></th>
                        <th><strong>Nome Inquilino</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        double valor = 0;
                        String data_pagamento = "";
                        String descricao = "";
                        String inquilino = "";

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM pagamentos where id_usuario = \'" + idUsuario + "\'  ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_pagamentos");
                            valor = rs.getDouble("valor");
                            data_pagamento = rs.getString("data_pagamento");
                            descricao = rs.getString("descricao");
                            inquilino = rs.getString("inquilino");        
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=valor%></td>
                        <td><%=data_pagamento%></td>
                        <td><%=descricao%></td> 
                        <td><%=inquilino%></td> 
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
