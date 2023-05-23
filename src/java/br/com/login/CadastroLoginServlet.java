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

public class CadastroLoginServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public CadastroLoginServlet() {
            super();
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter writer = response.getWriter();
            
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            String tipo_usuario = request.getParameter("tipo_usuario");

            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Usuario u = new Usuario();
                
                u.setNome(nome);
                u.setEmail(email);
                u.setSenha(senha);
                u.setTipo_usuario(tipo_usuario);

                UsuarioDAO dao = new UsuarioDAO(con);
                dao.adicionar(u);
                
                request.setAttribute("nome", u.getNome());
                request.setAttribute("email", u.getEmail());
                request.setAttribute("senha", u.getSenha());
                request.setAttribute("tipo_usuario", u.getTipo_usuario());
                
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
