create database ac3lucasmesquita;
use ac3lucasmesquita;

create table tbusuario(
	id int primary key auto_increment,
    nome varchar(45) not null,
    email varchar(100) not null unique
);
desc tbusuario;
-- insert
insert into tbusuario values
(null, 'Lucas Mesquita', 'lucas.msouza@bandtec.com'),
(null, 'Pedro Altoé', 'pedro.altoe@bandtec.com'),
(null, 'Rafael Faria', 'rafael.faria@bandtec.com'),
(null, 'Felipe Xavier', 'felipe.xavier@bandtec.com'),
(null, 'Bruno Silva', 'bruno.silva@bandtec.com'),
(null, 'Victor Aquino', 'victor.aquino@bandtec.com');

select * from tbusuario;

create table tbgenero(
	id int primary key auto_increment,
    nome varchar(20)
);

desc tbgenero;
-- insert
insert into tbgenero values
(null, 'ação'),
(null, 'aventura'),
(null, 'drama'),
(null, 'terror'),
(null, 'comédia'),
(null, 'romantico'),
(null, 'ficçao cientifica'),
(null, 'suspense');

select * from tbgenero;

create table tbmidia(
	id int primary key auto_increment,
    titulo varchar(100) not null,
    ano_lancamento int check(ano_lancamento >= 1900 and ano_lancamento <= 2100),
    tipo enum('filme', 'serie'),
    fkgenero int,
	foreign key (fkgenero) references tbgenero(id)
);

desc tbmidia;
-- insert
insert into tbmidia values
(null, 'interstellar', 2014, 'filme', 7),
(null, 'duro de matar', 2012, 'filme', 1),
(null, 'breaking bad', 2010, 'serie', 3),
(null, 'dark', 2018, 'serie', 8),
(null, 'superbad', 2004, 'filme', 5),
(null, 'stranger things', 2017, 'serie', 4),
(null, 'coringa', 2019, 'filme', 1),
(null, 'thor: ragnarok', 2018, 'filme', 1),
(null, 'minha mae é uma peça', 2016, 'filme', 5);

select * from tbmidia;

create table tbavaliacao(
	id int primary key auto_increment,
    nota int check(nota >= 0 and nota <=10),
    fkusuario int,
    fkmidia int,
    foreign key(fkusuario) references tbusuario(id),
    foreign key(fkmidia) references tbmidia(id)
);

desc tbavaliacao;
-- insert
insert into tbavaliacao values
(null, 10, 2, 1),
(null, 7, 1, 2),
(null, 10, 2, 2),
(null, 6, 6, 4),
(null, 9, 5, 6),
(null, 10, 3, 6),
(null, 7, 2, 6),
(null, 8, 3, 3),
(null, 10, 1, 9),
(null, 10, 5, 5),
(null, 8, 5, 6),
(null, 10, 1, 7),
(null, 10, 2, 7),
(null, 10, 3, 7),
(null, 10, 4, 7),
(null, 9, 2, 4);

select * from tbavaliacao;

-- relacionamento 1:N
select tbmidia.*, tbgenero.nome as 'genero' from tbmidia inner join tbgenero on tbmidia.fkgenero = tbgenero.id;

-- relacionamento N:M
select tbusuario.nome, tbmidia.titulo, tbavaliacao.nota 
from tbusuario inner join tbavaliacao on tbusuario.id = tbavaliacao.fkusuario 
inner join tbmidia on tbmidia.id = tbavaliacao.fkmidia;


-- relacionamento N:M mas apenas dados do filme 'coringa'
select tbusuario.nome, tbmidia.titulo, tbavaliacao.nota 
from tbusuario inner join tbavaliacao on tbusuario.id = tbavaliacao.fkusuario 
inner join tbmidia on tbmidia.id = tbavaliacao.fkmidia where tbmidia.titulo = 'coringa';

-- um campo de uma entidade forte do relacionamento N:M e um campo da tabela associativa de forma correspondente
select tbmidia.titulo, tbavaliacao.nota as 'nota atribuida por algum usuario' from tbavaliacao inner join tbmidia on tbavaliacao.fkmidia = tbmidia.id;


-- Tabela N:M com alguma função
select tbmidia.titulo, avg(tbavaliacao.nota) as 'nota média' from tbavaliacao inner join tbmidia on tbmidia.id = tbavaliacao.fkmidia group by tbmidia.titulo;

-- left join
select tbusuario.nome, tbmidia.titulo, tbavaliacao.nota 
from tbusuario inner join tbavaliacao on tbusuario.id = tbavaliacao.fkusuario 
right join tbmidia on tbmidia.id = tbavaliacao.fkmidia;

select tbmidia.id from tbmidia where tbmidia.titulo = 'minha mae é uma peça';
-- Excluindo dado utilizando subquery
update tbavaliacao set nota = 10 where tbavaliacao.fkmidia in (select tbmidia.id from tbmidia where tbmidia.titulo = 'minha mae é uma peça');

select titulo, nota from tbavaliacao inner join tbmidia on tbavaliacao.fkmidia = tbmidia.id where tbmidia.titulo = 'minha mae é uma peça';
-- drop database ac3lucasmesquita;