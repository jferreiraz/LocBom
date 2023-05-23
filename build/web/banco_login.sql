DROP DATABASE Login;
CREATE SCHEMA IF NOT EXISTS Login DEFAULT CHARACTER SET utf8;
USE Login;

CREATE TABLE IF NOT EXISTS Login. tb_login (
id INT NOT NULL AUTO_INCREMENT,
email VARCHAR(50) NOT NULL,
senha VARCHAR(8) NOT NULL,
nome VARCHAR(30) NOT NULL,
PRIMARY KEY(id)) ENGINE = InnoDB;

DROP TABLE tb_login;

SELECT * FROM tb_login;