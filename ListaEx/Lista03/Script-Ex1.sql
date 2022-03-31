CREATE DATABASE Sprint2;

USE Sprint2;

CREATE TABLE Atleta(
	idAtleta INT PRIMARY KEY NOT NULL auto_increment,
	nome VARCHAR(40),
	modalidade VARCHAR(40),
	qtdMedalha INT
);

INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
	('Matheus','Atletismo',4),
	('Galdino','Atletismo',2),
	('Yuri','Futsal',9),
	('Gabriela','Natação',9),
	('Paulo','Basquete',2);
    
SELECT * FROM Atleta;
	
CREATE TABLE Pais(
	idPais INT PRIMARY KEY NOT NULL auto_increment,
	nome VARCHAR(30),
	capital VARCHAR(40)
);
	
INSERT INTO Pais (nome, capital) VALUES
	('Brasil','Brasilia'),
	('Alemanha','Berlim'),
	('Egito','Cairo'),
	('Espanha','Madrid');
    
SELECT * FROM Pais;

-- Criar a chave estrangeira na tabela correspondente conforme modelagem
ALTER TABLE Atleta ADD COLUMN fkPais INT;
ALTER TABLE Atleta ADD FOREIGN KEY (fkPais) REFERENCES Pais (idPais);

-- Atualizar o país de todos os atletas
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 1;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 5;

-- Exibir os atletas e seu respectivo país
SELECT * FROM Atleta;

-- Exibir apenas o nome do atleta e o nome do respectivo país
SELECT Atleta.nome, Pais.nome FROM Atleta 
	JOIN Pais on idPais = Atleta.fkPais;
    
-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;

SELECT Atleta.nome, Pais.nome, Pais.capital FROM Atleta 
	JOIN Pais ON idPais = Atleta.fkPais WHERE Pais.capital = 'Madrid';
	
