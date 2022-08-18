create database BD_LINGUICA;
use BD_LINGUICA;

CREATE TABLE empresa(
codigo int UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (60) NOT NULL,
endereco VARCHAR (45) NOT NULL,
cidade VARCHAR (45) NOT NULL,
telefone CHAR (15) NOT NULL,
email VARCHAR (60) NOT NULL,
site VARCHAR (60) not null,
login varchar (15) not null,
senha char (6) not null,
PRIMARY KEY (codigo)
);

CREATE TABLE clientes(
codigo int UNSIGNED AUTO_INCREMENT NOT NULL,
nome VARCHAR (60) NOT NULL,
endereco VARCHAR (45) NOT NULL,
cidade VARCHAR (45) NOT NULL,
estado char (2),
telefone CHAR (15) NOT NULL,
email varchar (60) not null,
login varchar (15) not null,
senha char (6) not null,
PRIMARY KEY (codigo)
);

create table produtos(
codigo int unsigned auto_increment not null,
 tipo  varchar (10),
 preco  double (9,2) not null,
 quantidade integer not null,
 data_fabricacao date not null,
 data_validade date not null,
 empresa_codigo int not null,
 primary key (codigo),
 foreign key (empresa_codigo) references empresa (codigo)
); 

create table vendas(
id int unsigned auto_increment not null,
descricao varchar (60) not null,
 data_vendas date not null,
 total double (9,2) not null,
 onservacao varchar (80) not null,
clientes_codigo int not null,
primary key (id),
foreign key (clientes_codigo) references clientes (codigo)
); 

create table itens_vendas(
id int unsigned auto_increment not null,
valor_unitario double not null,
 data_vendas date not null,
 total double (9,2) not null,
vendas_id int not null,
produtos_codigo int not null,
primary key (id),
foreign key (vendas_id) references vendas (id),
foreign key (produtos_codigo) references produtos (codigo)
); 

