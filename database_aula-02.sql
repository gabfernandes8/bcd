create database senai_04;

use senai_04;

create table produtos
(
	id_produtos int primary key,
    nome varchar(100),
    preco numeric
);

insert into produtos(id_produtos, nome, preco)values
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
    id_produtos int,
    quantidade int,
    
    -- criando referência para chave estrageira  
    foreign key(id_produtos) references produtos (id_produtos)
);

insert into pedidos(id_pedidos, id_produtos, quantidade)values
(1, 1, 280),
(2, 2, 400),
(3, 3, 80),
(4, 4, 71),
(5, 5, 15),
(6, 6, 28),
(7, 7, 33),
(8, 8, 39),
(9, 9, 47),
(10, 10, 29);

select * from produtos;

select * from pedidos;

-- criando relacionamento e conectando as tabelas
select nome from produtos inner join pedidos on
produtos.id_produtos=pedidos.id_produtos where id_pedidos=4;

-- desafio // apelidando
select p.id_produtos, quantidade, preco from produtos as p inner join pedidos as d on
p.id_produtos=d.id_produtos where nome="iPhone X";
