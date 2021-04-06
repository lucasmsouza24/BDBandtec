-- Exercicio 2

-- criação e seleção do banco de dados 
create database musica;
use musica;

-- criação de tabela musica
create table musica(
	id_musica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

-- inserindo dados
insert into musica values
(0, 'Little Dark Age', 'MGMT', 'Psychedelic Pop'),
(1, 'Summer Nights', 'SIAMES', 'Indie Pop'),
(2, 'Sit Next to Me', 'Foster the People', 'Indie Pop'),
(3, 'Static Space Lover', 'Foster the People', 'Indie Pop'),
(4, 'Brianstorm', 'Arctic Monkeys', 'Indie Rock'),
(5, 'Teddy Picker', 'Arctic Monkeys', 'Indie Rock'),
(6, 'Do Me a Favour', 'Arctic Monkeys', 'Indie Rock'),
(7, 'Run For Cover', 'The Killers', 'Pop Rock'),
(8, 'When You Were Young', 'The Killers', 'Indie Rock'),
(9, 'Gratisfaction', 'The Strokes', 'Indie Rock'),
(10, 'Last Nite', 'The Strokes', 'Indie Rock'),
(11, 'Eternal Summer', 'The Strokes', 'Indie Rock'),
(12, 'Selfless', 'The Strokes', 'Indie Rock'),
(13, 'Why Are Sundays so Depressing', 'The Strokes', 'Indie Rock');

-- a) exibir todos os dados de uma tabela
select * from musica;

-- b) exibir apenas títulos e artistas das músicas
select titulo, artista from musica;

-- c) exibir apenas gêneros e artistas, nessa ordem
select genero, artista from musica;

-- d) exibir dados de um determinado gênero
select * from musica where genero = 'Indie Rock';

-- e) exibir dados das musicas de um determinado artista
select * from musica where artista = 'Arctic Monkeys';

-- f) exibir apenas os titulos das musicas de um determinado gênero
select titulo from musica where genero = 'Indie Pop';

-- g) exibir apenas os títulos e o gênero das músicas de um determinado artista
select titulo, genero from musica where artista = 'The Strokes';

-- h) exibir dados das músicas cujo id_musica esteja entre um valor e outro (por exemplo, 2 e 5)
select * from musica where id_musica >= 2 and id_musica <= 9;

-- i) exibir os dados das músicas cujo id_musica seja menor ou igual a um valor
select * from musica where id_musica <= 6;

-- j) exibir os dados das músicas cujo id_musica seja maior ou igual a um valor
select * from musica where id_musica >= 7;