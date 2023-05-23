package br.com.conexao;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class CriarConexao {
    
    public static Connection getConexao() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.print("Conectou");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/bancolocbom", "root", "");
        } catch (SQLException e) {
            throw new SQLException(e);
        } catch (ClassNotFoundException el) {
            throw new SQLException (el);
        }
    }
    
}
