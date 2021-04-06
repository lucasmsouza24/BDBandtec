-- criando bd 
create database bd06exercicio2;
use bd06exercicio2;

-- criando tabela pessoa
create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(30),
data_nasc date,
profissao varchar(30),
idioma varchar(45)
);

-- criando tabela gasto
create table gasto(
idGasto int primary key auto_increment,
data_gasto date,
valor decimal(6, 2) check(valor > 0),
descricao varchar(45),
fkPessoa int,
foreign key(fkPessoa) references pessoa(idPessoa)
);

-- Inserindo dados na tabela pessoa:
insert into pessoa(nome, data_nasc, profissao, idioma) values
('James', '1991/10/29', 'Gerente de TI', 'Espanhol'),
('Pedro', '1997/04/27', 'Estagiário em Administração', 'Português'),
('Rodrigo', '2001/02/01', 'Gerente de TI', 'Português'),
('Lara', '2000/07/03', 'Desenvolvedora Frontend', 'Português, inglês');

-- Inserindo dados na tabela gasto:
insert into gasto(data_gasto, valor, descricao, fkpessoa) values 
('2021/03/23', 8000, 'iPhone 12 PRO', 1),
('2021/04/01', 70, 'Livro', 1),
('2021/04/05', 350, 'Fritadeira Elétrica', 1),
('2021/03/20', 32.50, 'Lanche', 2),
('2021/03/21', 27.30, 'Lanche', 2),
('2021/03/30', 80, 'Mouse', 2),
('2021/04/05', 689.90, 'Monitor', 2),
('2021/03/22', 15, 'Capa de celular', 3),
('2021/04/05', 200, 'Tenis', 3),
('2021/04/05', 28.90, 'lanche', 3),
('2021/04/04', 199.99, 'web cam', 4);

-- Exibindo dados da tabela pessoa:
select * from pessoa;

-- Exibindo dados da tabela gasto:
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissao, etc)
select * from pessoa, gasto where pessoa.idPessoa = gasto.fkPessoa and pessoa.profissao = 'gerente de ti';

-- Exiba os dados das pessoas e seus gastos correspondentes:
select * from pessoa, gasto where pessoa.idPessoa = gasto.fkPessoa;

-- Exiba dados de uma determinada pessoa e seus gastos correspondentes:
select * from pessoa, gasto where pessoa.idPessoa = gasto.fkPessoa and pessoa.idPessoa = 2;

-- Atualize valores já inseridos na tabela:
select * from gasto;
update pessoa set idioma = 'Inglês' where idPessoa = 4;
update gasto set valor = 7598.90 where idGasto = 1;

-- Exibindo soma e média de valor gasto
select sum(valor) as 'Soma dos Valores', avg(valor) as 'Media dos Valores' from gasto;

-- Exibindo valor máximo e valor mínimo:
select max(valor) as 'Valor máximo', min(valor) as 'Valor mínimo' from gasto;

-- Exibir a soma e a média do valor gasto por uma determinada pessoa:
select max(valor) as 'Valor máximo', min(valor) as 'Valor mínimo' from gasto where fkPessoa = 3;

-- Exibir valor máximo e mínimo gasto por uma determinada pessoa:
select max(valor) as 'Valor máximo', min(valor) as 'Valor mínimo' from gasto where fkPessoa = 2;

-- Exclua um ou mais registro de alguma tabela
delete from gasto where idGasto = 1;

select * from gasto;
drop database bd06exercicio2;