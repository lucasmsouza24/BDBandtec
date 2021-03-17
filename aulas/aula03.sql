create database digitalschool;
use digitalschool;

create table curso(
	idcurso int primary key auto_increment,
    nomeCurso char(5),
    coordenador varchar(15)
) auto_increment = 100;

insert into curso(nomeCurso, coordenador) values
('ADS', 'Gerson'),
('CCO', 'Marise'),
('Redes', 'Alex');

select * from curso;

create table aluno(
	ra int primary key auto_increment,
    nomealuno varchar(40),
    bairro varchar(30),
    fkcurso int,
    foreign key (fkcurso) references curso(idcurso)
) auto_increment = 50000;

insert into aluno(nomealuno, bairro, fkcurso) values
('Maria', 'Paraíso', 100),
('João', 'Consolação', 101),
('Mickey', 'Disney', 100),
('Pateta', 'Florida', 102);

select * from aluno;

SELECT * FROM information_schema.columns WHERE table_schema = 'digitalschool';

select * from aluno, curso where fkcurso = idcurso;