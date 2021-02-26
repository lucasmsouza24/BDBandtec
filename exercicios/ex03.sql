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
select * from atleta where nome like "A%";

-- f) exibindo dados de atletas cujo nome terminem com determinada letra
select * from atleta where nome like "%S";

-- g) exibindo dadosde atletas cujo nome tenha uma determinada letra em sua penúltima posição
select * from atleta where nome like "%i_";

-- h) alterando quantidade de medalhas de um atleta
update atleta set qtd_medalha = 4 where id_atleta = 1;

-- i) alterando nome e quantidade de medalhas de um atleta
update atleta set qtd_medalha = 20, nome = "Artur Zanetti" where id_atleta = 0;

-- j) exclua um atleta 
delete from atleta where id_atleta = 3;

-- k) exclua uma tabela
drop table atleta;