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

public class AlterarPagamentoServlet extends HttpServlet{
    
    private static final long serialVersionUID = 1L;

        public AlterarPagamentoServlet() {
            super();
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            PrintWriter writer = response.getWriter();
            
            String id_pagamentos = request.getParameter("id_pagamentos");
            String valor = request.getParameter("valor");
            String data_pagamento = request.getParameter("data_pagamento");
            String pagante = request.getParameter("pagante");
            String recebedor = request.getParameter("recebedor");
            String descricao = request.getParameter("descricao");
            String inquilino = request.getParameter("inquilino");
            String numero_apartamento = request.getParameter("numero_apartamento");
            
            Connection con;
            try {
            
                con = CriarConexao.getConexao();

                Pagamento p = new Pagamento();
                
                p.setValor(Double.valueOf(valor));
                p.setData_pagamento(data_pagamento);
                p.setPagante(pagante);
                p.setRecebedor(recebedor);
                p.setDescricao(descricao);
                p.setInquilino(inquilino);
                p.setNumero_apartamento(numero_apartamento);
                p.setId_pagamentos(Integer.valueOf(id_pagamentos));

                PagamentoDAO dao = new PagamentoDAO(con);
                dao.alterar(p);
               
                request.setAttribute("valor", p.getValor());
                request.setAttribute("data_pagamento", p.getData_pagamento());
                request.setAttribute("pagante", p.getPagante());
                request.setAttribute("recebedor", p.getRecebedor());
                request.setAttribute("descricao", p.getDescricao());
                request.setAttribute("inquilino", p.getInquilino());
                request.setAttribute("numero_apartamento", p.getNumero_apartamento());
                request.setAttribute("id_pagamentos", p.getId_pagamentos());
                
                request.getRequestDispatcher("gerenciarPagamentos.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}