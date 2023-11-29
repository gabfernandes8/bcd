create database db_tonypizzaria_gabriela;

use db_tonypizzaria_gabriela;

create table categoria
(
	id integer primary key auto_increment,
    nome varchar(50)
);

create table sub_categoria
(
	id integer primary key auto_increment,
    nome varchar(50),
    categoria_id integer,
    
    foreign key (categoria_id) references categoria(id)
);

create table produto
(
	id integer primary key auto_increment,
    nome varchar(50),
    preco double,
    descricao varchar(100),
    avaliacao double,
    qt_disponivel integer,
    sub_categoria_id integer,
    favorito_id integer,
    
    foreign key (sub_categoria_id) references sub_categoria(id),
    foreign key (favorito_id) references produto(id)
);

create table endereco
(
	id integer primary key auto_increment,
    logradouro varchar(150),
    cidade varchar(100),
    uf varchar(2),
    cep bigint
);

create table usuario
(
	id integer primary key auto_increment,
    nome varchar(100),
    telefone bigint,
    endereco_id integer,
    email varchar(70),
    senha varchar(20),
    foto_perfil varchar(100),
    
    foreign key (endereco_id) references endereco(id)
);


create table comentario
(
	id integer primary key auto_increment,
    id_usuario integer,
	id_produto integer,
    estrelas double,
    titulo varchar(50),
    data_comentario date,
    comentario varchar(250),
    
    foreign key (id_usuario) references usuario(id),
    foreign key (id_produto) references produto(id)
);

create table pagamento
(
	id integer primary key auto_increment,
    tipo varchar(50)
);

create table pedido
(
	id integer primary key auto_increment,
    data_pedido date,
    id_produto integer,
    id_usuario integer,
    id_endereco integer,
    id_pagamento integer,
    frete double,
    total double,
    subtotal double,
    qt_itens integer,
    
    foreign key (id_usuario) references usuario(id),
    foreign key (id_produto) references produto(id),
    foreign key (id_endereco) references endereco(id),
    foreign key (id_pagamento) references pagamento(id)
);

