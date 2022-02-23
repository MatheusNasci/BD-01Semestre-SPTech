-- CRIAR O BANCO DE DADOS
CREATE DATABASE faculdade;

-- USAR O BANCO DE DADOS
USE faculdade;

-- CRIAR A TABELA ALUNO
CREATE TABLE Aluno (
-- REGRA DE NEGÓCIO, 
-- NORMALMENTE A CHAVE PRIMÁRIO É DO TIPO INT(INTEIRO)
ra CHAR(8) PRIMARY KEY,
nome VARCHAR(100),
bairro VARCHAR(50),
email VARCHAR(60)
);

-- EXIBIR A TABELA ALUNO
SELECT * FROM Aluno;

-- INSERIR DADOS NA TABELA ALUNO
INSERT INTO Aluno VALUES 
	('01221031', 'Maciel', 'Pirituba', 'maciel@sptech.school');
    
-- EXIBIR A TABELA ALUNO
SELECT * FROM Aluno;

-- INSERIR VÁRIOS ALUNOS NO MESMO COMANDO
INSERT INTO Aluno VALUES 
	('01221141', 'Matheus', 'Paraíso', 'matheus@sptech.school'),
    ('01221116', 'Yuri', 'Vila Alpina', 'yuri@sptech.school'),
    ('01221117', 'Nildo', 'Consolação', 'nildo@sptech.school');
    
-- EXIBIR A TABELA ALUNO
SELECT * FROM Aluno;

-- EXIBIR OS DADOS DOS ALUNOS EM ORDEM CRESCENTE, PELO NOME
SELECT * FROM Aluno ORDER BY nome;

-- EXIBIR OS DADOS COM OS CAMPOS ALTERNADOS
SELECT ra, nome, bairro, email FROM Aluno;
SELECT ra, nome, email, bairro FROM Aluno;

-- EXIBIR O BAIRRO DOS ALUNOS ORDENADOS PELO NOME
SELECT bairro FROM Aluno ORDER BY nome;

-- ORDEM DECRESCENTE
SELECT * FROM Aluno ORDER BY nome DESC;
SELECT * FROM Aluno ORDER BY ra DESC;

-- EXIBIR APENAS OS DADOS DO ALUNO Matheus
SELECT * FROM Aluno WHERE nome = 'Matheus';
SELECT * FROM Aluno WHERE ra = '01221141';
SELECT * FROM Aluno WHERE bairro = 'Paraíso';
SELECT * FROM Aluno WHERE email = 'matheus@sptech.school';

-- EXIBIR OS NOMES QUE TERMINAM COM s
SELECT nome FROM Aluno WHERE nome LIKE '%s';
SELECT nome FROM Aluno WHERE nome LIKE 'Y%';
SELECT nome FROM Aluno WHERE nome LIKE '%u%';
SELECT nome FROM Aluno WHERE nome LIKE '_u%';
SELECT nome FROM Aluno WHERE nome LIKE '%l_';

INSERT INTO Aluno VALUES ('01221999', 'Samuel', null, null);

-- ATUALIZAR O BAIRRO DO SAMUEL
UPDATE Aluno SET bairro = 'Centro' WHERE ra = '01221999';
SELECT * FROM Aluno;
update Aluno set email = 'samuel@sptech.school' where
 ra = '01221999';
 
-- EXCLUIR O ALUNO NILDÃO
DELETE FROM Aluno WHERE ra = '01221117'; 

-- EXCLUIR A TABELA ALUNO
-- DROP TABLE Aluno;