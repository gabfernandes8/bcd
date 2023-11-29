create schema db_locadora_gabriela;

use db_locadora_gabriela;

create table endereco
(
id integer primary key auto_increment,
logradouro varchar(200),
numero integer,
cidade varchar(100),
estado varchar(30),
complemento varchar(100)
);

create table locadora
(
id integer primary key auto_increment,
nome varchar(100),
cnpj bigint,
endereco_id integer,

foreign key (endereco_id) references endereco(id)
);

create table cliente
(
id integer primary key auto_increment,
nome
rg,
cpf,
cnh,
data_nascimento,
endereco_id

foreign key (endereco_id) references endereco(id)
);
