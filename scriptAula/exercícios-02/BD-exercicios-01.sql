CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY auto_increment,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta VALUES 
	(null, 'Bolt', 'Atletismo', 12),
    (null, 'Marcos', 'Basquete', 3),
    (null, 'Marta', 'Futebol', 8),
    (null, 'Mateus', 'Natação', 9);
    
SELECT * FROM Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta  SET qtdMedalha = 22 WHERE idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 12 WHERE idAtleta = 2 or idAtleta = 3;

-- Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = "Felps" WHERE idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = ('1982-03-07') WHERE idAtleta = 1;

UPDATE Atleta SET dtNasc = ('1999-06-24') WHERE idAtleta = 2;

UPDATE Atleta SET dtNasc = ('1982-03-17') WHERE idAtleta = 3;

UPDATE Atleta SET dtNasc = ('1982-08-09') WHERE idAtleta = 4;

-- Excluir o atleta com o id=5;
INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
	('Rossi','Atletismo','19');
    
DELETE FROM Atleta WHERE idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM Atleta WHERE modalidade <> 'natação';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta WHERE qtdMedalha > 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY modalidade VARCHAR(60);


-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESC Atleta;

-- Limpar os dados da tabela;
TRUNCATE TABLE Atleta;