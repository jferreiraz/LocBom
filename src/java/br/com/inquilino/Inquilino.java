package br.com.inquilino;

public class Inquilino {
    private int id_inquilinos;
    private String nome_inquilino;
    private String quantidade_pessoas;
    private String data_entrada;
    private String endereco;

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

    public String getQuantidade_pessoas() {
        return quantidade_pessoas;
    }

    public void setQuantidade_pessoas(String quantidade_pessoas) {
        this.quantidade_pessoas = quantidade_pessoas;
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
