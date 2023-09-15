create database escola_sql_gabriela;

use escola_sql_gabriela;

create table alunos
(
	aluno_id int primary key,
	nome varchar(255),
    data_nascimento date,
    endereco varchar (255),
    telefone varchar (15)
);

INSERT INTO Alunos (aluno_id, nome, data_nascimento, endereco, telefone)
VALUES
 (1, 'João Silva', '1995-03-15', 'Rua A, 123', '(11) 1234-5678'),
 (2, 'Maria Santos', '1998-06-22', 'Av. B, 456', '(11) 9876-5432'),
 (3, 'Carlos Oliveira', '1997-01-10', 'Rua C, 789', '(11) 5678-1234'),
 (4, 'Ana Pereira', '1999-09-05', 'Av. D, 987', '(11) 4321-8765'),
 (5, 'Pedro Rodrigues', '1996-07-18', 'Rua E, 654', '(11) 3456-7890'),
 (6, 'Sara Costa', '2000-04-30', 'Av. F, 321', '(11) 8765-4321');

create table professores
(
	professor_id int primary key,
    nome varchar(255),
    data_contratacao date
);

INSERT INTO Professores (professor_id, nome, data_contratacao)
VALUES
 (1, 'Ana Lima', '2010-08-15'),
 (2, 'José Santos', '2005-04-20'),
 (3, 'Márcio Oliveira', '2012-11-10'),
 (4, 'Cláudia Pereira', '2014-03-25'),
 (5, 'Fernanda Rodrigues', '2018-09-08'),
 (6, 'Ricardo Costa', '2019-12-01');


create table disciplinas
(
	disciplina_id int primary key,
    nome_disciplina varchar(255),
    codigo_disciplina varchar (10),
    carga_horaria int
);

INSERT INTO Disciplinas (disciplina_id, nome_disciplina, codigo_disciplina, carga_horaria)
VALUES
 (1, 'Programação em C', 'PC101', 60),
 (2, 'Banco de Dados', 'BD201', 45),
 (3, 'Desenvolvimento Web', 'DW301', 75),
 (4, 'Algoritmos Avançados', 'AA401', 60),
 (5, 'Inteligência Artificial', 'IA501', 90),
 (6, 'Segurança da Informação', 'SI601', 45);

create table turmas
(
	turma_id int primary key,
    ano_escolar int,
    disciplina_id int,
    professor_id int,
    
    foreign key(disciplina_id) references disciplinas (disciplina_id),
    foreign key(professor_id) references professores (professor_id)
);

INSERT INTO Turmas (turma_id, ano_escolar, disciplina_id, professor_id)
VALUES
 (101, 2023, 1, 1),
 (102, 2023, 2, 2),
 (103, 2023, 3, 3),
 (104, 2023, 4, 4),
 (105, 2023, 5, 5),
 (106, 2023, 6, 6);

create table notas
(
	nota_id int primary key,
    aluno_id int,
    disciplina_id int,
    data_avaliacao date,
    nota float,
    
    foreign key(aluno_id) references alunos (aluno_id),
    foreign key(disciplina_id) references disciplinas (disciplina_id)
);

INSERT INTO Notas (nota_id, aluno_id, disciplina_id, data_avaliacao, nota)
VALUES
 (1, 1, 1, '2023-03-10', 85),
 (2, 2, 1, '2023-03-10', 78),
 (3, 3, 1, '2023-03-10', 92),
 (4, 4, 2, '2023-03-15', 88),
 (5, 5, 2, '2023-03-15', 95),
 (6, 6, 2, '2023-03-15', 75);


create table presenca
(
	presenca_id int primary key,
    aluno_id int,
    turma_id int,
    data_aula date,
    presenca varchar(8),
    
    foreign key(aluno_id) references alunos(aluno_id),
    foreign key(turma_id) references turmas(turma_id)
);

INSERT INTO Presenca (presenca_id, aluno_id, turma_id, data_aula, presenca)
VALUES
 (1, 1, 101, '2023-03-10', 'presente'),
 (2, 2, 101, '2023-03-10', 'presente'),
 (3, 3, 101, '2023-03-10', 'presente'),
 (4, 4, 102, '2023-03-15', 'ausente'),
 (5, 5, 102, '2023-03-15', 'presente'),
 (6, 6, 102, '2023-03-15', 'presente');
 
-- Qual é o nome do professor que ministra a disciplina com código "BD201"?
select professores.nome from professores 
inner join turmas on professores.professor_id=turmas.professor_id
inner join disciplinas on turmas.disciplina_id=disciplinas.disciplina_id
where codigo_disciplina="BD201";

-- Para a disciplina com código "PC101", obtenha a lista de alunos que obtiveram notas maiores que 80.
select alunos.nome from alunos 
inner join notas on alunos.aluno_id=notas.aluno_id
inner join disciplinas on notas.disciplina_id=disciplinas.disciplina_id
where codigo_disciplina="PC101" AND notas.nota > 80;

-- Quais alunos estiveram presentes na aula da turma com ID 101 na data '2023-03-10'?
select alunos.nome from alunos 
inner join presenca on alunos.aluno_id=presenca.aluno_id
inner join turmas on presenca.turma_id=turmas.turma_id
where turmas.turma_id=101 AND presenca.data_aula="2023-03-10";

-- Calcule a média das notas dos alunos na disciplina com código "IA501".
select avg(notas.nota) from notas 
inner join disciplinas on notas.disciplina_id=disciplinas.disciplina_id
where disciplinas.codigo_disciplina="IA501";

-- Liste todos os alunos e as disciplinas que eles estão matriculados. Inclua os alunos que não estão matriculados em nenhuma disciplina.
select alunos.nome, disciplinas.nome_disciplina from alunos
left join notas on alunos.aluno_id=notas.aluno_id
left join disciplinas on notas.disciplina_id=disciplinas.disciplina_id;

-- Liste todos os alunos que não têm notas registradas.
select alunos.nome from alunos
inner join notas on alunos.aluno_id=notas.aluno_id
where notas.nota is null;

-- Quais disciplinas têm menos de 40 horas de carga horária ou mais de 100 horas de carga horária?
select nome_disciplina from disciplinas 
where carga_horaria < 40 or carga_horaria > 100;

-- Encontre o nome dos professores que não estão ministrando a disciplina "IA501".
select professores.nome from professores
inner join turmas on professores.professor_id=turmas.professor_id
inner join disciplinas on turmas.disciplina_id=disciplinas.disciplina_id
where not disciplinas.codigo_disciplina = "IA501";

-- Quais turmas não têm professores atribuídos?
select turmas.ano_escolar from turmas
inner join professores on turmas.professor_id=professores.professor_id
where professores.professor_id is null;

-- Liste as disciplinas e seus códigos onde pelo menos um aluno obteve uma nota menor que 60.
select disciplinas.nome_disciplina, disciplinas.codigo_disciplina from disciplinas
left join notas on disciplinas.disciplina_id=notas.disciplina_id
left join alunos on notas.aluno_id=alunos.aluno_id
where notas.nota < 60;

-- Qual é a média das notas dos alunos na disciplina com código "DW301" entre '2023-03-01' e '2023-03-31'?

-- Liste todos os alunos que estão matriculados em mais de uma disciplina.

-- Quais são os anos escolares distintos das turmas onde pelo menos um aluno faltou?

-- Mostre o nome dos professores que estão ministrando a disciplina "PC101" ou "BD201".

-- Qual é o nome do aluno que faltou em todas as aulas?

-- Liste as disciplinas e seus códigos onde todos os alunos obtiveram uma nota maior ou igual a 70.

-- Quais alunos obtiveram notas entre 80 e 90 na disciplina "IA501" ou "DW301"?

-- Encontre o nome dos professores que não estão ministrando nenhuma disciplina com carga horária superior a 60 horas.

-- Quais são as datas de aulas para a disciplina com código "AA401" entre '2023-04-01' e '2023-04-30' onde pelo menos um aluno faltou?

-- Liste os nomes dos alunos que não faltaram em nenhuma aula.