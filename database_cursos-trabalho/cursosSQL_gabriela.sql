create database cursosSQL_gabriela;

use cursosSQL_gabriela;

create table cursos
(
    id integer primary key auto_increment not null,
    nome_curso varchar(100) not null,
    carga_horaria integer not null,
    categoria varchar(100) not null
);

insert into cursos (nome_curso, carga_horaria, categoria) values
("Desenvolvimento de Sistemas", 1200, "Técnico"),
("Eletroeletrônica", 1200, "Técnico"),
("Curso de Excel", 60, "FIC");

create table disciplinas
(
	id integer primary key auto_increment not null,
    nome_disciplina varchar(100),
    codigo_disciplina varchar(10),
    curso_id integer,
    
    foreign key (curso_id) references cursos (id)
);

insert into disciplinas (nome_disciplina, codigo_disciplina, curso_id)values
( "Banco de Dados", "BCD", 1),
( "Programação Web BackEnd", "PWFE", 1),
( "Desenho Técnico", "DT", 2);

create table alunos
(
    id integer primary key auto_increment not null,
    nome varchar(100) not null,
    cpf bigint not null,
    tel bigint,
    data_nascimento date not null,
    endereco varchar(100) not null
);

insert into alunos (nome, cpf, tel, data_nascimento, endereco) values
("Gabriela Fernandes", 53186706874, 11972870187, '2006-08-08', "Rua Luiz Scott"),
("Ryan Alves", 51766995837, 11986351543, '2006-08-04', "Rua Bonita"),
("Taylor Swift", 13131313131, 11913131313, '1989-12-13', "Cornelia Street");

create table professores
(
	id integer primary key auto_increment not null,
	nome varchar(100) not null,
    cpf bigint not null,
    tel bigint,
    data_nascimento date not null,
    data_contratacao date,
    endereco varchar(100) not null
);

insert into professores (nome, cpf, tel, data_nascimento, data_contratacao, endereco)values
("Bruno Gomes", 99999999999, 11999999999, '1996-05-01', '2023-01-09', "Rua Nove"),
("Fernando Leonid", 10101010101, 11910101010, '1976-08-30', '1999-11-13', "Rua São Script"),
("Vitor de Jesus", 11111111111, 11911111111, '1996-03-25', '2023-01-09', "Rua Java");

create table matriculas
(
	id integer primary key not null,
    data_matricula date,
    aluno_id integer,
    curso_id integer,
    
    foreign key (aluno_id) references alunos (id),
    foreign key (curso_id) references cursos (id)
);

insert into matriculas values
(23111765, '2023-01-13', 2, 1),
(23111725, '2023-01-13', 1, 1),
(23111713, '2023-01-13', 3, 2);

create table turmas
(
	id integer primary key auto_increment not null,
    ano_escolar integer,
    disciplina_id integer,
    professor_id integer,
    
    foreign key (disciplina_id) references disciplinas(id),
    foreign key (professor_id) references professores(id)
);

insert into turmas (ano_escolar, disciplina_id, professor_id)values
(2023, 1, 1),
(2023, 2, 3),
(2023, 3, 2);

create table notas
(
	id integer primary key auto_increment not null,
    nota float,
    aluno_id integer,
    disciplina_id integer,
    data_avaliacao date,
    
    foreign key (disciplina_id) references disciplinas (id),
    foreign key (aluno_id) references alunos (id)
);

insert into notas (nota, aluno_id, disciplina_id, data_avaliacao)values
(100, 1, 1, '2023-10-06'),
(100, 2, 1, '2023-10-06'),
(13.13, 3, 2, '2023-10-06');

create table presencas
(
	id integer primary key auto_increment not null,
    data_aula date not null,
    presenca varchar(50) not null,
    disciplina_id integer,
    aluno_id integer,
    
    foreign key (disciplina_id) references disciplinas (id),
    foreign key (aluno_id) references alunos (id)
);

insert into presencas (data_aula, presenca, disciplina_id, aluno_id)values
("2023-10-06", "PRESENTE", 1, 1),
("2023-10-06", "PRESENTE", 2, 2),
("2023-10-06", "AUSENTE", 3, 2);

create table eventos_academicos
(
	id integer primary key auto_increment not null,
    data_evento datetime,
    tema varchar(50),
    turma_id integer,
    
    foreign key (turma_id) references turmas(id)
);

insert into eventos_academicos (data_evento, tema, turma_id)values
("2024-12-13 18:00:00", "Formatura 3º ano SESI CARAPICUÍBA", 2),
("2024-12-20 19:00:00", "Formatura Eletroeletrônica", 3),
("2024-12-20 19:00:00", "Formatura Desenvolvimento de Sistemas", 1);

create table atividades_pesquisa
(
	id integer primary key auto_increment not null,
    tema varchar(50),
    turma_id integer,
    
    foreign key (turma_id) references turmas(id)
);

insert into atividades_pesquisa (tema, turma_id)values
("DER", 1),
("Array e JSON", 2),
("AUTOCAD", 3);

create table parcerias
(
	id integer primary key auto_increment not null,
	nome_empresa varchar(100),
    tipo_parceria varchar(100)
);

insert into parcerias (nome_empresa, tipo_parceria)values
("Antilhas", "Estágio"),
("Puzzle Language School", "Projetos"),
("Google", "Estágio");

select * from disciplinas;

drop table cursos;