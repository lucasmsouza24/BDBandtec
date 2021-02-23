-- exercício 1

-- criação e seleção do banco
create database atleta;
use atleta;

-- criação da tabela
create table atleta(
	id_atleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtd_medalha int 
);

-- inserção de dados
insert into atleta values
	(0, "Arthur Zanetti", 'ginástica', 21),
    (1, 'Thiago Braz', 'salto com vara', 3), 
    (2, 'Chen Yibing', 'ginástica', 6), 
    (3, 'Armand Duplantis', 'salto com vara', 3), 
    (4, 'Michael Phelps', 'natação', 83), 
    (5, 'César Cielo', 'natação', 33);

-- exibindo todos os dados da tabela
select * from atleta;

-- exibir apenas nomes e quantidade de medalhas dos atletas
select nome, qtd_medalha from atleta;

-- exibir apenas as modalidades e os nomes dos atletas, nessa ordem
select modalidade, nome from atleta;

-- exibir dados dos atletas que tenham 3 medalhas ou mais
select * from atleta where qtd_medalha>=3;

-- exibir dados dos atletas cujo id_atleta seja menor que um determinado numero
select * from atleta where id_atleta < 5;

-- exibir dados de atletas de uma determinada modalidade
select * from atleta where modalidade = 'ginástica';

-- exibir os dados dos atletas cujo id_atleta esteja entre um valor e outro (ex: entre 3 e 7)
select * from atleta where id_atleta >= 2 and id_atleta <= 4;
