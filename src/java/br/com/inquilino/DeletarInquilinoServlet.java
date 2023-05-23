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

public class DeletarInquilinoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public DeletarInquilinoServlet() {
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

                Inquilino i = new Inquilino();
              
                i.setId_inquilinos(Integer.valueOf(id));

                InquilinoDAO dao = new InquilinoDAO(con);
                dao.deletar(i);

                request.setAttribute("id_inquilinos", i.getId_inquilinos());
                request.getRequestDispatcher("gerenciarInquilinos.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}