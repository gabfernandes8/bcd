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
    nome varchar(50)
);

create table categoria_subcategoria
(
	id integer primary key auto_increment,
    id_categoria integer,
    id_subcategoria integer,
    
    foreign key (id_categoria) references categoria(id),
    foreign key (id_subcategoria) references sub_categoria(id)
);

create table produto
(
	id integer primary key auto_increment,
    nome varchar(50),
    preco double,
    descricao varchar(100),
    avaliacao double,
    qt_disponivel integer,
    id_favorito integer,

    foreign key (id_favorito) references produto(id)
);

create table subcategoria_produto
(
	id integer primary key auto_increment,
    id_sub_categoria integer,
    id_produto integer,
    
    foreign key (id_sub_categoria) references categoria_subcategoria(id),
    foreign key (id_produto) references produto(id)
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
    foto_perfil varchar(100)
);

create table usuario_endereco
(
	id integer primary key auto_increment,
    id_usuario integer,
    id_endereco integer,
    
    foreign key (id_usuario) references usuario(id),
    foreign key (id_endereco) references endereco(id)
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
    tipo varchar(50),
    banco varchar(50),
    n_conta bigint,
    n_cartao bigint,
    validade date
);

create table pedido
(
	id integer primary key auto_increment,
    data_pedido date,
    frete double,
    total double,
    qt_itens integer,
    id_produto integer,
    id_usuario integer,
    id_endereco integer,
    id_pagamento integer,
     
    foreign key (id_usuario) references usuario(id),
    foreign key (id_produto) references produto(id),
    foreign key (id_endereco) references endereco(id),
    foreign key (id_pagamento) references pagamento(id)
);

create table pedido_produto
(
	id integer primary key auto_increment,
    id_produto integer,
    id_pedido integer,
    
    foreign key (id_produto) references produto(id),
    foreign key (id_pedido) references pedido(id)
    );

create table img_produto
(
	id integer primary key auto_increment,
    url varchar(260),
    id_produto integer,
    
    foreign key (id_produto) references produto(id)
);