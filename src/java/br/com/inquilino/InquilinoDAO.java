package br.com.inquilino;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InquilinoDAO {
    private Connection con;
    public InquilinoDAO(Connection con) {
        this.con = con;
    }
    public void adicionar(Inquilino i) throws SQLException {
        String sql = "insert into inquilinos(nome_inquilino,quantidade_pessoas,data_entrada,endereco) values (?,?,?,?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, i.getNome_inquilino());
            stmt.setString(2, i.getQuantidade_pessoas());
            stmt.setString(3, i.getData_entrada());
            stmt.setString(4, i.getEndereco());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    public void alterar(Inquilino i) throws SQLException {
        String sql = "UPDATE inquilinos SET nome_inquilino = ?, quantidade_pessoas = ?, data_entrada = ?, endereco = ? WHERE id_inquilinos = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, i.getNome_inquilino());
            stmt.setString(2, i.getQuantidade_pessoas());
            stmt.setString(3, i.getData_entrada());
            stmt.setString(4, i.getEndereco());
            stmt.setInt(5, i.getId_inquilinos());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void deletar(Inquilino i) throws SQLException {
        String sql = "DELETE FROM inquilinos WHERE id_inquilinos = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, i.getId_inquilinos());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
}