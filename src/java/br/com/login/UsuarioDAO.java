package br.com.login;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {
    private Connection con;
    public UsuarioDAO(Connection con) {
        this.con = con;
    }
    public void adicionar(Usuario u) throws SQLException {
        String sql = "insert into login(nome,email,senha) values (?,?,?)";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getSenha());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void alterar(Usuario u) throws SQLException {
        String sql = "UPDATE login SET nome = ?, email = ?, senha = ? WHERE id_usuario = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setString(1, u.getNome());
            stmt.setString(2, u.getEmail());
            stmt.setString(3, u.getSenha());
            stmt.setInt(4, u.getId());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            con.close();
        }
    }
    
    public void deletar(Usuario u) throws SQLException {
        String sql = "DELETE FROM login WHERE id_usuario = ?";
        
        try {
            PreparedStatement stmt = con.prepareStatement(sql);
            
            stmt.setInt(1, u.getId());
            
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            con.close();
        }
    }
    
}
