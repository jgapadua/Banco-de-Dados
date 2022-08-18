create database Biblioteca_2b1;
use Biblioteca_2b1;

create table cursos(
codigo INT not null auto_increment,
descricao VARCHAR (60) not null,
usuarios_numero INT not null,
PRIMARY KEY (codigo),
FOREIGN KEY (usuarios_numero) REFERENCES usuarios (numero)
);

create table usuarios(
numero INT not null auto_increment,
nome VARCHAR (45) not null,
data DATE not null,
perfil_codigo INT not null,
PRIMARY KEY (numero),
FOREIGN KEY (perfil_codigo) REFERENCES perfil (codigo)
);

create table perfil(
codigo INT not null auto_increment,
nome VARCHAR (45) not null,
PRIMARY KEY (codigo)
);

insert into perfil(codigo,nome) VALUES (NULL,'João');
insert into perfil(codigo,nome) VALUES (NULL,'José');
insert into perfil(codigo,nome) VALUES (NULL,'Julio');


create table emprestimo(
numero INT not null auto_increment,
valor DOUBLE (9,2),
data DATE not null,
devolucao DATE not null,
usuarios_numero INT not null,
obras_id INT not null,
PRIMARY KEY (numero),
FOREIGN KEY (usuarios_numero) REFERENCES usuarios (numero),
FOREIGN KEY (obras_id) REFERENCES obras (id)
);


create table editora(
cnpj INT not null auto_increment,
nome VARCHAR (50) not null,
PRIMARY KEY (cnpj)
);

insert into editora(cnpj,nome) VALUES (NULL,'ATICA');
insert into editora(cnpj,nome) VALUES (NULL,'NOVO MUNDO');
insert into editora(cnpj,nome) VALUES (NULL,'VIDA');


create table autor(
codigo INT not null auto_increment,
nome VARCHAR (50) not null,
PRIMARY KEY (codigo)
);

insert into autor(codigo,nome) VALUES (NULL,'Fernando Sabino');
insert into autor(codigo,nome) VALUES (NULL,'Willian Shakespeare');
insert into autor(codigo,nome) VALUES (NULL,'Walcyr Carrasco');


create table classificacao(
codigo INT not null auto_increment,
nome VARCHAR (45) not null,
PRIMARY KEY (codigo)
);

insert into classificacao(codigo,nome) VALUES (NULL,'INFANTIL');
insert into classificacao(codigo,nome) VALUES (NULL,'ADULTO');
insert into classificacao(codigo,nome) VALUES (NULL,'BIOGRAFIA');


create table midia(
codigo INT not null auto_increment,
nome VARCHAR (45) not null,
PRIMARY KEY (codigo)
);

insert into midia(codigo,nome) VALUES (NULL,'SEM');
insert into midia(codigo,nome) VALUES (NULL,'MODERADA');
insert into midia(codigo,nome)  VALUES (NULL,'MUITA');


create table lingua(
codigo INT not null auto_increment,
nome VARCHAR (45) not null,
PRIMARY KEY (codigo)
);

insert into lingua(codigo,nome) VALUES (NULL,'PORTUGUES');
insert into lingua(codigo,nome) VALUES (NULL,'LATIM');
insert into lingua(codigo,nome)  VALUES (NULL,'INGLES');


create table obras(
id INT not null auto_increment,
paginas INT not null,
nome VARCHAR (50) not null,
classificacao_codigo INT not null,
autor_codigo INT not null,
lingua_codigo INT not null,
midia_codigo INT not null,
editora_cnpj INT not null,
PRIMARY KEY (id),
FOREIGN KEY (classificacao_codigo) REFERENCES classificacao (codigo),
FOREIGN KEY (autor_codigo) REFERENCES autor (codigo),
FOREIGN KEY (lingua_codigo) REFERENCES lingua (codigo),
FOREIGN KEY (midia_codigo) REFERENCES midia (codigo),
FOREIGN KEY (editora_cnpj) REFERENCES editora (cnpj)
);

insert into obras(id,paginas,nome,classificacao_codigo,autor_codigo,lingua_codigo,midia_codigo,editora_cnpj) VALUES (NULL,180,'Uma vez',1,1,1,1,1);
insert into obras(id,paginas,nome,classificacao_codigo,autor_codigo,lingua_codigo,midia_codigo,editora_cnpj) VALUES (NULL,250,'Vida',2,2,2,2,2);
insert into obras(id,paginas,nome,classificacao_codigo,autor_codigo,lingua_codigo,midia_codigo,editora_cnpj) VALUES (NULL,100,'Pequeno Polegar',3,3,3,3,3);

delete from obras where paginas > 100;