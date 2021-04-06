create database bd06exercicio1;
use bd06exercicio1;

create table cliente(
	id_cliente int primary key auto_increment,
    nome_cliente varchar(45),
    telefone_fixo_cliente char(10),
    telefone_celular_cliente char(11)
);

create table endereco(
	id_endereco int primary key auto_increment,
    rua_endereco varchar(45),
    num_endereco int,
    bairro varchar(30),
    estado_endereco char(2),
    cidade_endereco varchar(30),
    cep_endereco char(8),
    fk_cliente int,
    foreign key (fk_cliente) references cliente(id_cliente)
);

create table pet(
	id_pet int primary key auto_increment,
    especie_pet enum('gato', 'cachorro', 'coelho'),
    nome_pet varchar(20),
    raca_pet varchar(30),
    peso_pet decimal(5, 2),
    fk_cliente int,
    foreign key(fk_cliente) references cliente(id_cliente)
) auto_increment = 101;

desc cliente;

-- inserindo dados de clientes
insert into cliente (nome_cliente, telefone_fixo_cliente, telefone_celular_cliente) values
('Maria Aparecida', '1111111111', '11911111111'),
('Joao Victor', '1122222222', '11922222222'),
('Pedro Dias', '1133333333', '11933333333'),
('Victor Santos', '1144444444', '11944444444');

desc endereco;
insert into endereco (rua_endereco, num_endereco, bairro_endereco, estado_endereco, cidade_endereco, cep_endereco, fk_cliente) values
('Rua das Neves', 187, 'Jardim Nevada', 'SP', 'São Paulo', 05811111, 1),
('Rua das Vistas', 231, 'Jardim Visão', 'SP', 'São Paulo', 05811221, 2),
('Rua do Biscoito', 1093, 'Jardim do Trigo', 'RJ', 'Rio de Janeiro', 23580430, 3),
('Rua das Neves', 182, 'Jardim Nevada', 'SP', 'São Paulo', 05811111, 4);

-- inserindo dados na tabela pet
insert into pet(especie_pet, nome_pet, raca_pet, peso_pet, fk_cliente) values
('gato', 'miro', 'siamês', 4, 1),
('gato', 'peter', 'siamês', 3.9, 1),
('coelho', 'carrot', 'Coelho Gigante Flemish', 7, 2),
('cachorro', 'Armin', 'Golden', 28, 3),
('cachorro', 'Jorge', 'Golden', 31, 1),
('coelho', 'Aang', 'Angorá', 3.4, 4);

select * from cliente;

select * from endereco;

select * from pet;

-- alterando tamanho da coluna nome_cliente
alter table cliente modify nome_cliente varchar(30);
desc cliente;

-- Exibindo pets que são de um determinado tipo:
select * from pet where especie_pet = 'coelho';

-- Exibindo apenas nomes e pesos dos pets:
select nome_pet, peso_pet from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome:
select * from pet order by nome_pet asc;

-- exibibir os dados dos clientes ordenados em ordem decrescente pelo bairro
select * from cliente, endereco where cliente.id_cliente = endereco.fk_cliente order by endereco.bairro_endereco desc;

-- Exibir dados dos pets cujo nome comece com uma determinada letra:
select * from pet where nome_pet like 'A%';

-- Exibir dados dos clients que tenham um determinado sobrenome:
select cliente.*, endereco.id_endereco from cliente, endereco where cliente.id_cliente = endereco.fk_cliente and nome_cliente like '%Dias';

-- Alterando o telefone de um determinado cliente
select * from cliente;
update cliente set telefone_celular_cliente = '11912311231' where id_cliente = 1;

-- Exibindo dados dos pets e seus respectivos donos:
select pet.*, cliente.nome_cliente from pet, cliente where pet.fk_cliente = cliente.id_cliente;

-- Exibindo dados dos pets e seus respectivos donos, mas de somente um cliente:
select pet.*, cliente.nome_cliente from pet, cliente where pet.fk_cliente = cliente.id_cliente and cliente.id_cliente = 1;

-- Exibindo soma e média dos pesos dos pets
select sum(peso_pet) as 'Soma dos pesos', avg(peso_pet) as 'Média dos pesos' from pet;

-- Exibindo peso máximo e peso mínimo dos pets
select max(peso_pet) as 'Peso máximo', min(peso_pet) as 'Peso mínimo' from pet;

-- Exibindo soma e média dos pesos dos pets da espécie cachorro
select sum(peso_pet) as 'Soma de pesos dos cachorros', avg(peso_pet) as 'Média de peso dos cachorros' from pet where especie_pet = 'cachorro';

-- Exibindo peso máximo e peso mínimo dos pets da espécie cachorro:
select max(peso_pet) as 'Peso máximo (cachorro)', min(peso_pet) as 'Peso mínimo (cachorro)' from pet where especie_pet = 'cachorro';

-- Excluindo algum pet
delete from pet where id_pet = 102;
select * from pet;

-- Excluindo tabelas
alter table pet drop foreign key fk_cliente;
drop table pet;
drop table endereco;
drop table cliente;

show tables;

drop database bd06exercicio1;