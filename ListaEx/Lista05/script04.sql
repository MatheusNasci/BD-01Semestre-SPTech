-- Tive muita dificuldade para fazer os joins nesse Script e chave composta
CREATE DATABASE Treinador;

USE Treinador;

CREATE TABLE nadador(   
    idNadador INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome    VARCHAR(150),
    estOrigem VARCHAR(45),
    nascimento DATE
)AUTO_INCREMENT = 100;

CREATE TABLE treinador(
    idTreinador INT AUTO_INCREMENT NOT NULL,
    fkTreinadorExp INT AUTO_INCREMENT,
    PRIMARY KEY(idTreinador, fkTreinadorExp),
    nome VARCHAR(150),
    telefone CHAR(9),
    email VARCHAR(45),
    fkNadador INT,
    FOREIGN KEY (fkNadador) REFERENCES nadador(idNadador),
    FOREIGN KEY (fkTreinadorExp) REFERENCES treinador(idTreinador)
)AUTO_INCREMENT = 10;

CREATE TABLE treinadorExp(
    idTreinadorExp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(150),
    fkTreinador INT,
    FOREIGN KEY (fkTreinador) REFERENCES treinador(idTreinador)
);

INSERT INTO nadador(nome, estOrigem, nascimento)VALUES
    ('Magal','Bahia','2001-03-12'),
    ('Isabela','Espirito Santo','1999-01-30'),
    ('Sarah','São Paulo','1998-02-02'),
    ('Igor','Goias','2000-09-27');

INSERT INTO treinador(nome, telefone, email)VALUES
    ('Leandro','98271362','leandro@hotmail.com'),
    ('Vivian','91827321','vivian@hotmail.com'),
    ('Igor','92001827','igor@hotmail.com'),
    ('Mayla','98391229','mayla@hotmail.com');

INSERT INTO treinadorExp(nome)VALUES
    ('William'),
    ('Franklin'),
    ('Fernando'),
    ('Thiago');

UPDATE treinador SET fkNadador = 100 WHERE idTreinador = 10;
UPDATE treinador SET fkNadador = 101 WHERE idTreinador = 11;
UPDATE treinador SET fkNadador = 102 WHERE idTreinador = 12;
UPDATE treinador SET fkNadador = 103 WHERE idTreinador = 13;

ALTER TABLE treinador ADD COLUMN fkTreinadorExp INT;
-- ALTER TABLE treinador ADD PRIMARY KEY (fkTreinadorExp);

UPDATE treinador SET fkTreinadorExp = 10 WHERE idTreinador = 10;
UPDATE treinador SET fkTreinadorExp = 11 WHERE idTreinador = 11;
UPDATE treinador SET fkTreinadorExp = 12 WHERE idTreinador = 12;
UPDATE treinador SET fkTreinadorExp = 13 WHERE idTreinador = 13;

-- Exibir todos os dados de cada tabela criada, separadamente3
SELECT nome FROM nadador;3
SELECT estOrigem AS 'Estado de Origem' FROM nadador;
SELECT nascimento FROM nadador;

SELECT nome FROM treinador;
SELECT telefone FROM treinador;
SELECT email FROM treinador;

SELECT nome FROM treinadorExp;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
SELECT treinador.nome AS Treinador, nadador.nome AS Aluno, nadador.estOrigem AS 'Estado de Origem' FROM treinador 
JOIN nadador ON treinador.fkNadador = nadador.idNadador;

-- Exibir os dados de um determinado treinador (informar o nome do treinador na
-- consulta) e os dados de seus respectivos nadadores.
SELECT treinador.nome AS Treinador, nadador.nome AS Aluno, nadador.estOrigem AS 'Estado de Origem' FROM treinador 
JOIN nadador ON treinador.fkNadador = nadador.idNadador WHERE treinador.nome = 'Igor';

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores.
SELECT treinador.nome AS Treinador, treinadorExp.nome AS 'Treinador Orientador' FROM treinador
JOIN treinadorExp ON treinadorExp.idTreinadorExp = treinador.fkTreinadorExp;


-- Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o
-- nome do treinador na consulta).
SELECT treinador.nome AS Treinador, treinadorExp.nome AS 'Treinador Orientador' FROM treinador
JOIN treinadorExp ON treinadorExp.idTreinadorExp = treinador.fkTreinadorExp WHERE treinadorExp.nome = 'William';


-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados
-- dos respectivos treinadores orientadores.
SELECT treinador.nome, treinadorExp.nome, nadador.nome FROM treinador
JOIN nadador ON nadador.idNadador = nadador.fkNadador
JOIN treinadorExp ON treinadorExp.idTreinadorExp = treinador.fkTreinadorExp;


-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos
-- respectivos nadadores e os dados do seu treinador orientador.
SELECT treinador.nome AS Treinador, treinadorExp.nome AS 'Treinador Orientador' FROM treinador
JOIN nadador ON treinador.fkNadador = nadador.idNadador
JOIN treinadorExp ON treinadorExp.idTreinadorExp = treinador.fkTreinadorExp WHERE treinadorExp.nome = 'William';