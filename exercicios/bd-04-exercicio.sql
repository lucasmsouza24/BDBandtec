-- Exercício 2 - Banco de Dados Música
use musica;

-- a) Exibir os dados das músicas cujo id_musica seja diferente de 2 valores, como 2 e 5 por exemplo
SELECT * from musica WHERE id_musica <> 2 AND id_musica <> 5;

-- b) Exibir os dados da tabela ordenados pelo título da música
SELECT * FROM musica order by titulo;

-- c) Exibir os dados da tabela ordenados inversamente pelo nome do artista
SELECT * from musica order by artista DESC;

-- d) Exibir os dados da tabela cujo o título comece com uma determinada letra
SELECT * FROM musica WHERE titulo LIKE 'S%';

-- e) Exibir os dados da tabela cujo artista termine com uma determinada letra
SELECT * FROM musica WHERE artista LIKE '%s';

-- f) Exibir os dados das músicas cujo gênero tenha uma determinada segunda letra
SELECT * FROM musica WHERE genero LIKE '_n%';

-- g) Exibir os dados das músicas cujo título tenha como penúltima letra uma determinada letra .
SELECT * FROM musica WHERE titulo LIKE '%e_';

-- h) Altere o gênero de uma música
UPDATE musica SET genero = 'Indie Pop / Indie Rock' WHERE id_musica = 0;

-- i) Altere o nome do artista e o gênero de uma música
UPDATE musica SET artista = 'SIAMÉS', genero = 'Indie Pop / Eletronic Pop' WHERE id_musica = 1;

-- j) Exclua uma música da tabela
DELETE FROM musica WHERE id_musica = 10;

-- k) Elimine a tabela
DROP TABLE musica;