/* Revisão Aula passada
DDL - Estrutura da tabela
DML - Manipulação de dados da tabela
DCL - permissão 

CREATE DATABASE
USE
CREATE TABLE
INSERT INTO
SELECT
SELECT COM WHERE
SELECT COM WHERE E LIKE
SELECT COM ORDER BY
UPDATE nomeTabela SET nomeColuna WHERE ???;

DALETE FROM nomedaTabela WHERE ID = ???;
DROP TABLE
DESCE nomeTabela; descreve os campos da tabela

AND - PARA DUAS CONDIÇÕES
OR - UMA OU OUTRA CONDIÇÃO
*/

-- DESCREVE OS CAMPOS/ESTRUTURA DA TABELA
DESC Aluno;
DESCRIBE Aluno;
	
SELECT * FROM Aluno ORDER BY nome;

-- ALTER TABLE

USE faculdade;

-- ATUALIZA/MODIFICA A ESTRUTURA DA TABELA
CREATE TABLE Empresa (
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(100),
    responsavel VARCHAR(80)
    );
    
-- Descreva os campos/estrutura da tabela Empresa
DESC Empresa;

-- Insere alores na tabela Empresa
-- INSERT INTO nomeTabela VALUES (campp1, campo2, campo3...)
INSERT INTO Empresa VALUES (null,'C6 Bank','Paulo');

SELECT * FROM Empresa;

INSERT INTO Empresa (nome, responsavel) VALUES
	('Safra', 'Franklin');
    
-- ALTER TABLE Modifica/Altera a ESTRUTURA da tabela (não os dados - DADOS = UPDATE)
ALTER TABLE Empresa RENAME COLUMN nome TO nomeEmpresa;
DESC Empresa;
SELECT * FROM empresa;

-- INTEIRO = INT 10 DÍGITOS
-- FLOAT = FLOAT 7 DÍGITOS 32 BITS
-- DOUBLE = DOUBLE 15 DÍGITOS 64 BITS
-- DECIMAL = DECIMAL(10,2) - 28 DÍGITOS 128 BITS
-- EXEMPLO DECIMAL 1234567,89

ALTER TABLE Empresa ADD COLUMN salario DECIMAL (10,2);

-- ATUALIZAR OS SALÁRIOS DOS RESPONSÁVEIS
UPDATE Empresa SET salario = 1.50 WHERE id = 1;

ALTER TABLE Empresa DROP COLUMN salario;

ALTER TABLE Empresa MODIFY COLUMN nomeEmpresa VARCHAR(75);

-- TRUNCATE TABLE
-- LIMPA OS REGISTROS E CONFIGURAÇÕES DA TABELA

SELECT * FROM Empresa;
DELETE FROM Empresa WHERE id = 1 or id = 2;

INSERT INTO Empresa (nomeEmpresa, responsavel) VALUES
	('BandTec School', null);

-- APAGA OS DADOS DA TABELA
TRUNCATE TABLE Empresa;

ALTER TABLE Empresa ADD COLUMN dtInicio DATE;
-- SINTAXE
-- DATA ('YYYY-MM-DD');
-- DATATIME ('YYYY-MM-DD HH:MM:SS')	
-- TIME ('HH:MM:SS')

UPDATE Empresa SET dtInicio = '2016-01-01' WHERE id = 1;
