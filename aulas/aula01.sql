-- Isso é um comentário
-- Criação do banco de dados aluno
create database aluno; -- aluno é o nome do banco de dados
-- Selecionar o banco de dados aluno
use aluno;
-- Criação da tabela Aluno
create table Aluno (
  ra int primary key,  -- ra é a chave primária desta tabela
  nome varchar(40),
  bairro varchar(40)
);
-- Exibir a tabela Aluno
select * from Aluno;
-- * significa todas as colunas
-- no lugar do *, vc pode colocar os nomes das colunas que vc quer exibir
-- seleciona apenas a coluna ra 
select ra from Aluno;
select ra, nome, bairro from Aluno;  -- equivale a select * from Aluno
-- seleciona as colunas nome e ra, nessa ordem
select nome, ra from Aluno;

-- Inserção de dados de um aluno na tabela
-- valor de campo int é inserido sem aspas
-- valor de campo varchar ou char é inserido com aspas simples
insert into Aluno values (02211016, 'Fernando Martins','Taboão');
-- Exibir os dados da tabela
select * from Aluno; 

-- Inserção de dados de mais alunos
insert into Aluno values
(02211041, 'Leo Nunes', 'Ferraz de Vasconcelos'),
(02211042, 'Lucas Henrique Adelino', 'Ponte Grande'),
(02211044, 'Lucas Mesquita', 'Jardim São Luis'),
(02211057, 'Roberta Pires', 'Oswaldo Cruz'),
(02211022, 'Gabriel Sanchez', 'Scarpelli');
                         
-- Exibir os dados dos alunos que são do bairro 'Taboão'
select * from Aluno where bairro = 'Taboão';

-- insert rafa
insert into Aluno values(02211054, 'Rafael Gomes', 'Jardim São José');

-- exibir estrutura da tabela
desc Aluno;

-- exibir os alunos cujo RA estejam entre um valor e outro
select * from aluno where ra between 02211040 and 02211050;

-- exibir os alunos cujo RA seja diferente de um determinado valor 
select * from aluno where ra > 02211045;
-- ou
select * from aluno where ra != 02211022;

-- exibir dados da tabela ordenados pelo nome do aluno
select * from aluno order by nome asc;

-- exibir dados da tabela ordenados de forma descrescente pelo nome do aluno
select * from aluno order by nome desc;

-- exibir dados da tabela ordenados pelo bairro
select * from aluno order by bairro;

-- exibir dados dos alunos cujo RA termine com 4
select * from aluno where ra like '%4';

-- exibir dados de alunos cujo bairro comece com a letra J
select * from aluno where bairro like 'J%';

-- exibir dados de alunos cujo nome termine com s 
select * from aluno where nome like '%s';

-- exibir dados de alunos cujo a segunda letra é "e" 
select * from aluno where nome like '_e%';

-- exibir dados de alunos cujo a segunda letra do bairro seja a letra "a"
select * from aluno where bairro like '_a%';

-- exibir os dados de alunos cujo a penúltima letra do nome seja "e"
select * from aluno where nome like '%e_';

-- exibir os dados de alunos cujo a penúltimas letras do primeiro nome e sobrenome sejam "e"
select * from aluno where nome like '%e_ %';

-- exibir os dados dos alunos cujo sobrenome termine com a letra 's' ou com a letra 'z'
select * from aluno where nome like '%s' or nome like '%z';

select * from aluno where nome like '% %';

-- exibir os dados dos alunos cujo RA seja diferente 2211022 ou 2211054 ou 2211042
select * from aluno where ra not in (2211022, 2211054, 2211042);

-- atualizando valores
-- alterando bairro do aluno de ra 2211016 para 'Vila Santa Luzia'
update aluno set bairro = 'Vila Santa Luzia' where ra = 2211016;

-- alterar o bairro e o nome do aluno de ra = 2211054
update aluno set nome = 'Rafael Faria Gomes', bairro = 'Olímpico' 
where ra = 2211054;

-- excluir o aluno de ra = 2211044
delete from aluno where ra = 2211044;

-- excluir tabela
drop table aluno;

-- excluir banco de dados
drop database aluno;
