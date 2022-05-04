CREATE DATABASE Sprint3;

USE Sprint3;

CREATE TABLE aluno (
    ra INT PRIMARY KEY AUTO_INCREMENT,
    nomeAluno VARCHAR(45)
);ALTER TABLE aluno WHERE ra INT PRIMARY KEY AUTO_INCREMENT = 50000;

CREATE TABLE curso (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nomeCurso VARCHAR(45)
)AUTO_INCREMENT = 100;

CREATE TABLE matricula (
    cod INT AUTO_INCREMENT,
    fkRA INT,
    FOREIGN KEY (fkRA) REFERENCES aluno(ra),
    fkCurso INT,
    FOREIGN KEY (fkCurso) REFERENCES curso(idCurso),
    PRIMARY KEY (cod, fkRA, fkCurso),
    dtInicio DATE,
    nivel CHAR(2)
);

--  inserindo dados dos alunos
INSERT INTO aluno VALUES 
    (null, 'Maciel'),
    (null, 'Mayla'),
    (null, 'Elissandra');

INSERT INTO curso VALUES 
    (null , 'Inglês'),
    (null ,'Espanhol'),
    (null ,'Mandarim');

INSERT INTO matricula VALUES 
    (null, 1, 100, '2022-01-20', 'B1'),
    (null, 1, 101, '2022-01-10', 'A1'),
    (null, 2, 100, '2022-02-20', 'B1'),
    (null, 3, 102, '2022-01-15', 'I3');

SELECT * FROM aluno;
-- +----+------------+
-- | ra | nomeAluno  |
-- +----+------------+
-- |  1 | Maciel     |
-- |  2 | Mayla      |
-- |  3 | Elissandra |
-- +----+------------+

SELECT * FROM curso;
-- +---------+-----------+
-- | idCurso | nomeCurso |
-- +---------+-----------+
-- |     100 | Inglês    |
-- |     101 | Espanhol  |
-- |     102 | Mandarim  |
-- +---------+-----------+

SELECT * FROM matricula;
-- +-----+------+---------+------------+-------+
-- | cod | fkRA | fkCurso | dtInicio   | nivel |
-- +-----+------+---------+------------+-------+
-- |  18 |    1 |     100 | 2022-01-20 | B1    |
-- |  19 |    1 |     101 | 2022-01-10 | A1    |
-- |  20 |    2 |     100 | 2022-02-20 | B1    |
-- |  21 |    3 |     102 | 2022-01-15 | I3    |
-- +-----+------+---------+------------+-------+

-- JOIN
SELECT aluno.ra AS RA,
aluno.nomeAluno AS Nome,
curso.nomeCurso AS Curso, FROM  
JOIN


-- FUNÇÕES MATEMÁTICAS
ALTER TABLE matricula ADD nota DOUBLE;

DESC matricula;
-- +----------+---------+------+-----+---------+----------------+
-- | Field    | Type    | Null | Key | Default | Extra          |
-- +----------+---------+------+-----+---------+----------------+
-- | cod      | int     | NO   | PRI | NULL    | auto_increment |
-- | fkRA     | int     | NO   | PRI | NULL    |                |
-- | fkCurso  | int     | NO   | PRI | NULL    |                |
-- | dtInicio | date    | YES  |     | NULL    |                |
-- | nivel    | char(2) | YES  |     | NULL    |                |
-- | nota     | double  | YES  |     | NULL    |                |
-- +----------+---------+------+-----+---------+----------------+

UPDATE matricula SET nota = 7.9 WHERE cod = 18;
UPDATE matricula SET nota = 9.2 WHERE cod = 19;
UPDATE matricula SET nota = 8.5 WHERE cod = 20;
UPDATE matricula SET nota = 8 WHERE cod = 21;

SELECT * FROM matricula;
-- +-----+------+---------+------------+-------+------+
-- | cod | fkRA | fkCurso | dtInicio   | nivel | nota |
-- +-----+------+---------+------------+-------+------+
-- |  18 |    1 |     100 | 2022-01-20 | B1    |  7.9 |
-- |  19 |    1 |     101 | 2022-01-10 | A1    |  9.2 |
-- |  20 |    2 |     100 | 2022-02-20 | B1    |  8.5 |
-- |  21 |    3 |     102 | 2022-01-15 | I3    |    8 |
-- +-----+------+---------+------------+-------+------+

-- CONTA AS COLUNAS
SELECT count(nivel) from matricula;
-- +--------------+
-- | count(nivel) |
-- +--------------+
-- |            4 |
-- +--------------+

-- SOMA DAS NOTAS
SELECT sum(nota) FROM matricula;
-- +-----------+
-- | sum(nota) |
-- +-----------+
-- |      33.6 |
-- +-----------+

-- MEDIA - AVERAGE
SELECT avg(nota) FROM matricula;
-- +-----------+
-- | avg(nota) |
-- +-----------+
-- |       8.4 |
-- +-----------+

-- MINIMA E MÁXIMA
SELECT min(nota), max(nota) FROM matricula;
-- +-----------+-----------+
-- | min(nota) | max(nota) |
-- +-----------+-----------+
-- |       7.9 |       9.2 |
-- +-----------+-----------+

-- ARREDONDAR - ROUND
SELECT round(avg(nota),2), avg(nota) from matricula;
-- +--------------------+-----------+
-- | round(avg(nota),2) | avg(nota) |
-- +--------------------+-----------+
-- |                8.4 |       8.4 |
-- +--------------------+-----------+

-- TRUNCATE
SELECT truncate(avg(nota),2) FROM matricula;
-- +-----------------------+
-- | truncate(avg(nota),2) |
-- +-----------------------+
-- |                   8.4 |
-- +-----------------------+

-- SOMA DAS NOTAS AGRUPADOS POR ALUNOS
SELECT nomeAluno, sum(nota) FROM aluno JOIN matricula
    ON ra = fkRA GROUP BY nomeAluno;
-- +------------+-----------+
-- | nomeAluno  | sum(nota) |
-- +------------+-----------+
-- | Maciel     |      17.1 |
-- | Mayla      |       8.5 |
-- | Elissandra |         8 |
-- +------------+-----------+