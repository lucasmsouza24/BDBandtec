-- atividade prática 10
CREATE DATABASE Exercicio10;
USE Exercicio10;

-- tabela departamento
CREATE TABLE Departamento(
	idDepto INT PRIMARY KEY,
    nomeDepto VARCHAR(45),
    fkGerente INT,
	dataInicioGer DATE
 );

-- tabela funcionario
CREATE TABLE Funcionario(
	idFunc INT PRIMARY KEY, 
    nomeFunc VARCHAR(30), 
    salario DECIMAL(8.2), 
    sexo CHAR(1) CHECK(sexo = 'm' OR sexo = 'f'), 
    fkSupervisor INT,
    dataNasc DATE,
    fkDepto INT
);

-- tabela projeto
CREATE TABLE Projeto(
	idProj INT PRIMARY KEY,
    nomeProj VARCHAR(30),
    localProj VARCHAR(45),
    fkDepto INT
);

-- tabela funcProj
CREATE TABLE funcProj(
	fkFunc INT,
    fkProj INT,
    horas DECIMAL(3,1),
    PRIMARY KEY(fkFunc, fkProj)
);

-- insert tabela departamento
INSERT INTO departamento VALUES
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

-- insert tabela funcionario
INSERT INTO funcionario VALUES
(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', null, '1957-11-10', 101);

-- insert tabela projeto
INSERT INTO projeto VALUES
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

-- insert tabela funcProj
INSERT INTO funcProj VALUES
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40),
(6, 1, 20),
(6, 2, 20),
(2, 2, 10),
(2, 3, 10),
(2, 10, 10),
(2, 20, 10),
(3, 30, 30),
(3, 10, 10),
(7, 10, 35),
(7, 30, 5),
(4, 30, 20),
(4, 20, 15),
(8, 20, null);

-- tabela departamento
ALTER TABLE departamento ADD FOREIGN KEY(fkGerente) 
REFERENCES funcionario(idFunc);

-- tabela funcionario
ALTER TABLE funcionario ADD FOREIGN KEY(fkSupervisor) 
REFERENCES funcionario(idFunc);

ALTER TABLE funcionario ADD FOREIGN KEY(fkDepto) 
REFERENCES departamento(idDepto);

-- tabela projeto
ALTER TABLE projeto ADD FOREIGN KEY(fkDepto)
REFERENCES departamento(idDepto);

-- 1.	Exibindo dados de cada tabela separadamente.
SELECT * FROM departamento;

SELECT * FROM funcionario;

SELECT * FROM projeto;

SELECT * FROM funcProj;

-- 2.	Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO funcionario VALUES
(null, 'Cecília Ribeiro', 2800, 'f', null, '1980-04-05');

-- 3. Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO funcionario VALUES
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);

-- 4.	Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO funcionario VALUES
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);

-- 5.	Inserir mais o seguinte funcionário na tabela Funcionario:
INSERT INTO funcionario VALUES
(9, 'cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);

-- 6.	Excluir o seguinte registro da tabela FUNCPROJ:
DELETE FROM funcProj WHERE fkFunc = 3 AND fkProj = 10;

-- 7.	Excluir o seguinte registro da tabela FUNCIONARIO:
DELETE FROM funcionario WHERE idFunc = 4;

select * from funcionario;

-- 8.	Excluir o seguinte registro da tabela FUNCIONARIO:
DELETE FROM funcionario WHERE idFunc = 2;
select * from funcionario;

-- 9.	Altere o valor da coluna SALARIO, na tabela FUNCIONARIO, 
-- onde IDFUNC = 3, para 2800.
UPDATE funcionario SET salario = 2800 WHERE idFunc = 3;

-- 10.	Altere a coluna FKDEPTO (tabela FUNCIONARIO) com IDFUNC = 3 para 101.
UPDATE funcionario SET fkDepto = 101 WHERE idFunc = 3;

-- 11. Altere a coluna FKDEPTO (tabela FUNCIONARIO) com IDFUNC = 3 para 107.
UPDATE funcionario SET fkDepto = 107 WHERE idFunc = 3;

-- 12.	Exibir a data de nascimento e o salário do funcionário João Silva.
SELECT datanasc FROM funcionario WHERE nomefunc = 'Joao Silva';

-- 13.	Exibir uma lista apenas dos salários de todos os funcionários.
SELECT salario FROM funcionario;

-- 14.	Exibir uma lista apenas dos salários distintos de todos os funcionários.
SELECT DISTINCT salario FROM funcionario;

-- 15.	Exibir os dados dos funcionários ordenados pelo nome.
SELECT * FROM funcionario ORDER BY nomefunc;

-- 16.	Exibir os dados dos funcionários ordenados pelo salário,
--  de forma decrescente.
SELECT * FROM funcionario ORDER BY salario DESC;

-- 17.	Exibir os dados dos funcionários que tenham
-- salário entre 2000 e 4000.
SELECT * FROM funcionario WHERE salario BETWEEN 2000 AND 4000;

-- 18.	Exibir os nomes e os salários dos funcionários
-- cujos nomes começam com a letra ‘J’.
SELECT nomefunc, salario FROM funcionario WHERE nomefunc LIKE 'J%';

-- 19.	Exibir os nomes e os salários dos funcionários
-- cujos nomes terminam com a letra ‘a’.
SELECT nomefunc, salario FROM funcionario
WHERE nomefunc LIKE '%a';

-- 20.	Exibir os nomes dos funcionários que tem a
-- letra ‘n’ como terceira letra do nome.
SELECT nomefunc FROM funcionario 
WHERE nomefunc LIKE '__n%';

-- 21.	Exibir os nomes e as datas de nascimento
-- dos funcionários cujos nomes tenham a 
-- letra ‘S’ como 5º letra de trás para frente.
SELECT nomefunc, datanasc FROM funcionario
WHERE nomefunc LIKE '%s____';

-- 22.	Exibir os dados dos funcionários que 
-- trabalham no departamento Pesquisa.
SELECT * FROM DEPARTAMENTO;
SELECT f.*, d.nomedepto FROM 
funcionario as f INNER JOIN departamento as d
ON f.fkdepto = d.iddepto
WHERE d.nomedepto = 'Pesquisa';

-- 23.	Exibir os dados dos funcionários que
-- trabalham no departamento Pesquisa e que 
-- tenham salário acima de 3500.
SELECT f.*, d.nomedepto FROM 
funcionario as f INNER JOIN departamento as d
ON f.fkdepto = d.iddepto
WHERE d.nomedepto = 'Pesquisa'
AND f.salario > 3500;

-- 24.	Exibir os dados dos funcionários 
-- que trabalham no departamento Pesquisa
-- e que tenham o nome com inicial ‘J’.
SELECT f.*, d.nomedepto FROM 
funcionario as f INNER JOIN departamento as d
ON f.fkdepto = d.iddepto
WHERE d.nomedepto = 'Pesquisa'
AND f.nomefunc LIKE 'j%';

-- 25.	Exibir o IDFUNC e o nome de cada
-- funcionário, juntamente com IDFUNC e o
-- nome do seu supervisor. Faça com que o
-- título da coluna seja “IDFUNCIONARIO”
-- para funcionário e “IDSUPERVISOR” para
-- o id do supervisor.
SELECT f.idfunc AS 'idFuncionario', f.nomefunc AS 'nomeFuncionario',
s.idfunc as 'idSupervisor', s.nomefunc AS 'nomeSupervisor' 
FROM funcionario AS f INNER JOIN funcionario AS s ON
f.fksupervisor = s.idfunc;

-- 26.	Exibir para cada projeto localizado em São Paulo,
-- o IDPROJ do projeto, o número do departamento que o controla,
-- o nome e a data de nascimento do gerente do departamento.
SELECT p.idproj, p.fkdepto AS 'Departamento', g.nomefunc AS 'Gerente',
g.datanasc AS 'Data Nasc. do Gerente'
FROM projeto AS p INNER JOIN departamento AS d ON p.fkdepto = d.iddepto
INNER JOIN funcionario AS g ON d.fkgerente = g.idfunc
WHERE p.localproj = 'São Paulo';

-- 27.	Exibir o IDFUNC e o nome do funcionário, o projeto e o nome do
-- projeto em que trabalha, e a quantidade de horas que trabalha nesse projeto.
SELECT f.idfunc, f.nomefunc, p.idProj, p.nomeproj, fp.horas
FROM funcionario AS f INNER JOIN funcproj AS fp ON f.idfunc = fp.fkfunc
INNER JOIN projeto AS p ON fp.fkproj = p.idproj;

-- 28.	Exibir o nome dos funcionários que nasceram antes de 1980.
SELECT nomefunc, datanasc FROM funcionario WHERE datanasc < '1980-01-01';

-- 29.	Exibir a quantidade de salários
-- diferentes que existem na empresa.
SELECT count(DISTINCT salario) AS 
'Quantidade de salários diferentes' 
FROM funcionario;

-- 30.	Exibir a quantidade de locais diferentes de projeto.
SELECT count(DISTINCT localproj) AS 
'Qtd. de locais diferentes de projeto' FROM projeto;

-- 31.	Exibir o salário médio da empresa e a soma dos salários.
SELECT avg(salario) AS 'Média dos Salários', sum(salario) 
AS 'Soma dos Salários' FROM funcionario;

-- 32.	Exibir o menor e o maior salário da empresa.
SELECT min(salario) AS 'Maior Salário', max(salario) 
AS 'Menor Salário' FROM funcionario;

-- 33.	Exibir o IDDEPTO, o salário médio e a soma do salário de cada 
-- departamento (agrupado por departamento).
SELECT d.iddepto, avg(f.salario) AS 'Média Salários', sum(f.salario) 
AS 'Soma Salarios' FROM departamento AS d 
INNER JOIN funcionario AS f ON d.idDepto = fkDepto GROUP BY d.iddepto;

-- 34.	Exibir o IDDEPTO, o menor e o maior salário de cada departamento 
-- (agrupado por departamento).
SELECT d.iddepto, min(f.salario) AS 'Menor Sal.', max(f.salario) AS 'Maior Sal.'
FROM departamento AS d INNER JOIN funcionario AS f 
ON d.idDepto = fkDepto GROUP BY d.iddepto;

-- 35.	Inserir mais os seguintes funcionários na tabela FUNCIONARIO:
INSERT INTO funcionario VALUES
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', null),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', null);

-- 36.	Inserir mais o seguinte departamento na tabela DEPARTAMENTO:
INSERT INTO departamento VALUES
(110, 'RH', 3, '2018-11-10');

-- 37.	Exibir os funcionários e seus departamentos correspondentes,
-- inclusive os que não estão alocados em nenhum departamento.
SELECT * FROM funcionario AS f LEFT JOIN departamento AS d ON f.fkdepto = d.iddepto;

-- 38.	Exibir os funcionários e seus departamentos correspondentes, inclusive os 
-- departamentos que não têm funcionários alocados.
SELECT * FROM departamento AS d LEFT JOIN funcionario AS f ON f.fkdepto = d.iddepto;







-- drop database Exercicio10;