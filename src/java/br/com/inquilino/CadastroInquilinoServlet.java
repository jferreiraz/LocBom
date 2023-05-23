package br.com.inquilino;

import br.com.endereco.Endereco;
import br.com.conexao.CriarConexao; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CadastroInquilinoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
        public CadastroInquilinoServlet() {
            super();
        }
    
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter writer = response.getWriter();
            
            //String id = request.getParameter("id"); //requisitar id endereço
                        
            String nome_inquilino = request.getParameter("nome_inquilino");
            String quantidade_pessoas = request.getParameter("quantidade_pessoas");
            String data_entrada = request.getParameter("data_entrada");
            String endereco = request.getParameter("endereco");
 
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Inquilino i = new Inquilino();
                //Endereco e = new Endereco();
                i.setNome_inquilino(nome_inquilino);
                i.setQuantidade_pessoas(quantidade_pessoas);
                i.setData_entrada(data_entrada);
                i.setEndereco(endereco);

                InquilinoDAO dao = new InquilinoDAO(con);
                dao.adicionar(i);
                //dao.adicionarEndereco();
                request.setAttribute("nome_inquilino", i.getNome_inquilino());
                request.setAttribute("quantidade_pessoas", i.getQuantidade_pessoas());
                request.setAttribute("data_entrada", i.getData_entrada());
                request.setAttribute("endereco", i.getEndereco());
                
                request.getRequestDispatcher("../viewInquilinos/gerenciarInquilinos.jsp").forward(request, response);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
}