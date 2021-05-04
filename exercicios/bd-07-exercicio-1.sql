create database bd07exercicio1;
use bd07exercicio1;

-- criando tabela projeto

create table projeto(
	id_projeto int primary key auto_increment,
    nome_projeto varchar(30),
    descricao varchar(100)
);

-- criando tabela aluno
create table aluno(
	ra int,
    nome varchar(30),
    telefone char(11),
    fk_projeto int,
    fk_representante int,
    primary key(ra, fk_projeto),
    foreign key(fk_representante) references aluno(ra)
);

-- criando tabela acompanhante
create table acompanhante(
	id_acompanhante int auto_increment primary key,
    nome varchar(30),
    relacao_aluno varchar(45),
    fk_ra int,
    foreign key(fk_ra) references aluno(ra)
);

-- insert na tabela projeto
insert into projeto(nome_projeto, descricao) values
('innertec', 'monitoramento de temperatura e umidade em plantações'),
('wine control', 'monitoramento de temperatura e umidade em adegas de vinho'),
('strongberry', 'monitoramento de temperatura e umidade em plantações de morango');

select * from projeto;

desc aluno;

-- insert na tabela aluno
insert into aluno values
(22110100, 'Felpe Xavier', '11922222222', 1, null),
(22110101, 'Victor Aquino', '11933333333', 1, 22110100),
(22110102, 'Pedro Altoé', '11944444444', 1, 22110100),
(22110103, 'Cauã Benini', '11955555555', 2, 22110100),
(22110104, 'Luiz Carlos', '11966666666', 2, 22110100),
(22110105, 'Matheus Lavigne', '11977777777', 2, 22110100),
(22110106, 'Henrique Soares', '11988888888', 3, 22110100),
(22110107, 'Enzo Godoy', '11921212121', 3, 22110100),
(22110108, 'Ana Freitas', '11932323232', 3, 22110100);

select * from aluno;

-- insert na tabela acompanhante
desc acompanhante;
insert into acompanhante(nome, relacao_aluno, fk_ra) values
('Juliana Altoé', 'Irmã', 22110102),
('Isabella Godoy', 'Irmã', 22110107),
('Carlos Godoy', 'Pai', 22110107),
('Henrique Freitas', 'Irmão', 22110108);

select * from acompanhante;

-- e) exibir alunos e seus projetos correspondentes
select aluno.nome, projeto.nome_projeto from aluno, projeto where aluno.fk_projeto = projeto.id_projeto;

-- f) exibir dados dos alunos e seus acompanhantes
select aluno.nome, acompanhante.nome, acompanhante.relacao_aluno from aluno, acompanhante where aluno.ra = acompanhante.fk_ra;


desc aluno;
-- g) exibindo alunos e seus representantes
select a.nome, r.nome from aluno as a left join aluno as r on a.fk_representante = r.ra;


desc projeto;
-- h) exibindo alunos e seus projetos (mas só de um projeto específico)
select aluno.nome, projeto.nome_projeto from aluno, projeto where projeto.id_projeto = 2 and aluno.fk_projeto = projeto.id_projeto;

desc acompanhante;
-- h) exibindo alunos e seus projetos (mas só de um projeto específico)
select aluno.nome, projeto.nome_projeto, acompanhante.nome from aluno, projeto, acompanhante where aluno.fk_projeto = projeto.id_projeto and acompanhante.fk_ra = aluno.ra;

drop database bd07exercicio1;