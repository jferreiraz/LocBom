package br.com.pagamento;

import br.com.conexao.CriarConexao;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletarPagamentoServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

        public DeletarPagamentoServlet() {
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

                Pagamento p = new Pagamento();
              
                p.setId_pagamentos(Integer.valueOf(id));

                PagamentoDAO dao = new PagamentoDAO(con);
                dao.deletar(p);

                request.setAttribute("id_pagamentos", p.getId_pagamentos());
                request.getRequestDispatcher("gerenciarPagamentos.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}
