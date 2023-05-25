<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.inquilino.Inquilino"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page contentType="application-/vnd.ms-excel"%>

<%
    String nomeArquivo = "relatorioInquilinos.xls";
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
                        <th><strong>Id Inquilino</strong></th>
                        <th><strong>Nome Inquilino</strong></th>
                        <th><strong>Apartamento</strong></th>
                        <th><strong>Data Entrada</strong></th>
                        <th><strong>Endereço</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        String nome_inquilino = "";
                        String apartamento = "";
                        String data_entrada = "";
                        String endereco = "";

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM inquilinos where id_usuario = \'" + idUsuario + "\'  ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_inquilinos");
                            nome_inquilino = rs.getString("nome_inquilino");
                            apartamento = rs.getString("apartamento");
                            data_entrada = rs.getString("data_entrada");
                            endereco = rs.getString("endereco");        
                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=nome_inquilino%></td>
                        <td><%=apartamento%></td>
                        <td><%=data_entrada%></td> 
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
