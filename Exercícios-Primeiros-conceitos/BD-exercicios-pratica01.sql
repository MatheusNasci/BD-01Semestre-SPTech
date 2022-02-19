-- CRIANDO BANCO DE DADOS
CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE  Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT 
);

INSERT INTO Atleta VALUES 
	(1, 'Bolt', 'Atletismo', 12),
    (2, 'Marcos', 'Basquete', 3),
    (3, 'Marta', 'Futebol', 8),
    (4, 'Mateus', 'Natação', 9);

-- Exibir todos os dados da tabela
SELECT * FROM Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
SELECT modalidade, qtdMedalha FROM Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
SELECT * FROM Atleta WHERE modalidade = 'Atletismo';

-- Exibir os dados da tabela ordenados pela modalidade
SELECT modalidade FROM Atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
SELECT qtdMedalha FROM Atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
SELECT * FROM Atleta WHERE nome LIKE 'm%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o
SELECT * FROM Atleta WHERE nome LIKE '%t';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r
SELECT * FROM Atleta WHERE nome LIKE '%r__';

DROP TABLE Atleta;