<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.conexao.CriarConexao"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    String endereco = "";
    String dbEndereco = request.getParameter("dbEndereco");
    String sql = "";
    String enderecoTitulo = "";
    
    if(dbEndereco == null){sql="select (endereco) from endereco"; enderecoTitulo= "";}
    else
    {sql = "select (endereco) from endereco WHERE endereco =\'" + dbEndereco + "\'"; enderecoTitulo = dbEndereco;}

    Connection conn = CriarConexao.getConexao();
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html14/loose.dtd">
<html>
    <head>
        <title>Página de cadastro de Inquilinos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="../ref/style.css" />
        <script type="text/javascript">
            function validar() {
                var nome_inquilino_cad = frmCadastrarInquilino.nome_inquilino_cad.value;
                var apartamento_cad = frmCadastrarInquilino.apartamento_cad.value;
                var data_entrada_cad = frmCadastrarInquilino.data_entrada_cad.value;
                var endereco_cad = frmCadastrarInquilino.endereco_cad.value;

                if (nome_inquilino_cad == "") {
                    alert("Preencha o campo do nome do inquilino!");
                    frmCadastrarInquilino.nome_inquilino_cad.focus();
                    return false;
                }

                if (apartamento_cad == "") {
                    alert("Preencha o campo de apartamento!");
                    frmCadastrarInquilino.apartamento_cad.focus();
                    return false;
                }

                if (data_entrada_cad == "") {
                    alert("Preencha com a data de entrada!");
                    frmCadastrarInquilino.data_entrada_cad.focus();
                    return false;
                }
                if (endereco_cad == "") {
                    alert("Preencha com o endereço!");
                    frmCadastrarInquilino.endereco_cad.focus();
                    return false;
                } else {
                    alert("Cadastro de inquilino realizado com sucesso! ");
                    return false;
                }
        </script>
    </head> 
    <body>
        <div class="navegador">
            <nav>
                <img src="../imagens/LocBomLogo.png" class="logo">
                <ul>
                    <li><a href="gerenciarInquilinos.jsp">Voltar ao gerenciar inquilinos</a></li>
                    <li><a href="../logado.jsp" class="menu-back">Voltar ao menu principal</a></li>
                </ul>
            </nav>
        </div>
        <div class="menu">
            <p class="font">Adição de Inquilino no endereço<br><i><%=enderecoTitulo%></i><p>
        </div>
        <form name="frmCadastrarInquilino" action="CadastroInquilino" method="post">
            <div class="table_body">
                <table border="1" cellspacing="0">
                    <thead>
                        <tr>
                            <th colspan="4">Realize o cadastro abaixo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><label for="nome_cad">Nome do inquilino </label></td>
                            <td><label for="apartamento_cad">Apartamento </label></td>
                            <td><label for="data_cad">Data de entrada </label></td>
                            <td><label for="endereco_cad">Endereço </label></td>
                        </tr>
                        <tr>
                            <td><input id="nome_cad" name="nome_inquilino" required="required" type="text" placeholder="ex. Alberto"/></td>
                            <td><input id="apartamento_cad" name="apartamento" required="required" type="text" placeholder="ex. 2 "/></td>
                            <td><input id="data_cad" name="data_entrada" required="required" type="date" placeholder="ex. 20/03/2022"/></td>
                            <td><select name=endereco id="endereco_cad">
                                    <%                                        while (rs.next()) {
                                            endereco = rs.getString("endereco"); 
                                    %>
                                    <option  value="<%=endereco%>" ><%=endereco%></option>
                                        <% } %>
                                </select></td>
                        </tr>
                        <tr><td colspan="4"><input type="submit" value="Cadastrar" onclick="return validar()"/></td></tr>
                    </tbody>
                </table>
            </div>
        </form>
    </body>
</html>

<%
    rs.close();
    stmt.close();
    conn.close();
%>