-- criando schema
CREATE DATABASE Revista;
SHOW DATABASES;
USE Revista;

-- criando tabela
CREATE TABLE Revista(
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    categoria VARCHAR(30),
    preco DECIMAL(5, 2)
) auto_increment = 1;

-- inserindo 4 registros mas sem informar categoria
INSERT INTO Revista(nome, preco) values
('Superinteressante', 7.90),
('Quatro Rodas', 7.90),
('Galileu', 15.90),
('Veja', 10.80)
;

-- exibindo todos os dados da tabela
select * from revista;

-- alterando categoria das revistas
update revista set categoria = 'Política' where idRevista = 4;
update revista set categoria = 'Ciência' where idRevista in (3, 1);
update revista set categoria = 'Automóveis' where idRevista = 2;
select * from revista;

-- inserindo mais 3 registros completos
insert into revista(nome, categoria, preco) values
('A Bolha', 'Ciência e Política', 7.90),
('CLAUDIA', 'Moda', 7.90),
('VOCÊ HR', 'Tecnologia', 7.90);
select * from revista;

-- exibindo descrição da tabela
desc revista;

-- alterando tabela para que a coluna categoria tenha apenas 40 caracteres
alter table revista modify categoria varchar(40);
desc revista;

-- renomeando campo nome para nomeRevista
alter table revista rename column nome to nomeRevista;
desc revista;

-- adicionando coluna de periodicidade
alter table revista add column periodicidade int;
select * from revista;

-- preenchendo periodicidade de cada registro
update revista set periodicidade = 'semanal' where idRevista = 1;
update revista set periodicidade = 'mensal' where idRevista = 2;
update revista set periodicidade = 'quinzenal' where idRevista = 3;
update revista set periodicidade = 'semanal' where idRevista = 4;
update revista set periodicidade = 'semanal' where idRevista = 5;
update revista set periodicidade = 'mensal' where idRevista = 6;
update revista set periodicidade = 'mensal' where idRevista = 7;

select * from revista;

-- insira os dados de uma nova revista, com todos os dados e posteriormente exiba todos os registros
insert into revista(nomeRevista, categoria, preco, periodicidade) values
('Revista do Zé', 'Geral', 9.90, 'semanal');
select * from revista;

-- exclua coluna periodicidade da tabela
alter table revista drop periodicidade;

select * from revista;

-- criando tabela editora
create table editora(
	idEditora int primary key auto_increment,
    nomeEditora varchar(40),
    dataFund date
) auto_increment = 1000;

-- inserindo dados em editora
insert into editora(nomeEditora, dataFund) values
('Panini', '1995-05-01'),
('Escala', '1992-08-23'),
('Editora Abril', '1950-09-14');

select * from editora;