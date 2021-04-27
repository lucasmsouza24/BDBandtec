-- criando banco de dados
CREATE DATABASE ac2lucasmesquita;
USE ac2lucasmesquita;

-- criando tabela usuario
CREATE TABLE tbUsuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    dataNasc DATE NOT NULL,
    tel CHAR(11) NOT NULL,
	tel2 CHAR(11),
    email VARCHAR(45) NOT NULL,
    senha VARCHAR(45) NOT NULL
);
ALTER TABLE tbUsuario ADD COLUMN nome VARCHAR(45);

-- criando tabela endereco
CREATE TABLE tbEndereco(
	idEndereco INT AUTO_INCREMENT,
    rua VARCHAR(45) NOT NULL,
    numero VARCHAR(6) NOT NULL,
    bairro VARCHAR(45) NOT NULL,
    cep CHAR(8) NOT NULL,
    cidade VARCHAR(45) NOT NULL,
    uf CHAR(22) NOT NULL,
    fkUsuario INT,
    PRIMARY KEY(idEndereco, fkUsuario)
);


-- criando tbLivro
CREATE TABLE idLivro(
	idLivro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45) NOT NULL,
    nomeAutor VARCHAR(45),
    preco DECIMAL(6,2) CHECK(preco >= 0),
    qtdEstoque INT CHECK(qtdEstoque >= 0),
    fkLivroAntecessor INT,
    fkDono INT NOT NULL,
    FOREIGN KEY (fkDono) REFERENCES tbUsuario(idUsuario)
);
ALTER TABLE idLivro ADD FOREIGN KEY (fkLivroAntecessor)
REFERENCES idLivro(idLivro);
ALTER TABLE idLivro RENAME tbLivro;

-- criando tbVenda
CREATE TABLE tbVenda(
	idVenda INT AUTO_INCREMENT,
    fkLivro INT,
    qtd INT,
    fkVendedor INT,
    fkComprador INT,
    PRIMARY KEY (idVenda, fkLivro, fkVendedor, fkComprador)
);

-- inserindo dados na tabela usuario
INSERT INTO tbUsuario(nome, dataNasc, tel, tel2, email, senha) VALUES
('João Garcia', '1999-08-03', '11963524163', null, 'joao.garcia@gmail.com', 'jgarcia123'),
('Gabriel Toledo', '2000-03-02', '11987204876', null, 'gabriel.toledo@gmail.com', 'gtoledo123');

desc tbendereco;

-- inserindo dados na tabela tbEndereco
INSERT INTO tbEndereco(rua, numero, bairro, cep, cidade, uf, fkusuario) VALUES
('Rua Salim Farah Maluf', '105B', 'Santo Amaro', '05832150', 'São Paulo', 'SP', 1),
('Rua Procópio Ferreira', '37', 'Campo Limpo', '04323150', 'São Paulo', 'SP', 2);



-- inserindo dados na tabela tbLivro
INSERT INTO tbLivro(titulo, nomeAutor, preco, qtdEstoque, fkLivroAntecessor, fkDono) VALUES
('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 26.99, 3, null, 1),
('Harry Potter e a Câmara Secreta', 'J.K. Rowling', 26.99, 1, 1, 1);

desc tbvenda;
select * from tblivro;

-- inserindo dados da tbVenda
INSERT INTO tbVenda(fkLivro, qtd, fkVendedor, fkComprador) VALUES
(1, 1, 1, 2),
(1, 2, 1, 2),
(2, 1, 1, 2);


-- exibindo enderecos
SELECT tbUsuario.nome, tbEndereco.* FROM tbEndereco, tbUsuario WHERE tbUsuario.idUsuario = tbEndereco.fkUsuario;


-- exibindo livros cadastrasdos
SELECT l.preco, v.qtd FROM tbvenda as v, tblivro as l, tbusuario as u where l.idLivro = v.fkLivro and u.idUsuario = 2;

