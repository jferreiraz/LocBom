package br.com.reforma;

import br.com.conexao.CriarConexao; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AlterarReformaServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public AlterarReformaServlet() {
            super();
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter writer = response.getWriter();
            
            String id_reformas = request.getParameter("id_reformas");
            String valor = request.getParameter("valor");
            String endereco = request.getParameter("endereco");
            String descricao = request.getParameter("descricao");
            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Reforma r = new Reforma();
                
                r.setValor(Double.valueOf(valor));
                r.setEndereco(endereco);
                r.setDescricao(descricao);
                r.setId_reformas(Integer.valueOf(id_reformas));

                ReformaDAO dao = new ReformaDAO(con);
                dao.alterar(r);
               
                request.setAttribute("valor", r.getValor());
                request.setAttribute("endereco", r.getEndereco());
                request.setAttribute("descricao", r.getDescricao());
                request.setAttribute("id_reformas", r.getId_reformas());
                
                request.getRequestDispatcher("gerenciarReformas.jsp/").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}