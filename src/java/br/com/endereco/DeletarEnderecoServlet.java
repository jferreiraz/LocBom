package br.com.endereco;

import br.com.conexao.CriarConexao;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletarEnderecoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
        public DeletarEnderecoServlet() {
            super();
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter writer = response.getWriter();
            
            String id = request.getParameter("id");
            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Endereco e = new Endereco();
              
                e.setIdEndereco(Integer.valueOf(id));

                EnderecoDAO dao = new EnderecoDAO(con);
                dao.deletar(e);

                request.setAttribute("id_endereco", e.getIdEndereco());
                request.getRequestDispatcher("gerenciarEnderecos.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}