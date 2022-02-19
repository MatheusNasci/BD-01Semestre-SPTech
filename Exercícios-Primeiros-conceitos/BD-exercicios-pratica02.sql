USE sprint1;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica VALUES 
	(1,'Ninja', 'Dropgun', 'Eletrônica'),
    (2,'Wake me up', 'Avicci', 'Eletrônica'),
    (3,'Eu amo você', 'Tim Maia', 'MPB'),
    (4,'Saturno', 'Burn-O', 'Trap'),
    (5,'In the name for love', 'Martin Garrix', 'Eletrônica'),
    (6,'Nego Drama', 'Racionais MC', 'Rap'),
    (7,'Ela Partiu', 'Tim Maia', 'MPB'),
    (8,'Progresso', 'Dfideliz', 'Trap');

-- Exibir todos os dados da tabela
SELECT * FROM Musica;

-- Exibir apenas os títulos e os artistas das músicas
SELECT titulo, artista FROM Musica;

-- Exibir apenas os dados das músicas de um determinado gênero
SELECT * FROM Musica WHERE genero = 'Eletronica';

-- Exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM Musica WHERE artista = 'Tim Maia';

-- Exibir os dados da tabela ordenados pelo título da música
SELECT * FROM Musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
SELECT artista, titulo, genero FROM Musica ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'e%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%a';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Musica WHERE genero LIKE '_p%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE '%c_';

-- Elimine a tabela
DROP TABLE Musica;