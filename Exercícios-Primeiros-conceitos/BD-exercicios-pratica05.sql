USE sprint1;

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla VARCHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO Curso VALUES 
	(1, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Marcos'),
    (2, 'Sistemas da Informação', 'SIS', 'Eduardo'),
    (3, 'Ciências da Computação', 'CCO', 'Rebeca'),
    (4, 'Engenharia da Computação', 'ECO', 'Aline');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WHERE sigla = 'ADS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT coordenador, nome, sigla FROM Curso ORDER BY coordenador;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 'A%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%S';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_N%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%A_';

-- Elimine a tabela.
DROP TABLE Curso;