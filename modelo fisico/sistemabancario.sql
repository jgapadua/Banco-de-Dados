CREATE database SISTEMABANCARIO2B1;
USE SISTEMABANCARIO2B1;

CREATE TABLE AGENCIA(
CODIGO INT UNSIGNED AUTO_INCREMENT NOT NULL,
NOME VARCHAR (100) NOT NULL,
ENDERECO VARCHAR (150) NOT NULL,
GERENTE VARCHAR (100) NOT NULL,
PRIMARY KEY (CODIGO)
);


CREATE TABLE CLIENTES(
CPF CHAR(14) NOT NULL,
NOME VARCHAR (100) NOT NULL,
RG VARCHAR (25) NOT NULL,
ESTADOCIVIL VARCHAR (15) NOT nULL,
PRIMARY KEY (CPF)
);


CREATE TABLE CONTAS(

NUMERO INT UNSIGNED AUTO_INCREMENT NOT NULL,
SALDO DOUBLE (9,2) NOT NULL,
AGENCIA_CODIGO INT UNSIGNED NOT NULL,
CLIENTES_CPF CHAR (14) NOT NULL,
PRIMARY KEY (NUMERO),
FOREIGN KEY (AGENCIA_CODIGO) REFERENCES AGENCIA (CODIGO),
FOREIGN KEY (CLIENTES_CPF) REFERENCES CLIENTES (CPF)

);

DROP TABLE MOVIMENTACAO;

CREATE TABLE MOVIMENTACAO(

CONTAS_NUMERO INT UNSIGNED NOT NULL,
CLIENTES_CPF CHAR(14) NOT NULL,
DATA DATE NOT NULL,
HORA TIME NOT NULL,
QUANTIA DOUBLE(9,2) NOT NULL,
TIPO CHAR (1) NOT NULL,
PRIMARY KEY (CONTAS_NUMERO, CLIENTES_CPF),
FOREIGN KEY (CONTAS_NUMERO) REFERENCES CONTAS(NUMERO),
FOREIGN KEY (CLIENTES_CPF) REFERENCES CLIENTES(CPF)

);
