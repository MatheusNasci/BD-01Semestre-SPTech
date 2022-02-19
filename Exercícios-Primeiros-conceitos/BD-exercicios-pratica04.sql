-- PARA CRIAR O BANCO (CREATE DATABASE)
USE sprint1;

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor VALUES 
	(1, 'Marcos', 'Matemática', '1999-01-06'),
    (2, 'Sarah', 'BD', '2002-04-02'),
    (3, 'Igor', 'Algoritmo', '1990-07-09'),
    (4, 'Thiago', 'Socioemocional', '1992-01-01'),
    (5, 'Vivian', 'BD', '1998-05-22'),
	(6, 'Renata', 'Socioemocional', '1959-08-09');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Professor;

-- Exibir apenas as especialidades dos professores.
SELECT especialidade FROM Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM Professor WHERE especialidade LIKE 'bd';

-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT nome, especialidade, dtNasc FROM Professor ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT dtNasc, nome, especialidade FROM Professor ORDER BY dtNasc DESC;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE 's%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%n';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '_a%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%a_';

-- Elimine a tabela.
DROP TABLE Professor;

	