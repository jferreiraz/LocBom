package br.com.login;

import br.com.conexao.CriarConexao;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletarLoginServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public DeletarLoginServlet() {
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

                Usuario u = new Usuario();
              
                u.setId(Integer.valueOf(id));

                UsuarioDAO dao = new UsuarioDAO(con);
                dao.deletar(u);

                request.setAttribute("id_usuario", u.getId());
                request.getRequestDispatcher("gerenciarUsuarios.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
