CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Revista (
	IdRevista INT PRIMARY KEY auto_increment,
    nome VARCHAR(40),
    categoria VARCHAR(30)
);

INSERT INTO Revista VALUES 
	(null,'Veja', 'Jornalismo'),
    (null,'Folha SP', null),
    (null,'UOL', null),
	(null,'Época', null);
    
-- Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE Revista 
SET categoria = 'Entretenimento' WHERE  idRevista = 2;

UPDATE Revista 
SET categoria = 'Noticias' WHERE  idRevista = 3;

UPDATE Revista 
SET categoria = 'Moda' WHERE  idRevista = 4;

SELECT * FROM Revista;

-- Insira mais 3 registros completos.
INSERT INTO Revista VALUES 
	(null, 'Science', 'Noticia'),
    (null, 'Vogue', 'Moda'),
    (null, 'Saude&Vida', 'Receitas');

-- Exibir novamente os dados da tabela.
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY categoria VARCHAR(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
-- PESQUISEI 
SELECT * FROM INFORMATION_SCHEMA.COLUMNS;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD periodicidade VARCHAR(15);

-- Exibir os dados da tabela.
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;

