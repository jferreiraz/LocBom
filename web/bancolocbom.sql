CREATE SCHEMA IF NOT EXISTS bancolocbom;
USE bancolocbom;

CREATE TABLE `endereco` (
  `id_endereco` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `inquilinos` (
  `id_inquilinos` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `nome_inquilino` varchar(45) NOT NULL,
  `apartamento` varchar(45) NOT NULL,
  `data_entrada` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `login` (
  `id_usuario` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tipo_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `pagamentos` (
  `id_pagamentos` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `valor` double NOT NULL,
  `data_pagamento` varchar(45) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `inquilino` varchar(45) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_inquilinos` int(11) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `reformas` (
  `id_reformas` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valor` double NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `id_endereco` int(11) NOT NULL
) ENGINE=InnoDB;