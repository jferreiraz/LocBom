<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.reforma.Reforma"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%> 
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script type="text/javascript">
            function validarAlteracao() {
                if (document.formAlterarReforma.valor.value === "") {
                    alert("Campo valor não informado");
                    return false;
                }
                if (document.formAlterarReforma.endereco.value === "") {
                    alert("Campo endereço não informado");
                    return false;
                }

                document.formAlterarReforma.submit();

            }
        </script>
        <title>Alterar</title>
        <link rel="stylesheet" type="text/css" href="../ref/style.css" />
    </head>
    <body>
        <div class="navegador">
            <nav>
                <img src="../imagens/LocBomLogo.png" class="logo">
                <ul>
                    <li><a href="gerenciarReformas.jsp">Voltar ao gerenciar reformas</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Alteração de Reformas <p>
        </div>
        <form name="formAlterarReforma" action="AlterarReforma" method="post">
            <%
                int id = 0;
                String valor = "";
                String descricao = "";
                String endereco = "";
                String enderecoAntigo = "";
                String dbId = request.getParameter("id");
                String sql = "select * from reformas";

                Connection conn = CriarConexao.getConexao();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from reformas where id_reformas =\'" + dbId + "\' ");

                while (rs.next()) {
                    id = rs.getInt("id_reformas");
                    valor = rs.getString("valor");
                    descricao = rs.getString("descricao");
                    enderecoAntigo = rs.getString("endereco");
                }

            %>

            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr >
                            <th>Campos</th>
                            <th>Novos campos</th>
                            <th>Campos no sistema</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>Id</td><td><input type="text" class="id_border" name="id_reformas" value="<%= id%>" readonly></td><td><%= id%></td></tr>
                        <tr><td>Valor</td><td><input type="text" name="valor" value="<%= valor%>"></td><td><%= valor%></td></tr>
                        <tr><td>Descrição</td><td><input type="text" name="descricao" value="<%= descricao%>"></td><td><%= descricao%></td></tr>
                        <tr><td>Endereço</td><td><select name="endereco" id="endereco_cad">
                                    <%
                                        ResultSet rs2 = stmt.executeQuery(sql);
                                        while (rs2.next()) {
                                            endereco = rs2.getString("endereco");
                                    %>
                                    <option  value="<%=endereco%>" ><%=endereco%></option>
                                    <% }%>
                                </select><td><%= enderecoAntigo%></td></tr>
                        <tr><td colspan="3"><input class="btn_table" type="button" value="Alterar" onclick="validarAlteracao()"></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
        <%
            stmt.close();
            conn.close();
        %>
    </body>
</html>