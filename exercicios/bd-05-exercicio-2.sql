-- 1)
use revista;

-- acrescentando coluna
alter table revista add column fkeditora int;
-- acrescentando constraint
alter table revista add foreign key(fkeditora) references editora(idEditora);

-- mostrando 
select * from revista;
select * from editora;

update revista set fkeditora = 1002 where idrevista = 1;
update revista set fkeditora = 1000 where idrevista = 2;
update revista set fkeditora = 1001 where idrevista = 3;
update revista set fkeditora = 1002 where idrevista = 4;
update revista set fkeditora = 1000 where idrevista = 5;
update revista set fkeditora = 1001 where idrevista = 6;
update revista set fkeditora = 1002 where idrevista = 7;
update revista set fkeditora = 1002 where idrevista = 8;
update revista set fkeditora = 1000 where idrevista = 9;

select revista.*, editora.nomeeditora, editora.datafund from revista, editora where fkeditora = idEditora;

select revista.*, editora.nomeeditora, editora.datafund from revista, editora where fkeditora = idEditora and nomeeditora = 'Editora Abril';

-- 2)
use atleta;
select * from pais;
desc atleta;

create table pais(
	idpais int primary key auto_increment,
    nome varchar(20),
    capital varchar(20)
);

insert into pais(nome, capital) values
('brasil', 'brasilia'),
('china', 'pequim'),
('eua', 'washington');

alter table atleta add column fkpais int;
alter table atleta add foreign key(fkpais) references pais(idpais);

update atleta set fkpais = 1 where id_atleta = 0;
update atleta set fkpais = 1 where id_atleta = 1;
update atleta set fkpais = 2 where id_atleta = 2;
update atleta set fkpais = 3 where id_atleta = 3;
update atleta set fkpais = 1 where id_atleta = 4;
update atleta set fkpais = 1 where id_atleta = 5;

select * from atleta, pais where fkpais = idpais;
select atleta.id_atleta, atleta.nome, atleta.modalidade, atleta.qtd_medalha, pais.idpais, pais.nome, pais.capital from atleta, pais where atleta.fkpais = pais.idpais and pais.nome = 'brasil';

-- 3)

use musica;

create table musica(
	idmusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

insert into musica(titulo, artista, genero) values
('Go Your Own Way', 'Fleetwood Mac', 'Pop Rock'),
('Freakin Out On the Interstate', 'Briston Maroney', 'Indie Rock'),
('If You Know Whats Right', 'Hers', 'Indie Pop, Indie Rock'),
('Dreams', 'Fleetwood Mac', 'Pop Rock'),
('Making A Fire', 'Foo Fighters', 'Alternative Rock'),
('Holding Poison', 'Foo Fighters', 'Alternative Rock'),
('Life Worth Living', 'LAUREL', 'Indie Pop'),
('Same Mistakes', 'LAUREL', 'Indie Pop'),
('Adored', 'LAUREL', 'Indie Pop'),
('Take It Back', 'LAUREL', 'Indie Pop'),
('Empty Kisses', 'LAUREL', 'Indie Pop'),
('Dig What You Dug', 'Wallows', 'IndieRock, Indie Pop'),
('Nobody Gets Me (Like You)', 'Wallows', 'IndieRock, Indie Pop'),
('Virtual Aerobics', 'Wallows', 'IndieRock, Indie Pop');

-- select * from musica where genero like '%Indie Pop%';

create table album(
	idalbum int primary key auto_increment,
    nome varchar(40),
    gravadora varchar(40)
);

insert into album(nome, gravadora) values
('Rumours', 'Warner Records'),
('Carnival', 'Canvasback Music'),
('Invitation to Hers', 'Heist or Hit Records'),
('Medcine At Midnight', 'RCA Records'),
('DOGVIOLET', 'Counter Records'),
('Remote', 'Atlantic Records');

alter table musica add fkalbum int;
alter table musica add foreign key(fkalbum) references album(idalbum);

select * from musica;

update musica set fkalbum = 1 where idmusica = 1;
update musica set fkalbum = 2 where idmusica = 2;
update musica set fkalbum = 3 where idmusica = 3;
update musica set fkalbum = 1 where idmusica = 4;
update musica set fkalbum = 4 where idmusica = 5;
update musica set fkalbum = 4 where idmusica = 6;
update musica set fkalbum = 5 where idmusica = 7;
update musica set fkalbum = 5 where idmusica = 8;
update musica set fkalbum = 5 where idmusica = 9;
update musica set fkalbum = 5 where idmusica = 10;
update musica set fkalbum = 5 where idmusica = 11;
update musica set fkalbum = 6 where idmusica = 12;
update musica set fkalbum = 6 where idmusica = 13;
update musica set fkalbum = 6 where idmusica = 14;

select * from musica;
select * from musica, album where musica.fkalbum = album.idalbum;
select * from musica, album where musica.fkalbum = album.idalbum and album.nome = 'DOGVIOLET';
select * from musica, album where musica.fkalbum = album.idalbum and album.gravadora = 'Warner Records';

-- 4)
create database atividade4;
use atividade4;

create table empresa(
	id int primary key auto_increment,
    nome varchar(30)
);

create table instituicao_origem(
	id int primary key auto_increment,
    nome varchar(30)
);

create table Aluno(
	ra int not null primary key,
    nome varchar(40), 
    telefone char(11),
    email varchar(40),
    hobbie varchar(25),
    fkInst int,
    fkEmpr int,
    foreign key(fkInst) references instituicao_origem(id),
    foreign key(fkEmpr) references empresa(id)
);

select * from empresa;

insert into empresa(nome) values 
('DELL'),
('Berghem'),
('Gomac'),
('Oracle'),
('IBM');

select * from instituicao_origem;

insert into instituicao_origem(nome) values
('Bandtec'),
('UNICAMP'),
('FATEC'),
('SENAC');

select * from aluno;

insert into aluno values
(2211044, 'Lucas Mesquita de Souza', '11954563499',	'lucas.msouza@bandtec.com',	'Guitarra',	1,	2),
(2211045, 'Roberto Simas Júnior', '11973649328', 'rob.sjun@bandtec.com', 'Natação',	3,	1),
(2211046, 'Carlos Alberto',	'11983750367', 'carl.alberto@bandtec.com', 'Futebol', 1, 5),
(2211047, 'Miguel Henrique Silva', '11983765487', 'miguel.hsilva@bandtec.com', 'Ciclismo',	2,	2),
(2211048, 'Rodolfo Leal', '11993878276', 'rodolfo.leal@bandtec.com', 'Piano',	2,	2),
(2211049, 'Lucas Krebs', '11984720171',	'lucas.krebs@bandtec.com', 'Video Game', 1,	1),
(2211050, 'João Almeida Campos', '11972659254', 'joao.acampos@bandtec.com',	'Futebol',	4,	3),
(2211051, 'Joaquim Carlos Souza', '11983752983', 'joaquim.csouza@bandtec.com', 'Academia',	2,	3),
(2211052, 'Bruno Estevão Nunes', '11974682134', 'bruno.enunes@bandtec.com',	'Leitura',	4,	2),
(2211053, 'Diego Rafael Oliveira', '11967309845', 'diego.roliveira@bandtec.com', 'Teatro',	3,	4);

select * from aluno, instituicao_origem where aluno.fkinst = instituicao_origem.id;
select * from aluno, empresa where aluno.fkempr = empresa.id;
select * from aluno, empresa, instituicao_origem where aluno.fkinst = instituicao_origem.id and aluno.fkempr = empresa.id;

select * from empresa;