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
insert into Aluno values (02211041, 'Leo Nunes', 'Ferraz de Vasconcelos'),
                         (02211042, 'Lucas Henrique Adelino', 'Ponte Grande'),
                         (02211044, 'Lucas Mesquita', 'Jardim São Luis'),
                         (02211057, 'Roberta Pires', 'Oswaldo Cruz'),
                         (02211022, 'Gabriel Sanchez', 'Scarpelli');
                         
-- Exibir os dados dos alunos que são do bairro 'Taboão'
select * from Aluno where bairro = 'Taboão';