CREATE DATABASE Sprint1;

USE Sprint1;

CREATE TABLE professor (
	idProfessor INT PRIMARY KEY NOT NULL auto_increment,
    nome VARCHAR(50),
    sobrenome VARCHAR(30),
    especialidade1 VARCHAR(40),
	especialidade2 VARCHAR(40),
    fkDisciplina INT,
    FOREIGN KEY (fkDisciplina) REFERENCES disciplina(idDisc)
);

INSERT INTO professor (nome, sobrenome, especialidade1, especialidade2) VALUES
	('Marcos','Chaves','Ciências','Literatura'),
    ('Gabriel','Vidal','Matemática',' História'),
    ('Sarah','Rodrigues','Literatura','Português'),
    ('Matheus','Alves','Matemática','Algoritmo'),
    ('Jeferson','Silva','Algoritmo','Banco de Dados'),
    ('Paulo','Silva','Física','Ed. Física');
    
CREATE TABLE disciplina (
	idDisc INT PRIMARY KEY NOT NULL auto_increment,
    nomeDisciplina VARCHAR(45)
);

INSERT INTO disciplina (nomeDisciplina)VALUES
	('Algoritmo'),
    ('Banco de Dados'),
    ('Socio-Emocional');
    
SELECT * FROM disciplina;
SELECT * FROM professor;

UPDATE professor SET fkDisciplina = 1 WHERE idProfessor = 1;
UPDATE professor SET fkDisciplina = 2 WHERE idProfessor = 2;
UPDATE professor SET fkDisciplina = 3 WHERE idProfessor = 3;
UPDATE professor SET fkDisciplina = 3 WHERE idProfessor = 4;
UPDATE professor SET fkDisciplina = 1 WHERE idProfessor = 5;
UPDATE professor SET fkDisciplina = 2 WHERE idProfessor = 6;

SELECT concat (professor.nome, ' ' ,professor.sobrenome) as Nome, concat(professor.especialidade1, ', ',
 professor.especialidade2) as Especialidades, disciplina.nomeDisciplina as 'Disc. Responsável' FROM professor
 JOIN disciplina ON professor.fkDisciplina = disciplina.idDisc;
 
 SELECT professor.nome as Nome, disciplina.nomeDisciplina as Disciplina FROM disciplina
	JOIN professor ON professor.fkDisciplina = disciplina.idDisc;
    
SELECT professor.nome as Nome, professor.especialidade1 as Especialidade, 
disciplina.nomeDisciplina as Disciplina FROM professor
	JOIN disciplina ON disciplina.idDisc = professor.fkDisciplina 
    WHERE nome = 'Paulo';

