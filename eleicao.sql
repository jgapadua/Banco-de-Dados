create database Eleicao;
use Eleicao;

create table cargos(
codigo int not null auto_increment,
nome varchar (45) not null,
tipo varchar (30) not null,
primary key (codigo)
);

insert into cargos(codigo,nome,tipo) values (null,'cargonome1','cargotipo1');
insert into cargos(codigo,nome,tipo) values (null,'cargonome2','cargotipo2');
insert into cargos(codigo,nome,tipo) values (null,'cargonome3','cargotipo3');

create table partido(
codigo int not null auto_increment,
nome varchar (45) not null,
sigla char (7),
presidente varchar (45) not null,
uf char (2),
primary key (codigo)
);

insert into partido(codigo,nome,sigla,presidente,uf) values (null,'partidonome1','partdo1','partidopresidente1','MG');
insert into partido(codigo,nome,sigla,presidente,uf) values (null,'partidonome2','partdo2','partidopresidente2','MG');
insert into partido(codigo,nome,sigla,presidente,uf) values (null,'partidonome3','partdo3','partidopresidente3','MG');

delete from partido where uf = 'PR';

create table urna(
numero int not null auto_increment,
municipio varchar (45) not null,
zona integer not null,
secao integer not null,
primary key (numero)
);

insert into urna(numero,municipio,zona,secao) values (null,'Belo Horizonte',1,1);
insert into urna(numero,municipio,zona,secao) values (null,'Belo Horizonte',2,2);
insert into urna(numero,municipio,zona,secao) values (null,'Belo Horizonte',3,3);

delete from urna where secao between 20 and 30;

create table eleitor(
codigo int not null auto_increment,
nome varchar(45) not null,
endereco varchar (45) not null,
cpf char (14) not null,
rg char (15) not null,
titulo char (15) not null,
zona integer not null,
secao integer not null,
primary key (codigo)
);

insert into eleitor(codigo,nome,endereco,cpf,rg,titulo,zona,secao) values (null,'eleitornome1','Rua Y',00000000000000,000000000000000,1,1);
insert into eleitor(codigo,nome,endereco,cpf,rg,titulo,zona,secao) values (null,'eleitornome2','Rua Z',11111111111111,111111111111111,2,2);
insert into eleitor(codigo,nome,endereco,cpf,rg,titulo,zona,secao) values (null,'eleitornome3','Rua X',22222222222222,222222222222222,3,3);

delete from eleitor where codigo > 20;
delete from eleitor where endereco = 'Rua X';


create table candidato(
num int not null auto_increment,
nome varchar(45) not null,
endereco varchar (45) not null,
cidade varchar (45) not null,
uf char (2) not null,
foto varchar (50) not null,
idade integer not null,
partido_codigo int not null,
cargo_codigo int not null,
primary key (num),
foreign key (partido_codigo) REFERENCES partido (codigo),
foreign key (cargo_codigo) REFERENCES cargo (codigo)
);

insert into candidato(num,nome,endereco,cidade,uf,foto,idade,partido_codigo,cargo_codigo) values (null,'candidatonome1','candidatoendereco1','Belo Horizonte','MG','candidatofoto1',40,1,1);
insert into candidato(num,nome,endereco,cidade,uf,foto,idade,partido_codigo,cargo_codigo) values (null,'candidatonome2','candidatoendereco2','Belo Horizonte','MG','candidatofoto2',50,2,2);
insert into candidato(num,nome,endereco,cidade,uf,foto,idade,partido_codigo,cargo_codigo) values (null,'candidatonome3','candidatoendereco3','Belo Horizonte','MG','candidatofoto3',45,3,3);

create table eleicao(
codigo int not null auto_increment,
descricao varchar(45) not null,
data date not null,
turno integer not null,
horario time not null,
urna_numero int not null,
primary key (codigo),
foreign key (urna_numero) REFERENCES urna (numero)
);

insert into eleicao(codigo,descricao,data,turno,horario,urna_numero) values (null,'eleicaodescricao1','2018-10-20',1,'12:50:32',1);
insert into eleicao(codigo,descricao,data,turno,horario,urna_numero) values (null,'eleicaodescricao2','2018-10-20',1,'14:50:32',2);
insert into eleicao(codigo,descricao,data,turno,horario,urna_numero) values (null,'eleicaodescricao3','2018-10-22',1,'09:20:32',3);

create table voto(
codigo int not null auto_increment,
quantidade integer not null,
eleicao_codigo int not null,
cargo_codigo int not null,
eleitor_codigo int not null,
primary key (codigo),
foreign key (eleicao_codigo) REFERENCES eleicao (codigo),
foreign key (cargo_codigo) REFERENCES cargo (codigo),
foreign key (eleitor_codigo) REFERENCES eleitor (codigo)
);

insert into voto(codigo,quantidade,eleicao_codigo,cargo_codigo,eleitor_codigo) values (null,1,1,1,1);
insert into voto(codigo,quantidade,eleicao_codigo,cargo_codigo,eleitor_codigo) values (null,2,2,2,2);
insert into voto(codigo,quantidade,eleicao_codigo,cargo_codigo,eleitor_codigo) values (null,3,3,3,3);