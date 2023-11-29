create database db_hospital_gabriela;

use db_hospital_gabriela;

create table endereco
(
	id integer primary key auto_increment,
    rua varchar(100),
    cep bigint,
    cidade varchar(50),
    estado varchar(70)
);

insert into endereco (rua, cep, cidade, estado)values
("Rua Luiz Scott", 06440-260, "Barueri", "São Paulo");

create table hospital
(
	id integer primary key auto_increment,
    nome varchar(100),
    cnpj bigint,
    endereco_id integer,
    
    foreign key (endereco_id) references endereco (id)
);

insert into hospital (nome, cnpj)values
("São Luis Morumbi", 123456789012);

create table alas
(
	id integer primary key auto_increment,
    nome varchar(50),
    corredor integer,
    hospital_id integer,
    
    foreign key (hospital_id) references hospital (id)
);

insert into alas (nome, corredor)values
("UTI", 8);

create table enfermeiros
(
	id integer primary key auto_increment,
    nome varchar(50),
    chefe_id integer,
    cre bigint,
    ala_id integer,
    
    foreign key (ala_id) references alas (id),
    foreign key (chefe_id) references enfermeiros(id)
);

insert into enfermeiros (nome, chefe_id, cre, ala_id)values
("Gabriela Fernandes", 3, 457323, 1);

select chefe.nome as enfermeiro_chefe, enfermeiros.nome as enfermeiro from enfermeiros 
inner join enfermeiros as chefe on enfermeiros.chefe_id=chefe.id
where  chefe.nome like "Arthur%";

create table plano_saude
(
	id integer primary key auto_increment,
    nome varchar(50),
    telefone bigint,
    numero bigint,
    hospital_id integer,
    
    foreign key (hospital_id) references hospital(id)
);

insert into plano_saude(nome, telefone, numero, hospital_id)values
("Bradesco", 11959449434, 1234, 1);

create table medicos
(
	id integer primary key auto_increment,
    nome varchar(100),
    especialidade varchar(50),
    crm bigint,
    plano_id integer,

	foreign key (plano_id) references plano_saude(id)
);

insert into medicos (nome, especialidade, crm, plano_id)values
("Ryan Alves", "Cirurgia Plástica", 729997, 1);

create table atendimento
(
	id integer primary key auto_increment,
    dataHora dateTime,
    medico_id integer,
    paciente_id integer,
    
    foreign key (medico_id) references medicos (id),
    foreign key (paciente_id) references pacientes (id)
);

insert into atendimento (dataHora, medico_id, paciente_id)values

create table pacientes
(
	id integer primary key auto_increment,
    nome varchar(100),
    cpf bigint,
    telefone bigint,
    sexo varchar(10)
);