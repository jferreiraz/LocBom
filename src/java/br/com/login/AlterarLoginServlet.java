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

public class AlterarLoginServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public AlterarLoginServlet() {
            super();
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter writer = response.getWriter();
            
            String id = request.getParameter("id");
                        String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String tipo_usuario = request.getParameter("tipo_usuario");
            
            
             //sint id = request.getParameter("id");
            

            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Usuario u = new Usuario();
               
                u.setEmail(email);
                u.setNome(nome);
                u.setSenha(senha);
                u.setTipoUsuario(tipo_usuario);
                u.setId(Integer.valueOf(id));
                
                //u.setId(id);
                
                //id = rs.getInt("id");

                UsuarioDAO dao = new UsuarioDAO(con);
                dao.alterar(u);
               
                request.setAttribute("nome", u.getNome());
                
                request.setAttribute("email", u.getEmail());
                
                request.setAttribute("senha", u.getSenha());
                
                request.setAttribute("tipo_usuario", u.getTipoUsuario());
                
                request.setAttribute("id_usuario", u.getId());
                request.getRequestDispatcher("gerenciarUsuarios.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
