create database senai_04;

use senai_04;

create table produtos
(
	id_produtos int primary key,
    nome varchar(100),
    preco numeric
);

insert into produtos(id_produtos, nome, preco)vales
(1, "iPhone 14", 5000),
(2, "iPhone 13", 4500),
(3, "iPhone 12", 4000),
(4, "iPhone 11", 2500),
(5, "iPhone X", 2100),
(6, "Galaxy S20", 3000),
(7, "LG K10", 800),
(8, "Xiaomi poco", 2800),
(9, "Nokia Tijolão", 300),
(10, "Motorola v30", 6712);

create table pedidos 
(
	id_pedidos int primary key,
    id_produto int,
    quantidade
);

select * from produtos;