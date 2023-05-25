<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.reforma.Reforma"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page contentType="application-/vnd.ms-excel"%>

<%
    String nomeArquivo = "relatorioReformas.xls";
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
                        <th><strong>Id Reformas</strong></th>
                        <th><strong>Valor Reforma</strong></th>
                        <th><strong>Descrição</strong></th>
                        <th><strong>Endereço</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        String descricao = "";
                        String valor = "";
                        String endereco = "";

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM reformas where id_usuario = \'" + idUsuario + "\'  ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_reformas");
                            valor = rs.getString("valor");
                            descricao = rs.getString("descricao");
                            endereco = rs.getString("endereco");        
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=valor%></td>
                        <td><%=descricao%></td> 
                        <td><%=endereco%></td> 
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
