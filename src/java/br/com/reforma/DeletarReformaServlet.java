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

public class DeletarReformaServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

        public DeletarReformaServlet() {
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

                Reforma r = new Reforma();
              
                r.setId_reformas(Integer.valueOf(id));

                ReformaDAO dao = new ReformaDAO(con);
                dao.deletar(r);

                request.setAttribute("id_reformas", r.getId_reformas());
                request.getRequestDispatcher("gerenciarReformas.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
