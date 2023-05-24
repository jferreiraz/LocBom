package br.com.reforma;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ReformaDAO {
    private Connection con;
    public ReformaDAO(Connection con) {
        this.con = con;
    }
    public void adicionar(Reforma r) throws SQLException {
        String sql = "insert into reformas(descricao,endereco,valor,id_usuario) values (?,?,?,?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, r.getDescricao());
            stmt.setString(2, r.getEndereco());
            stmt.setDouble(3, r.getValor());
            stmt.setInt(4, r.getId_usuario());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    public void alterar(Reforma r) throws SQLException {
        String sql = "UPDATE reformas SET descricao = ?, endereco = ?, valor = ? WHERE id_reformas = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, r.getDescricao());
            stmt.setString(2, r.getEndereco());
            stmt.setDouble(3, r.getValor());
            stmt.setInt(4, r.getId_reformas());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void deletar(Reforma r) throws SQLException {
        String sql = "DELETE FROM reformas WHERE id_reformas = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, r.getId_reformas());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
}
