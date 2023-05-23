package br.com.pagamento;

public class Pagamento {
    private int id_pagamentos;
    private int id_usuario;
    private double valor;
    private String data_pagamento;
    private String descricao;
    private String inquilino;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_pagamentos() {
        return id_pagamentos;
    }

    public void setId_pagamentos(int id_pagamentos) {
        this.id_pagamentos = id_pagamentos;
    }

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public String getData_pagamento() {
        return data_pagamento;
    }

    public void setData_pagamento(String data_pagamento) {
        this.data_pagamento = data_pagamento;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getInquilino() {
        return inquilino;
    }

    public void setInquilino(String inquilino) {
        this.inquilino = inquilino;
    }
      
}
