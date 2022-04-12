CREATE DATABASE Treinador;

USE Treinador;

CREATE TABLE treinador(
	idTreinador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(15),
    email VARCHAR(45),
    ax_treinador INT,
    FOREIGN KEY (ax_treinador) REFERENCES treinador(idTreinador)
)AUTO_INCREMENT = 10;

INSERT INTO treinador (nome, telefone, email, ax_treinador)VALUES
	('Rafael','11-982372190','rafael@sptech.school', 10),
    ('Franklin','11-982372190','franklin@sptech.school', 11);
    
CREATE TABLE nadador (
	idNadador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado	CHAR(2),
    dtNasc	DATE
--  fkTreinador INT,
--  FOREIGN KEY (fkTreinador) REFERENCES treinador(idTreinador)
)AUTO_INCREMENT = 100;

ALTER TABLE nadador ADD COLUMN fkTreinador INT;
ALTER TABLE nadador ADD FOREIGN KEY (fkTreinador) REFERENCES treinador(idTreinador);

INSERT INTO nadador (nome, estado, dtNasc, fkTreinador)VALUES
	('Vivian','SC','1990-09-02', 10),
    ('Vitoria','SP','2002-03-20', 11);
    
SELECT * FROM treinador;
SELECT * FROM nadador;

-- JOIN com todos os dados separadamente e usando a chave composta
SELECT novato.nome AS Treinador, experiente.nome AS Experiente, nadador.nome AS Nadador FROM treinador AS novato
JOIN treinador AS experiente ON experiente.idTreinador = novato.ax_treinador
JOIN nadador ON novato.idTreinador = nadador.fkTreinador;
