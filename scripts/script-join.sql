CREATE DATABASE equipamentos;

USE equipamentos;

CREATE TABLE Sala(
	idSala INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lado CHAR(1),
    andar INT
);

CREATE TABLE Notebook (
	idNotebook INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    faculdade VARCHAR(45),
    unidade VARCHAR(45),
    patrimonio VARCHAR(45),
    siteOp1 VARCHAR(45),
    siteOP2 VARCHAR(45),
    fkSala INT,
    FOREIGN KEY (fkSala) REFERENCES Sala(idSala)
);

-- INSERT

-- JOIN renomeando tabela
SELECT * FROM Notebook as note	
	JOIN Sala ON Sala.idSala = note.fkSala;
    
-- Concatenação 
SELECT andar, lado FROM Sala;
SELECT concat(andar, lado) FROM Sala;

-- aliases
SELECT concat(andar, lado) as 'Nome Sala' FROM Sala;

