-- criando banco de dados
create database senai_carapicuiba;

-- colocando o banco de dados em uso
use senai_carapicuiba;

-- criando tabela 
create table turmas
(
	id int primary key not null auto_increment,
    nome varchar (50) not null,
    codigo int not null,
    descricao varchar (100) not null,
    sala varchar (10) not null
);

-- Inserindo dados na tabela 
insert into turmas (nome, codigo, descricao, sala) values
("Desenvolvimento de Sistemas", 12345, "É um ótimo curso", "B10"),
("Excel", 12121, "Já foi um bom curso", "B01"),
("Power BI", 23561, "Parece ser um curso bom", "B03"),
("Banco de Dados", 55555, "Esse é tooooooop", "B11"),
("Logística", 33331, "Aaffffffffffff", "B04");

-- Selecionando todos os dados da tabela
select * from turmas;

-- selecionando objeto específico
select nome from turmas where id<3;

-- mudando nome do curso de id 4
update turmas set nome="Informática Básica" where id=4;

-- mudando código dos cursos específicos
update turmas set codigo=33333 where id=3;
update turmas set codigo=12120 where id=2;

-- adicionando coluna na tabela 
alter table turmas add data_inicio varchar(10) not null;

