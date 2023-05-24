<%//@page import="utilerias.Conversiones , java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.endereco.Endereco"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page contentType="application-/vnd.ms-excel"%>

<%
    String nomeArquivo = "relatorioEnderecos.xls";
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
                        <th><strong>Id Endereço</strong></th>
                        <th><strong>Estado</strong></th>
                        <th><strong>Bairro</strong></th>
                        <th><strong>Endereço</strong></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int id = 0;
                        String cidade = "";
                        String bairro = "";
                        String dbEndereco = "";

                        String idUsuario = (String) session.getAttribute("id_usuario");

                        String sql = "SELECT * FROM endereco where id_usuario = \'" + idUsuario + "\'  ";

                        Connection con;
                        con = CriarConexao.getConexao();
                        PreparedStatement stmt = con.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()) {
                            id = rs.getInt("id_endereco");
                            cidade = rs.getString("cidade");
                            bairro = rs.getString("bairro");
                            dbEndereco = rs.getString("endereco");

                    %>
                    <tr>
                        <td><%=id%></td>
                        <td><%=cidade%></td>
                        <td><%=bairro%></td>
                        <td><%=dbEndereco%></td>   
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
