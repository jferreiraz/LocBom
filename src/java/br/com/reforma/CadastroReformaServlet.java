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
import javax.servlet.http.HttpSession;

public class CadastroReformaServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;
    
        public CadastroReformaServlet() {
            super();
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter writer = response.getWriter();
            HttpSession session = request.getSession();
            
            String valor = request.getParameter("valor");
            String endereco = request.getParameter("endereco");
            String descricao = request.getParameter("descricao");
            String id_usuario = (String) session.getAttribute("id_usuario");

            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Reforma r = new Reforma();
                r.setValor(Double.valueOf(valor));
                r.setEndereco(endereco);
                r.setDescricao(descricao);
                r.setId_usuario(Integer.valueOf(id_usuario));

                ReformaDAO dao = new ReformaDAO(con);
                dao.adicionar(r);
                request.setAttribute("valor", r.getValor());
                request.setAttribute("endereco", r.getEndereco());
                request.setAttribute("descricao", r.getDescricao());
                request.setAttribute("id_usuario", r.getId_usuario());
                
                request.getRequestDispatcher("gerenciarReformas.jsp").forward(request, response);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
}
