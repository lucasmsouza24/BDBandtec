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








-- drop database Exercicio10;