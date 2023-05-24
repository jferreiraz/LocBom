package br.com.reforma;

public class Reforma {
    private int id_reformas;
    private int id_usuario;
    private double valor;
    private String descricao;
    private String endereco;

    public int getId_reformas() {
        return id_reformas;
    }

    public void setId_reformas(int id_reformas) {
        this.id_reformas = id_reformas;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
}
