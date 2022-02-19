USE sprint1;

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR (40),
    diretor VARCHAR(40)
);

INSERT INTO Filme VALUES 
	(1, 'Marley e Eu', 'Romance', 'David Frankel'),
    (2, 'Homem-Aranha: Sem Volta para Casa', 'Ação', 'Jon Watts'),
    (3, 'Minha vez', 'Romance', 'Franklin Mousel'),
    (4, 'Jurassic Park', 'Ficção científica', 'Michael Crichton'),
    (5, 'A Culpa é sua', 'Romance', 'Franklin Mousel'),
    (6, 'Jurassic World', 'Ficção científica', 'Colin Trevorrow'),
    (7, 'Velozes e Furiosos 9', 'Ação', 'Justin Lin'),
    (8, '+ Velozes + Furiosos', 'Ação', 'John Singleton');
    
-- Exibir todos os dados da tabela
SELECT * FROM Filme;

-- Exibir apenas os títulos e os diretores dos filmes
SELECT titulo, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero
SELECT titulo, genero FROM Filme WHERE genero LIKE 'Romance';

-- Exibir apenas os dados dos filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor LIKE 'Franklin Mousel';

-- Exibir os dados da tabela ordenados pelo título do filme
SELECT * FROM Filme ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente
SELECT diretor FROM Filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE 'm%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra
SELECT * FROM Filme WHERE diretor LIKE '%l';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Filme WHERE genero LIKE '_i%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra
SELECT * FROM Filme WHERE titulo LIKE '%s_';

-- Elimine a tabela
DROP TABLE Filme;

