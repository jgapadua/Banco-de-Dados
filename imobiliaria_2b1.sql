DROP DATABASE imobiliaria_2b1;
CREATE database imobiliaria_2b1;
USE imobiliaria_2B1;

CREATE TABLE imobiliaria(
cnpj CHAR (17) NOT NULL,
nome VARCHAR (90) NOT NULL,
endereco VARCHAR (45) NOT NULL,
PRIMARY KEY (cnpj)
); 

insert into imobiliaria(cnpj,nome,endereco) VALUES(10000000000000000,'NetImovies','Rua Silva');
insert into imobiliaria(cnpj,nome,endereco) VALUES(20000000000000000,'LARImoveis','Rua Vila');

select nome,endereco from imobiliaria;
update imobiliaria set endereco = 'Rua Amazonas' where nome='NetImovies';

CREATE TABLE corretor(
creci INTEGER NOT NULL,
nome VARCHAR (80) NOT NULL,
dtadmissao DATE NOT NULL,
PRIMARY KEY (creci)
);

insert into corretor(creci,nome,dtadmissao) VALUES(NULL,'nome1',20018-05-20);
insert into corretor(creci,nome,dtadmissao) VALUES(NULL,'nome5',20018-10-30);
insert into corretor(creci,nome,dtadmissao) VALUES(NULL,'nome4',20017-12-20);

select count(*) from corretor;

CREATE TABLE comprador(
cpf CHAR (11) NOT NULL,
nome VARCHAR (80) NOT NULL,
profissao VARCHAR (60) NOT NULL,
listaimoveis VARCHAR (100) NOT NULL,
PRIMARY KEY (cpf)
);

insert into comprador(cpf,nome,estadocivil,conjugue) VALUES(11111111111,'nome1','profissao1','listaimoveis1');
insert into comprador(cpf,nome,estadocivil,conjugue) VALUES(22222222222,'nome2','profissao2','listaimoveis2');
insert into comprador(cpf,nome,estadocivil,conjugue) VALUES(33333333333,'nome3','profissao3','listaimoveis3');

select * from comprador;

CREATE TABLE proprietario(
cpf CHAR (11) NOT NULL,
nome VARCHAR (80) NOT NULL,
estadocivil CHAR (1) NOT NULL,
conjugue VARCHAR (80) NOT NULL,
PRIMARY KEY (cpf)
);

insert into proprietario(cpf,nome,estadocivil,conjugue) VALUES(01234567890,'nome1','S');
insert into proprietario(cpf,nome,estadocivil,conjugue) VALUES(09876543210,'nome2','C','conjugue1');
insert into proprietario(cpf,nome,estadocivil,conjugue) VALUES(12345678910,'nome3','C','conjugue2');

select count(*) from proprietario where estadocivil='S';


CREATE TABLE endereco(
codigo INTEGER NOT NULL,
numero INTEGER NOT NULL,
rua VARCHAR (80) NOT NULL,
bairro VARCHAR (60) NOT NULL,
cep CHAR (11) NOT NULL,
telefone CHAR (14) NOT NULL,
PRIMARY KEY (codigo)
);

insert into endereco(codigo,numero,rua,bairro,cep,telefone) VALUES(NULL,10,'Avenida 1','São Paulo',01234567890,'(031)3310-3310');
insert into endereco(codigo,numero,rua,bairro,cep,telefone) VALUES(NULL,12,'Rua 2','Paisagem',09876543210,'(031)3312-3312');
insert into endereco(codigo,numero,rua,bairro,cep,telefone) VALUES(NULL,14,'Avenida 2','São Paulo',12345678910,'(031)3311-3311');

select * from endereco where numero<200;
delete from endereco where numero=10 and 230;

CREATE TABLE imovel(
inscricao INTEGER NOT NULL,
area_total INTEGER NOT NULL,
area_construida INTEGER NOT NULL,
vr_venda DOUBLE (9,2) NOT NULL,
endereco_codigo INTEGER NOT NULL,
imobiliaria_cnpj CHAR (17) NOT NULL,
proprietario_cpf CHAR (11) NOT NULL,
PRIMARY KEY (inscricao),
FOREIGN KEY (endereco_codigo) REFERENCES endereco (codigo),
FOREIGN KEY (imobiliaria_cnpj) REFERENCES imobiliaria (cnpj),
FOREIGN KEY (proprietario_cpf) REFERENCES proprietario (cpf)
);

insert into imovel(inscricao,area_total,area_construida,vr_venda,endereco_codigo,imobiliaria_cnpj,proprietario_cpf) VALUES(NULL,NULL,NULL,600.00,NULL,10000000000000000,01234567890);
insert into imovel(inscricao,area_total,area_construida,vr_venda,endereco_codigo,imobiliaria_cnpj,proprietario_cpf) VALUES(NULL,NULL,NULL,960.00,NULL,20000000000000000,09876543210);
insert into imovel(inscricao,area_total,area_construida,vr_venda,endereco_codigo,imobiliaria_cnpj,proprietario_cpf) VALUES(NULL,NULL,NULL,850.00,NULL,20000000000000000,12345678910);

select * from imovel where vr_venda = 100000;

CREATE TABLE venda(
codigo INTEGER NOT NULL,
comissao INTEGER NOT NULL,
data DATE NOT NULL,
valor DOUBLE (9,2) NOT NULL,
imobiliaria_cnpj CHAR (17) NOT NULL,
imovel_inscricao INTEGER NOT NULL,
corretor_creci INTEGER NOT NULL,
comprador_cpf CHAR (11) NOT NULL,
PRIMARY KEY (codigo),
FOREIGN KEY (imobiliaria_cnpj) REFERENCES imobiliaria (cnpj),
FOREIGN KEY (imovel_inscricao) REFERENCES imovel (inscricao),
FOREIGN KEY (corretor_creci) REFERENCES corretor (creci),
FOREIGN KEY (comprador_cpf) REFERENCES comprador (cpf)
);

insert into venda(codigo,comissao,data,valor,imobiliaria_cnpj,imovel_inscricao,corretor_creci,comprador_cpf) VALUES(NULL,NULL,2018-12-25,600.00,20000000000000000,NULL,NULL,11111111111);
insert into venda(codigo,comissao,data,valor,imobiliaria_cnpj,imovel_inscricao,corretor_creci,comprador_cpf) VALUES(NULL,NULL,2018-10-30,800.00,20000000000000000,NULL,NULL,33333333333);
insert into venda(codigo,comissao,data,valor,imobiliaria_cnpj,imovel_inscricao,corretor_creci,comprador_cpf) VALUES(NULL,NULL,2018-06-14,1000.00,10000000000000000,NULL,NULL,22222222222);

select avg(valor) from venda where data=2013-03 and 2013-04;
select sum(valor) from venda where codigo>30;
select max(valor) from venda;
select min(valor) from venda;

delete from venda where codigo>10;

