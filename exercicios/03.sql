-- exercício 1

-- selecionando banco de dados
use atleta;

-- a) exibindo dados de todos os atletas cujo id seja diferente de um determinado valor
select * from atleta where id_atleta <> 1;

-- b) exibindo dados dos atletas, ordenados pela modalidade
select * from atleta order by modalidade;

-- c) exibindo dados dos atletas, ordenado inversamente pela quantidade de medalhas
select * from atleta order by qtd_medalha desc;

-- d) exibindo dados dos atletas cujo nome contenha uma determinada letra
select * from atleta where nome like "%h%";

-- e) exibindo dados de atletas cujo nome comecem com uma determinada letra
select * from atleta where nome like "";

select * from atleta;
