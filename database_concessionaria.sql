create database concessionaria;

use concessionaria;

create table carros
(
	id_carros int primary key,
    nome_carro varchar(100),
    descricao varchar(100),
    preco numeric,
    categoria varchar(50),
    quant_estoque integer
);

insert into carros(id_carros, nome_carro, descricao, preco, categoria, quant_estoque)values
(1, "HB20", "Cinza, 4 portas", 66.699, "Hatch", 50),
(2, "Santana", "Azul, 4 portas", 17.118, "Sedan", 15),
(3, "Creta", "Branco, 5 portas", 112.690, "SUV", 50);

create table clientes
(
	cliente_id int primary key,
    nome_cliente varchar(100),
    cpf bigint,
    endereco varchar(200),
    telefone bigint,
    email_cliente varchar(50)
);

insert into clientes (cliente_id, nome_cliente, cpf, endereco, telefone, email_cliente)values
(1, "Arthur Lopes", 12345678-90, "Vila Menk - Carapicuíba", 11959449434, "arthurlanches@gmail.com"),
(2, "Suzi Fernandes", 09876543-21, "Aldeia - Barueri", 11975353670, "suzidani08@gmail.com"),
(3, "Taylor Swift", 10293845-76, "Cornelia Street - EUA", 1972870187, "taylorswfit13@gmail.com");

create table compras
(
	id int primary key,
    cliente_id integer, 
    data_compra date,
    total numeric,
    
    foreign key (cliente_id) references clientes(cliente_id)
);



insert into compras (id, cliente_id, data_compra, total)values
(1, 1, "2023-08-08", 66.699),
(2, 3, "2015-12-14", 17.118),
(3, 2, "1989-10-13", 112.690);

create table carros_compra
(
	id int primary key,
    compra_id integer,
    carro_id integer,
    quantidade integer,
    subtotal numeric,
    
    foreign key (compra_id) references compras (id),
    foreign key (carro_id) references carros (id_carros)
);

insert into carros_compra (id, compra_id, carro_id, quantidade, subtotal)values
(1, 1, 1, 4, 266.796),
(2, 2, 3, 2, 34.236),
(3, 3, 2, 3, 338.070);

create table estoque
(
	id int primary key,
    carro_id integer,
    quant_estoque integer,
    
    foreign key (carro_id) references carros (id_carros)
);

insert into estoque (id, carro_id, quant_estoque)values
(1, 1, 50),
(2, 2, 15),
(3, 3, 50);

-- 1
select * from carros where quant_estoque > 0;

-- 2
select * from carros where id_carros=1; 

-- 3
select nome_cliente, cpf, email_cliente from clientes;

-- 4
select clientes.nome_cliente, compras.data_compra, compras.total from clientes inner join compras on clientes.cliente_id=compras.cliente_id where compras.id=1; 

-- 5
select nome_carro, quant_estoque from carros
where quant_estoque>0;

-- 6 
 select clientes.nome_cliente from 
 clientes inner join compras on clientes.cliente_id=compras.cliente_id 
 inner join carros_compra on compras.id=carros_compra.id 
 where carros_compra.carro_id=1;
 
  select clientes.nome_cliente, carros.nome_carro from 
 clientes inner join compras on clientes.cliente_id=compras.cliente_id 
 inner join carros_compra on compras.id=carros_compra.id 
 inner join carros on carros_compra.compra_id=carros.id_carros
 where carros_compra.carro_id=1;
 
 -- 7
 select compras.total, carros.nome_carro from
 carros inner join carros_compra on carros.id_carros=carros_compra.carro_id
 inner join compras on carros_compra.compra_id=compras.id
 inner join clientes on compras.cliente_id=clientes.cliente_id
 where clientes.cliente_id=2;
 
 
-- DESAFIO
-- 1
select clientes.nome_cliente, compras.total from 
clientes inner join compras on clientes.cliente_id=compras.cliente_id
order by compras.total desc;

-- 2
select max(clientes.nome_cliente) from 
clientes inner join compras on clientes.cliente_id=compras.cliente_id;

select clientes.nome_cliente from clientes
inner join compras on clientes.cliente_id=compras.cliente_id inner join carros_compra on compras.id=carros_compra.compra_id
order by carros_compra.subtotal desc
limit 1;