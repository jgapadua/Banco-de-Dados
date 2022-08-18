DROP DATABASE loja_2b1;
CREATE database Loja_2B1;
USE Loja_2B1;

CREATE TABLE EMPRESA(
codigo int UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (60) NOT NULL,
endereco VARCHAR (45) NOT NULL,
telefone VARCHAR (45) NOT NULL,
email VARCHAR (80) NOT NULL,
PRIMARY KEY (codigo)
);
/* comando insert 
INSERT INTO TABLE(CAMPOS) VALUE(VALORES);
*/
insert into EMPRESA(codigo,nome,endereco,telefone,email) VALUES(NULL,'EMPRESA A','RUA A','(31)9999-9999','EMPRESAA@EMPRESAA.COM');
insert into EMPRESA(codigo,nome,endereco,telefone,email) VALUES(NULL,'EMPRESA B','RUA B','(31)9999-9999','EMPRESAB@EMPRESAB.COM');
insert into EMPRESA(codigo,nome,endereco,telefone,email) VALUES(NULL,'EMPRESA C','RUA C','(31)9999-9999','EMPRESAC@EMPRESAC.COM');
insert into EMPRESA(codigo,nome,endereco,telefone,email) VALUES(NULL,'EMPRESA D','RUA D','(31)9999-9999','EMPRESAD@EMPRESAD.COM');
insert into EMPRESA(codigo,nome,endereco,telefone,email) VALUES(NULL,'EMPRESA E','RUA E','(31)9999-9999','EMPRESAE@EMPRESAE.COM');

select * from EMPRESA;


CREATE TABLE LOJAS(
codigo INT UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (80) NOT NULL,
endereco VARCHAR (50) NOT NULL,
cidade VARCHAR (50) NOT NULL,
tipo_loja VARCHAR (60) NOT NULL,
Empresa_codigo INT NOT NULL,
PRIMARY KEY (codigo),
FOREIGN KEY (Empresa_codigo) REFERENCES Empresa (codigo)
);

insert into LOJAS(codigo,nome,endereco,cidade,tipo_loja,Empresa_codigo) VALUES(NULL,'LOJA A','RUA A','Belo Horizonte','Supermercado',18);
insert into LOJAS(codigo,nome,endereco,cidade,tipo_loja,Empresa_codigo) VALUES(NULL,'LOJA B','RUA B','Belo Horizonte','Supermercado',19);
insert into LOJAS(codigo,nome,endereco,cidade,tipo_loja,Empresa_codigo) VALUES(NULL,'LOJA C','RUA C','Belo Horizonte','Supermercado',20);
insert into LOJAS(codigo,nome,endereco,cidade,tipo_loja,Empresa_codigo) VALUES(NULL,'LOJA D','RUA D','Belo Horizonte','Supermercado',21);
insert into LOJAS(codigo,nome,endereco,cidade,tipo_loja,Empresa_codigo) VALUES(NULL,'LOJA E','RUA E','Belo Horizonte','Supermercado',22);

select * from LOJAS;

CREATE TABLE EMPREGADOS(

codigo INT UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (50) NOT NULL,
telefone VARCHAR (45) NOT NULL,
cidade VARCHAR (50) NOT NULL,
estado CHAR (2) NOT NULL,
email VARCHAR (80) NOT NULL,
Lojas_codigo INT NOT NULL,
PRIMARY KEY (codigo),
FOREIGN KEY (Lojas_codigo) REFERENCES Lojas (codigo)
);

insert into EMPREGADOS(codigo,nome,endereco,telefone,cidade,estado,email,Lojas_codigo) VALUES(NULL,'EMPREGADO A','RUA A','(31)9999-9999','Belo Horizonte','MG','EMPREGADOA@EMPREGADOA.COM',1);
insert into EMPREGADOS(codigo,nome,endereco,telefone,cidade,estado,email,Lojas_codigo) VALUES(NULL,'EMPREGADO B','RUA B','(31)9999-9999','Belo Horizonte','MG','EMPREGADOB@EMPREGADOB.COM',2);
insert into EMPREGADOS(codigo,nome,endereco,telefone,cidade,estado,email,Lojas_codigo) VALUES(NULL,'EMPREGADO C','RUA C','(31)9999-9999','Belo Horizonte','MG','EMPREGADOC@EMPREGADOC.COM',3);
insert into EMPREGADOS(codigo,nome,endereco,telefone,cidade,estado,email,Lojas_codigo) VALUES(NULL,'EMPREGADO D','RUA D','(31)9999-9999','Belo Horizonte','MG','EMPREGADOD@EMPREGADOD.COM',4);
insert into EMPREGADOS(codigo,nome,endereco,telefone,cidade,estado,email,Lojas_codigo) VALUES(NULL,'EMPREGADO E','RUA E','(31)9999-9999','Belo Horizonte','MG','EMPREGADOE@EMPREGADOE.COM',5);

select * from EMPREGADOS;

CREATE TABLE CLIENTES(

codigo INT UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (45) NOT NULL,
endereco VARCHAR (50) NOT NULL,
telefone VARCHAR (45) NOT NULL,
cidade VARCHAR (50) NOT NULL,
estado CHAR (2) NOT NULL,
email VARCHAR (80) NOT NULL,
PRIMARY KEY (codigo)
);

insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE A','RUA A','(11)9999-9999','São Paulo','SP','CLIENTEF@CLIENTEF.COM');
insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE A','RUA A','(31)9999-9999','Belo Horizonte','MG','CLIENTEA@CLIENTEA.COM');
insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE B','RUA B','(31)9999-9999','Belo Horizonte','MG','CLIENTEB@CLIENTEB.COM');
insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE C','RUA C','(31)9999-9999','Belo Horizonte','MG','CLIENTEC@CLIENTEC.COM');
insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE D','RUA D','(31)9999-9999','Belo Horizonte','MG','CLIENTED@CLIENTED.COM');
insert into CLIENTES(codigo,nome,endereco,telefone,cidade,estado,email) VALUES(NULL,'CLIENTE E','RUA E','(31)9999-9999','Belo Horizonte','MG','CLIENTEE@CLIENTEE.COM');

select * from CLIENTES;

CREATE TABLE PRODUTOS(

id INT UNSIGNED AUTO_INCREMENT NOT NULL,
descricao VARCHAR (100) NOT NULL,
valor DOUBLE (9,2) NOT NULL,
quantidade INTEGER NOT NULL,
observacao VARCHAR (100) NOT NULL,
Lojas_codigo INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (Lojas_codigo) REFERENCES Lojas (codigo)
);

insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'Cama',300.00,10,'DE MARCA',1);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'Vestido',500.00,10,'DE MARCA',1);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'Rua',600.00,10,'DE MARCA',1);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'ROUPA',100.00,10,'DE MARCA',1);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'VINHOS',294.00,20,'IMPORTADOS',2);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'CHOCOLATE',5.00,1000,'KIT KAT',3);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'CARNE',100.00,50,'ALCATRA',4);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'IOURGUTE',16.00,20,'DANONE',5);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'IOURGUTE',16.00,15,'itambe',5);
insert into PRODUTOS(id,descricao,valor,quantidade,observacao,Lojas_codigo) VALUES(NULL,'pão',3.00,19,'doce',5);

select * from PRODUTOS;

CREATE TABLE VENDAS(

idVendas INT UNSIGNED AUTO_INCREMENT NOT NULL,
data DATE NOT NULL,
total DOUBLE (9,2) NOT NULL,
hora TIME NOT NULL,
observacao VARCHAR (60) NOT NULL,
Lojas_codigo INT NOT NULL,
Clientes_codigo INT NOT NULL,
PRIMARY KEY (idVendas),
FOREIGN KEY (Lojas_codigo) REFERENCES Lojas (codigo),
FOREIGN KEY (Clientes_codigo) REFERENCES Clientes (codigo)
);

insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2018/05/06',200.00,'10:30','MELHOR',1,1);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2018/05/07',10.00,'11:00','RUIM',2,2);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2018/05/08',30.00,'12:40','RAZOAVEL',3,3);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2018/05/09',50.00,'13:20','BOA',4,4);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2018/05/10',100.00,'14:10','OTIMA',5,5);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2012/01/10',100.00,'14:10','OTIMA',5,5);
insert into VENDAS(idVendas,data,total,hora,observacao,Lojas_codigo,Clientes_codigo) VALUES(NULL,'2012/02/09',50.00,'13:20','BOA',4,4);


select * from VENDAS;

CREATE TABLE ITENS_VENDAS(

numero INT UNSIGNED AUTO_INCREMENT NOT NULL,
valor_unitario DOUBLE (9,2) NOT NULL,
quantidade INT NOT NULL,
Vendas_idVendas INT NOT NULL,
Produtos_id INT NOT NULL,
PRIMARY KEY (numero),
FOREIGN KEY (Vendas_idVendas) REFERENCES Vendas (idVendas),
FOREIGN KEY (Produtos_id) REFERENCES Produtos (id)
);

insert into ITENS_VENDAS(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) VALUES(NULL,10.00,20,1,1);
insert into ITENS_VENDAS(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) VALUES(NULL,5.00,10,2,2);
insert into ITENS_VENDAS(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) VALUES(NULL,15.00,30,3,3);
insert into ITENS_VENDAS(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) VALUES(NULL,25.00,50,4,4);
insert into ITENS_VENDAS(numero,valor_unitario,quantidade,Vendas_idVendas,Produtos_id) VALUES(NULL,20.00,40,5,5);

select * from ITENS_VENDAS;

/*QUESTÃO 10*/
delete from vendas where total > 100;

/*QUESTÃO 11*/
select * from lojas where tipo_loja = 'Supermercado';

/*QUESTÃO 13*/
select * from vendas where total between 50.00 and 250.00;

/*QUESTÃO 14*/
select * from clientes where estado = 'SP';

/*QUESTÃO 15*/
select count(*) from produtos where valor >= 200.00;

/*QUESTÃO 16*/
select * from produtos where quantidade < 20;

/*QUESTÃO 17*/
select avg(total) from vendas where data between '2012/01/01' and '2012/02/01';

select count(*) from EMPRESA where codigo=2;

select avg(TOTAL) from VENDAS where hora between '19:00' and '22:00';

select nome, endereco from CLIENTES where cidade = “BH” and cidade = "SP" order by nome;

select count(*) from itens_vendas where quantidade > 10;

select * from itens_vendas where quantidade between 2 and 5;

select avg(valor_unitario) from ITENS_VENDAS where  quantidade>3;

Select descricao, valor, quantidade from PRODUTOS where id between 15 and 30;

delete from PRODUTOS where total < 1;
