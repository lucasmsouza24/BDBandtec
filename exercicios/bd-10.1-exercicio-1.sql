-- criando banco
CREATE DATABASE bd10exercicio1;
USE bd10exercicio1;

-- criação de tabelas

-- tabela grupo
CREATE TABLE grupo(
	pk_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    desc_projeto VARCHAR(100) NOT NULL
);
-- DESC grupo;

-- tabela professor
CREATE TABLE professor(
	pk_prof INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    disciplina VARCHAR(45) NOT NULL
) AUTO_INCREMENT =  10000;
-- DESC PROFESSOR;

-- tabela aluno 
CREATE TABLE aluno(
	pk_ra INT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    fk_grupo INT,
    FOREIGN KEY(fk_grupo) REFERENCES grupo(pk_grupo)
);

-- tabela avaliacao
CREATE TABLE avaliacao(
	pk_avaliacao INT PRIMARY KEY AUTO_INCREMENT,
    fk_grupo INT NOT NULL,                                  -- grupo avaliado
    fk_prof INT NOT NULL,                                   -- professor responsável pela avaliação
    nota DECIMAL(3,1) CHECK(nota >= 0 AND nota <= 10),
    av_data DATE NOT NULL,
    av_hora TIME NOT NULL,
    FOREIGN KEY(fk_grupo) REFERENCES grupo(pk_grupo),
    FOREIGN KEY(fk_prof) REFERENCES professor(pk_prof)
);

-- inserts

-- insert table professor
INSERT INTO professor(nome, disciplina) VALUES
('Célia', 'Bando de Dados'),
('Caio', 'Algoritmo'),
('Frizza', 'Tecnologia da Informação'),
('Marise', 'Arquitetura Computacional');

-- SELECT * FROM professor;

-- insert table grupo
INSERT INTO grupo(nome, desc_projeto) VALUES
('InnerTec', 'Monitoramento de temperatura e umidade no plantio de hortaliças.'),
('VegCare', 'Monitoramento de temperatura e umidade no plantio de batatas.'),
('StrongBerry', 'Monitoramente de temperatura e umidade no plantio de morangos.');

-- SELECT * FROM grupo;

-- insert table aluno
INSERT INTO aluno(pk_ra, nome, email, fk_grupo) VALUES
(02211000, 'Felipe Braga', 'fbraga@gmail.com', 1),
(02211001, 'Rafael Faria', 'rfaria@hotmail.com', 1),
(02211002, 'Pedro Altoé', 'paltoe@gmail.com', 1),
(02211003, 'Victor Aquino', 'vaquino@hotmail.com', 1),
(02211004, 'Lucas Mesquita', 'lmesquita@hotmail.com', 1),
(02211005, 'Bruno Silva', 'bsilva@gmail.com', 1),
(02211006, 'Luiz Carlos', 'lcarlos@gmail.com', 2),
(02211007, 'Cauã Benini', 'cbenini@gmail.com', 2),
(02211008, 'Matheus Lavigne', 'mlavigne@gmail.com', 2),
(02211009, 'Henrique Soares', 'hsoares@gmail.com', 2),
(02211010, 'Flávia Maria', 'fmaria@hotmail.com', 2),
(02211011, 'Enzo Godoy', 'egodoy@hotmail.com', 3),
(02211012, 'João Ruas', 'jruas@hotmail.com', 3),
(02211013, 'Lucas Henrique', 'lhenrique@hotmail.com', 3),
(02211014, 'Gustavo Leal', 'gleal@hotmail.com', 3),
(02211015, 'Gabriel Sanchez', 'gsanchez@hotmail.com', 3);

desc grupo;

-- insert table avaliacao
INSERT INTO avaliacao(fk_grupo, fk_prof, nota, av_data, av_hora) VALUES
(1, 10000, 9.5, '2021-04-19', '14:23'),
(2, 10000, 7.2, '2021-04-19', '14:34'),
(3, 10000, 8.7, '2021-04-19', '14:45'),
(1, 10001, 9.9, '2021-04-17', '10:41'),
(2, 10001, 9.8, '2021-04-17', '10:53'),
(3, 10001, 7.7, '2021-04-17', '10:59'),
(1, 10002, 8.9, '2021-04-18', '10:23'),
(3, 10002, 9.0, '2021-04-18', '10:34'),
(1, 10003, 9.5, '2021-04-20', '10:34'),
(2, 10003, 8.6, '2021-04-20', '10:40');

select * from avaliacao;
desc avaliacao;
-- DROP DATABASE bd10exercicio1;

-- SELECTS

SHOW TABLES;

-- •	3) Exibir todos os dados de cada tabela criada, separadamente.

SELECT * FROM aluno;


SELECT * FROM grupo;

SELECT * FROM avaliacao;

SELECT * FROM professor;

-- •	5) Exibir os dados dos grupos e os dados de seus respectivos alunos.
SELECT aluno.nome as 'Aluno', grupo.nome as 'Grupo' FROM grupo 
inner join aluno on grupo.pk_grupo = aluno.fk_grupo;

-- •	6) Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.
SELECT aluno.nome as 'Aluno', grupo.nome as 'Grupo' 
FROM grupo inner join aluno on grupo.pk_grupo = aluno.fk_grupo
WHERE grupo.pk_grupo = 1;

-- •	7) Exibir a média das notas atribuídas aos grupos, no geral.
SELECT avg(nota) as 'Média geral dos grupos' FROM avaliacao;

-- •	8) Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral.
SELECT min(nota) as 'Nota máxima geral', max(nota) 'Nota mínima geral' FROM avaliacao;

-- •	9) Exibir a soma das notas dadas aos grupos, no geral.
SELECT sum(nota) 'Soma das notas' FROM avaliacao;

-- 		10)	Exibir os dados dos professores que avaliaram 
-- cada grupo, os dados dos grupos, a data e o horário da avaliação.
SELECT 
professor.nome as 'Professor',
grupo.nome as 'Grupo', 
avaliacao.nota as 'Nota', 
avaliacao.av_data as 'Data', 
avaliacao.av_hora as 'Hora'
FROM professor 
INNER JOIN avaliacao ON professor.pk_prof = avaliacao.fk_prof 
INNER JOIN grupo ON grupo.pk_grupo = avaliacao.fk_grupo;

-- •	11)	Exibir os dados dos professores que avaliaram um 
-- determinado grupo, os dados do grupo, a data e o horário da avaliação.
SELECT 
professor.nome as 'Professor',
grupo.nome as 'Grupo', 
avaliacao.nota as 'Nota', 
avaliacao.av_data as 'Data', 
avaliacao.av_hora as 'Hora'
FROM professor 
INNER JOIN avaliacao ON professor.pk_prof = avaliacao.fk_prof 
INNER JOIN grupo ON grupo.pk_grupo = avaliacao.fk_grupo
WHERE grupo.pk_grupo = 1; -- Exibindo apenas grupo 1

-- •	12) Exibir os nomes dos grupos que foram avaliados por um determinado professor.
SELECT grupo.nome as 'Grupo'
FROM professor 
INNER JOIN avaliacao ON professor.pk_prof = avaliacao.fk_prof
INNER JOIN grupo ON grupo.pk_grupo = avaliacao.fk_grupo
WHERE professor.pk_prof = 10000;	-- Exibindo apenas grupos que foram avaliados pelo professor 10000

-- •	13) Exibir os dados dos grupos. Os dados dos alunos correspondentes,
--  os dados dos professores que avaliaram, a data e o horário da avaliação.
SELECT grupo.nome, aluno.nome, professor.*, avaliacao.av_data, avaliacao.av_hora 
FROM aluno INNER JOIN grupo ON aluno.fk_grupo = pk_grupo
INNER JOIN avaliacao ON grupo.pk_grupo = avaliacao.fk_grupo
INNER JOIN professor ON professor.pk_prof = fk_prof;

-- 14.	Exibir a quantidade de notas distintas.
SELECT DISTINCT nota FROM avaliacao;

-- 15.	Exibir a identificação do professor (pode ser o fk ou o nome),
-- a média das notas e a soma das notas atribuídas, agrupadas por professor.
SELECT professor.nome, avg(avaliacao.nota), sum(avaliacao.nota) 
FROM professor INNER JOIN avaliacao 
ON professor.pk_prof = avaliacao.fk_prof GROUP BY professor.nome;

-- 16.	Exibir a identificação do grupo (pode ser o fk ou o nome),
-- a média das notas e a soma das notas atribuídas, agrupadas por grupo.
SELECT grupo.nome, avg(nota), sum(nota) FROM grupo 
INNER JOIN avaliacao ON grupo.pk_grupo = avaliacao.fk_grupo
GROUP BY grupo.nome;

-- 17.	Exibir a identificação do professor (pode ser o fk ou o nome),
--  a menor nota e a maior nota atribuída, agrupada por professor.
SELECT professor.nome, min(nota), max(nota) FROM professor
INNER JOIN avaliacao ON professor.pk_prof = avaliacao.fk_prof 
GROUP BY professor.nome;

-- 18.	Exibir a identificação do grupo (pode ser o fk ou o nome),
--  a menor nota e a maior nota atribuída, agrupada por grupo.
SELECT grupo.nome, min(nota), max(nota) FROM grupo 
INNER JOIN avaliacao ON grupo.pk_grupo = avaliacao.fk_grupo 
GROUP BY grupo.nome;

