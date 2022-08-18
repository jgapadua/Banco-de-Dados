
CREATE database hotelaria_2b1;
USE hotelaria_2B1;

CREATE TABLE cliente(
cod INTEGER NOT NULL,
nome VARCHAR (80) NOT NULL,
cpf INT NOT NULL,
tipo_convenio VARCHAR (40) NOT NULL,
PRIMARY KEY (cod)
); 

insert into cliente(cod,nome,cpf,tipo_convenio) VALUES(NULL,'Jose Silva',12345678,'cliente VIP');
insert into cliente(cod,nome,cpf,tipo_convenio) VALUES(NULL,'Joao Silva',87654321,'cliente +');
insert into cliente(cod,nome,cpf,tipo_convenio) VALUES(NULL,'Matheus Silva',01234567,'cliente padrao');


CREATE TABLE reserva(
cod INTEGER NOT NULL,
datainicio DATE NOT NULL,
datafim DATE NOT NULL,
quarto INT NOT NULL,
valor DOUBLE (9,2),
cliente_cod INTEGER NOT NULL,
PRIMARY KEY (cod),
FOREIGN KEY (cliente_cod) REFERENCES cliente (cod)
);

insert into reserva(cod,datainicio,datafim,quarto,valor,cliente_cod) VALUES(NULL,'2018-02-20','2018-02-28',10,150.00,1);
insert into reserva(cod,datainicio,datafim,quarto,valor,cliente_cod) VALUES(NULL,'2018-04-10','2018-04-16',5,250.00,2);
insert into reserva(cod,datainicio,datafim,quarto,valor,cliente_cod) VALUES(NULL,'2018-04-10','2018-04-16',10,400.00,3);


CREATE TABLE hospede(
cod INTEGER NOT NULL,
nome VARCHAR (80) NOT NULL,
reserva_cod INTEGER NOT NULL,
telefone CHAR (15),
email VARCHAR (60),
PRIMARY KEY (cod),
FOREIGN KEY (reserva_cod) REFERENCES reserva (cod)
);

insert into hospede(cod,nome,reserva_cod,telefone,email) VALUES(NULL,'Jose Silva',1,'(031)3311-3311','josesilva@email.com');
insert into hospede(cod,nome,reserva_cod,telefone,email) VALUES(NULL,'Joao Silva',2,'(031)3311-3322','joaosilva@email.com');
insert into hospede(cod,nome,reserva_cod,telefone,email) VALUES(NULL,'Matheus Silva',3,'(031)3311-3333','matheussilva@email.com');


CREATE TABLE quarto(
cod INTEGER NOT NULL,
numero INT NOT NULL,
andar INT NOT NULL,
classificacao VARCHAR (40) NOT NULL,
hospede_cod INTEGER NOT NULL,
PRIMARY KEY (cod),
FOREIGN KEY (hospede_cod) REFERENCES hospede (cod)
);

insert into quarto(cod,numero,andar,classificacao,hospede_cod) VALUES(NULL,10,2,'10',1);
insert into quarto(cod,numero,andar,classificacao,hospede_cod) VALUES(NULL,5,1,'7',2);


CREATE TABLE servico_copa(
cod INTEGER NOT NULL,
registro VARCHAR (100) NOT NULL,
tipo_servico VARCHAR (40) NOT NULL,
PRIMARY KEY (cod)
);

insert into servico_copa(cod,registro,tipo_servico) VALUES(NULL,'01234567890','1');
insert into servico_copa(cod,registro,tipo_servico) VALUES(NULL,'09876543210','2');


CREATE TABLE servicos(
cod INTEGER NOT NULL,
itens VARCHAR (50) NOT NULL,
tipo VARCHAR (50) NOT NULL,
observacao VARCHAR (100) NOT NULL,
quarto_cod INTEGER NOT NULL,
servico_copa_cod INTEGER NOT NULL,
PRIMARY KEY (cod),
FOREIGN KEY (quarto_cod) REFERENCES quarto (cod),
FOREIGN KEY (servico_copa_cod) REFERENCES servico_copa (cod)
);

insert into servicos(cod,itens,tipo,observacao,quarto_cod,servico_copa_cod) VALUES(NULL,'100','VIP','INCRIVEL',1,1);
insert into servicos(cod,itens,tipo,observacao,quarto_cod,servico_copa_cod) VALUES(NULL,'50','+','MELHOR',2,2);
insert into servicos(cod,itens,tipo,observacao,quarto_cod,servico_copa_cod) VALUES(NULL,'20','PADRAO','COMUM',1,2);
insert into servicos(cod,itens,tipo,observacao,quarto_cod,servico_copa_cod) VALUES(NULL,'100','VIP','INCRIVEL',1,1);
