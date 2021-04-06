create database exemplo_funcao;
use exemplo_funcao;

-- DDL
create table aluno(
	ra int primary key auto_increment,
    nomeAluno varchar(45),
    telefoneFixo char(13),
    telefoneCel char(14),
    sexo char(1) check(sexo = 'm' or sexo = 'f' or sexo = 'n'),
    notaVest decimal(4, 2) check(notaVest >= 0 and notaVest <= 10)
) auto_increment = 2211000;

-- DML

-- insert errado
insert into aluno values (null, 'Bruno Silva', '(11) 91111-1111', 'k', 7.5);
insert into aluno values (null, 'Bruno Silva', '(11) 91111-1111', 'm', 27.5);
-- insert certo
insert into aluno values (null, 'Bruno Silva', '(11)1111-1111', '(11)91111-1111', 'm', 7.5);
insert into aluno values (null, 'Erik Pacheco', '(11)2222-2222', '(11)92222-2222', 'm', 7.5);
insert into aluno values (null, 'Cauã Benini', '(11)3333-3333', '(11)93333-3333', 'm', 7.5);
insert into aluno values (null, 'Isabella Souza', '(11)4444-4444', '(11)94444-4444', 'f', 7.5);

select * from aluno;

select sum(notaVest) as 'soma notas' from Aluno;
select avg(notaVest) as 'média notas' from aluno;
select max(notaVest) as 'Nota média' from aluno;
select avg(notaVest) as 'media meninas' from aluno where sexo = 'f';
select round(avg(notaVest), 2) as 'média notas' from aluno;
select truncate(avg(notaVest), 0) as 'média notas' from aluno;
