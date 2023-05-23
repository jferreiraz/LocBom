package br.com.inquilino;

public class Inquilino {
    private int id_inquilinos;
    private int id_usuario;
    private String nome_inquilino;
    private String apartamento;
    private String data_entrada;
    private String endereco;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public int getId_inquilinos() {
        return id_inquilinos;
    }

    public void setId_inquilinos(int id_inquilinos) {
        this.id_inquilinos = id_inquilinos;
    }

    public String getNome_inquilino() {
        return nome_inquilino;
    }

    public void setNome_inquilino(String nome_inquilino) {
        this.nome_inquilino = nome_inquilino;
    }

    public String getApartamento() {
        return apartamento;
    }

    public void setApartamento(String apartamento) {
        this.apartamento = apartamento;
    }

    public String getData_entrada() {
        return data_entrada;
    }

    public void setData_entrada(String data_entrada) {
        this.data_entrada = data_entrada;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    
}
