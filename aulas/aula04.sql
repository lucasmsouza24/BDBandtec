show databases;
use aluno;

insert into Aluno values (02211041, 'Leo Nunes', 'Ferraz de Vasconcelos'),
                         (02211042, 'Lucas Henrique Adelino', 'Ponte Grande'),
                         (02211044, 'Lucas Mesquita', 'Jardim São Luis'),
                         (02211057, 'Roberta Pires', 'Oswaldo Cruz'),
                         (02211022, 'Gabriel Sanchez', 'Scarpelli');

select * from aluno;

-- --------------------------------------------------------------------------------------
create table curso(
	idcurso int primary key auto_increment,
    nome char(5),
    coordenador varchar(15)
) auto_increment = 100;

-- inserção dos dados da tabela curso
insert into curso(nome, coordenador) values
('ADS', 'Gerson'),
('CCO', 'Marise'),
('Redes', 'Alex');

-- acrescentar uma coluna chamada fkCurso na tabela aluno
alter table aluno add fkCurso int;
 -- acrescentar restrição de FK à coluna fkcurso da tabela aluno 
 alter table aluno add foreign key(fkcurso) references curso(idcurso);
 
 -- preenchendo dados
 update aluno set fkcurso = 100 where ra in (2211016, 2211041, 2211057);
 update aluno set fkcurso = 101 where ra in (2211022, 2211042);
 update aluno set fkcurso = 102 where ra = 2211044;
 
 select * from curso;
 
 -- exibir dados dos alunos e dos cursos correspondendes
 select aluno.ra, aluno.ra, aluno.bairro, curso.idcurso, curso.nome, curso.coordenador from aluno, curso where fkcurso = idcurso and idcurso = 101;