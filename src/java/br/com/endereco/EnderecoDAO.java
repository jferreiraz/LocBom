package br.com.endereco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class EnderecoDAO {
    private Connection con;
    public EnderecoDAO(Connection con) {
        this.con = con;
    }
    public void adicionar(Endereco e) throws SQLException {
        String sql = "insert into endereco(cidade,bairro,endereco,quantidade_apartamentos,id_usuario) values (?,?,?,?,?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, e.getCidade());
            stmt.setString(2, e.getBairro());
            stmt.setString(3, e.getEndereco());
            stmt.setString(4, e.getQuantidadeApartamentos());
            stmt.setInt(5, e.getId_usuario());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    public void alterar(Endereco e) throws SQLException {
        String sql = "UPDATE endereco SET cidade = ?, bairro = ?, endereco = ?, quantidade_apartamentos = ? WHERE id_endereco = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, e.getCidade());
            stmt.setString(2, e.getBairro());
            stmt.setString(3, e.getEndereco());
            stmt.setString(4, e.getQuantidadeApartamentos());
            stmt.setInt(5, e.getIdEndereco());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void deletar(Endereco e) throws SQLException {
        String sql = "DELETE FROM endereco WHERE id_endereco = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, e.getIdEndereco());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            con.close();
        }
    }
}










