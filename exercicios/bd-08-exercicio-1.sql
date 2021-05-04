-- criando banco
create database alunoDisciplina;
use alunoDisciplina;

-- criando tabela aluno
create table aluno(
	ra INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(45),
    bairro VARCHAR(45)
);

-- criando tabela disciplina
create table disciplina(
	id_disc INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);

create table alunoDisciplina(
	id_mat INT PRIMARY KEY AUTO_INCREMENT,
    data_mat DATE,
    media DECIMAL(3,1),
    qtd_faltas INT,
    fk_aluno INT,
    fk_disc INT,
    foreign key(fk_aluno) references aluno(ra),
    foreign key(fk_disc) references disciplina(id_disc)
);


-- insert alunos
insert into aluno values
(2211000, 'Alice Soares', 'Luz'),
(2211001, 'Pedro Rodrigues', 'Liberdade');

-- insert disciplina
insert into disciplina(nome) values
('Calculo I'),
('Arquitetura de Computadores'),
('Algoritmos'),
('Banco de Dados');

-- insert matricula
insert into alunoDisciplina(fk_aluno, fk_disc, data_mat, media, qtd_faltas) values
(2211000, 1, '2021-02-01', 8, 2),
(2211000, 2, '2021-02-01', 9.6, 0),
(2211001, 3, '2021-02-01', 7.9, 0),
(2211001, 4, '2021-02-01', 5.3, 1),
(2211001, 4, '2021-07-01', 8.4, 0);

-- a)
select * from aluno;
select * from disciplina;
select * from alunoDisciplina;

-- b)
select aluno.nome, disciplina.nome, alunoDisciplina.media,
 alunoDisciplina.qtd_faltas, alunoDisciplina.data_mat from
aluno, alunoDisciplina, disciplina where
aluno.ra = alunoDisciplina.fk_aluno and alunoDisciplina.fk_disc = disciplina.id_disc;

-- c)
select aluno.nome, disciplina.nome, alunoDisciplina.media,
 alunoDisciplina.qtd_faltas, alunoDisciplina.data_mat from
aluno, alunoDisciplina, disciplina where
aluno.ra = alunoDisciplina.fk_aluno 
and alunoDisciplina.fk_disc = disciplina.id_disc 
and disciplina.id_disc = 4;

-- d)
select aluno.nome, disciplina.nome, alunoDisciplina.media,
 alunoDisciplina.qtd_faltas, alunoDisciplina.data_mat from
aluno, alunoDisciplina, disciplina where
aluno.ra = alunoDisciplina.fk_aluno 
and alunoDisciplina.fk_disc = disciplina.id_disc 
and aluno.ra = 2211001;

-- e)
select sum(media), sum(qtd_faltas) from alunoDisciplina;
 
 -- f)
select avg(media), avg(qtd_faltas) from alunoDisciplina;

-- g)
select max(media), min(media) from alunoDisciplina;

-- h)
select max(qtd_faltas), min(qtd_faltas) from alunoDisciplina;

-- i)
select disciplina.nome, max(media), min(media) 
from alunoDisciplina, disciplina 
where alunoDisciplina.fk_disc = disciplina.id_disc 
group by disciplina.id_disc;

-- j)
select aluno.nome, max(media), min(media) 
from aluno, alunoDisciplina 
where aluno.ra = alunoDisciplina.fk_aluno
group by aluno.ra;

-- k)
select media from alunoDisciplina;

-- l)
select distinct media 
from alunoDisciplina;

-- m)
select count(media) 
from alunoDisciplina;
 
-- drop database bd08exercicio1;

