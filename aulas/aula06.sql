create database escolaIdioma;
use escolaIdioma;

-- Criação da tabela aluno
create table Aluno(
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    bairro varchar(45)
) auto_increment = 1000;

-- criação da tabela curso
create table curso(
	idCurso int primary key auto_increment,
    nomeCurso varchar(45),
    coordenador varchar(45)
);

create table AlunoCurso(
	fkRa int,
    fkCurso int,
    dataInicio date,
    media decimal(4,2),
    nivel char(2),
    foreign key(fkRa) references Aluno(ra), 
    foreign key(fkCurso) references curso(idCurso),
    primary key (fkRa, fkCurso, dataInicio)
);

insert into aluno values (null, 'Maria', 'Saúde');
insert into aluno values (null, 'João', 'Consolação');
insert into curso values 
(null, 'Inglês', 'Beth'),(null, 'Espanhol', 'Juan') ;

insert into AlunoCurso values (1000, 1, '2015-02-01', 9.0, 'A1'),
                              (1000, 2, '2017-02-01', 7.0, 'I3'),
                              (1001, 1, '2020-02-01', 7.0, 'B1'),
                              (1001, 2, '2019-02-01', 8.5, 'I2');
                              
select * from Aluno, Curso, AlunoCurso where aluno.ra = alunoCurso.fkra and curso.idcurso = alunoCurso.fkCurso;

select fkCurso, min(media) as 'menos média', max(media) as 'maior média' from alunoCurso group by fkCurso;

select distinct media from alunocurso;

select count(distinct media) as 'quandidade de médias' from alunocurso;