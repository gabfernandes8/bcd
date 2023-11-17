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

insert into endereco (logradouro, numero, cidade, estado, complemento)values
("Rua Bonita", 165, "Barueri", "São Paulo", "apto 184 Luna"),
("Rua Cornelia", 13, "Nova York", "Manhattan", "louvamos travis kelce");

create table locadora
(
	id integer primary key auto_increment,
	nome varchar(100),
	cnpj bigint,
	endereco_id integer,

	foreign key (endereco_id) references endereco(id)
);

insert into locadora (nome, cnpj, endereco_id)values
("Locadora do Ryan", 040404040404, 2);

create table cliente
(
	id integer primary key auto_increment,
	nome varchar (100),
	rg varchar(10),
	cpf bigint,
	cnh bigint,
	data_nascimento date,
	endereco_id integer,
    locadora_id integer,

	foreign key (endereco_id) references endereco(id),
    foreign key (locadora_id) references locadora(id)
);

insert into cliente (nome, rg, cpf, cnh, data_nascimento, endereco_id, locadora_id)values
("Arthur Lopes", 2412241-2, 496449434, 24242424242424, "2004-12-24", 1, 1);

create table carro
(
	id integer primary key auto_increment,
    chassi varchar(50),
    placa varchar(10),
    marca varchar(20),
    modelo varchar(20),
    ano_fabricacao integer,
    cor varchar(10)
);

insert into carro (chassi, placa, marca, modelo, ano_fabricacao, cor)values
("Prata", "BCD-0808", "Audi", "Esportivo", 2022, "Bordô"),
("Preto", "FRU-4883", "Honda", "Sedan", 2010, "Preto");

create table locacao
(
	id integer primary key auto_increment,
    dataHora_aluguel datetime,
    dataHora_devolucao datetime,
    cliente_id integer,
    carro_id integer,
    
    foreign key (cliente_id) references cliente(id),
    foreign key (carro_id) references carro(id)
);

insert into locacao (dataHora_aluguel, dataHora_devolucao, cliente_id, carro_id)values
("2023-08-10 15:15:15", "2025-12-03 12:34:45", 1, 1);

create table categoria
(
	id integer primary key auto_increment,
    codigo varchar(5),
    nome varchar(10),
    preco_diaria double,
    descricao varchar(50),
    carro_id integer,
    
    foreign key (carro_id) references carro(id)
);

create table manutencao
(
	id integer primary key auto_increment,
    data_manutencao date,
    valor double,
    descricao varchar(50),
    nome_oficina varchar(50),
    carro_id integer,
    
    foreign key (carro_id) references carro (id)
);
