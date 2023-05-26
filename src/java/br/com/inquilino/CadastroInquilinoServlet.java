package br.com.inquilino;

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

public class CadastroInquilinoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
        public CadastroInquilinoServlet() {
            super();
        }
    
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter writer = response.getWriter();
            HttpSession session = request.getSession();
                        
            String nome_inquilino = request.getParameter("nome_inquilino");
            String apartamento = request.getParameter("apartamento");
            String data_entrada = request.getParameter("data_entrada");
            String endereco = request.getParameter("endereco");
            String id_usuario = (String) session.getAttribute("id_usuario");
 
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Inquilino i = new Inquilino();
                i.setNome_inquilino(nome_inquilino);
                i.setApartamento(apartamento);
                i.setData_entrada(data_entrada);
                i.setEndereco(endereco);
                i.setId_usuario(Integer.valueOf(id_usuario));

                InquilinoDAO dao = new InquilinoDAO(con);
                dao.adicionar(i);
                request.setAttribute("nome_inquilino", i.getNome_inquilino());
                request.setAttribute("apartamento", i.getApartamento());
                request.setAttribute("data_entrada", i.getData_entrada());
                request.setAttribute("endereco", i.getEndereco());
                request.setAttribute("id_usuario", i.getId_usuario());
                
                request.getRequestDispatcher("../viewInquilinos/gerenciarInquilinos.jsp").forward(request, response);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
}