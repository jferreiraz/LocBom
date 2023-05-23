package br.com.pagamento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class PagamentoDAO {
    private Connection con;
    public PagamentoDAO(Connection con) {
        this.con = con;
    }
    public void adicionar(Pagamento p) throws SQLException {
        String sql = "insert into pagamentos(valor,data_pagamento,descricao,inquilino,id_usuario) values (?,?,?,?,?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setDouble(1, p.getValor());
            stmt.setString(2, p.getData_pagamento());
            stmt.setString(3, p.getDescricao());
            stmt.setString(4, p.getInquilino());
            stmt.setInt(5, p.getId_usuario());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    public void alterar(Pagamento p) throws SQLException {
        String sql = "UPDATE pagamentos SET valor = ?, data_pagamento = ?, descricao = ?, inquilino = ? WHERE id_pagamentos = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setDouble(1, p.getValor());
            stmt.setString(2, p.getData_pagamento());
            stmt.setString(3, p.getDescricao());
            stmt.setString(4, p.getInquilino());
            stmt.setInt(5, p.getId_pagamentos());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void deletar(Pagamento p) throws SQLException {
        String sql = "DELETE FROM pagamentos WHERE id_pagamentos = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, p.getId_pagamentos());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
}
