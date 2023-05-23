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
import javax.servlet.http.HttpSession;

public class CadastroEnderecoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
        public CadastroEnderecoServlet() {
            super();
        }
               
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession();
            PrintWriter writer = response.getWriter();
            String cidade = request.getParameter("cidade");
            String bairro = request.getParameter("bairro");
            String endereco = request.getParameter("endereco");
            String quantidadeAptos = request.getParameter("quantidade_apartamentos");
            String id_usuario = (String) session.getAttribute("id_usuario");
            //int quantidadeApartamentos = Integer.parseInt(request.getParameter("quantidade_apartamentos"));
            //int quantidadeApartamentos = Integer.parseInt(request.getParameter("quantidade_apartamentos"));
            //int telefone = Integer.parseInt(request.getParameter(“telefone”));
            //int quantidadeApartamentos = (int) request.getAttribute("quantidade_apartamentos");

            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Endereco e = new Endereco();
                e.setCidade(cidade);
                e.setBairro(bairro);
                e.setEndereco(endereco);
                //e.setQuantidadeApartamentos(quantidadeApartamentos);
                e.setQuantidadeApartamentos(quantidadeAptos);
                e.setId_usuario(Integer.valueOf(id_usuario));

                EnderecoDAO dao = new EnderecoDAO(con);
                dao.adicionar(e);
                request.setAttribute("cidade", e.getCidade());
                request.setAttribute("bairro", e.getBairro());
                request.setAttribute("endereco", e.getEndereco());
                request.setAttribute("quantidade_apartamentos", e.getQuantidadeApartamentos());
                request.setAttribute("id_usuario", e.getId_usuario());
                
                request.getRequestDispatcher("gerenciarEnderecos.jsp").forward(request, response);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
}