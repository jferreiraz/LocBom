package br.com.pagamento;

public class Pagamento {
    private int id_pagamentos;
    private double valor;
    private String data_pagamento;
    private String pagante;
    private String recebedor;
    private String descricao;
    private String inquilino;
    private String numero_apartamento;

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

    public String getPagante() {
        return pagante;
    }

    public void setPagante(String pagante) {
        this.pagante = pagante;
    }

    public String getRecebedor() {
        return recebedor;
    }

    public void setRecebedor(String recebedor) {
        this.recebedor = recebedor;
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

    public String getNumero_apartamento() {
        return numero_apartamento;
    }

    public void setNumero_apartamento(String numero_apartamento) {
        this.numero_apartamento = numero_apartamento;
    }
    
    
}
