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


public class AlterarEnderecoServlet extends HttpServlet{
    
        private static final long serialVersionUID = 1L;

        public AlterarEnderecoServlet() {
            super();
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter writer = response.getWriter();
            
            String idEndereco = request.getParameter("id_endereco");
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String endereco = request.getParameter("endereco");
            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Endereco e = new Endereco();
                
                e.setCidade(cidade);
                e.setBairro(bairro);
                e.setEndereco(endereco);
                e.setIdEndereco(Integer.valueOf(idEndereco));

                EnderecoDAO dao = new EnderecoDAO(con);
                dao.alterar(e);
               
                request.setAttribute("cidade", e.getCidade());
                request.setAttribute("bairro", e.getBairro());
                request.setAttribute("endereco", e.getEndereco());
                request.setAttribute("id_endereco", e.getIdEndereco());
                
                request.getRequestDispatcher("gerenciarEnderecos.jsp").forward(request, response);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
}