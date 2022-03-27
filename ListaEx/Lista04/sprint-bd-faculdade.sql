USE Sprint1;

CREATE TABLE curso (
	idCurso INT PRIMARY KEY NOT NULL auto_increment,
    nome VARCHAR(50),
    sigla CHAR(3)	
);

INSERT INTO curso(nome, sigla) 
	VALUES	('Analise e Desenvolvimento de Sistemas','ADS'),
			('Ciências da Computação','CCO'),
            ('Sistema da Informação','SIS');
            
CREATE TABLE faculdade (
	idFaculdade INT PRIMARY KEY NOT NULL auto_increment,
    nome VARCHAR(40),
    endereco VARCHAR(45),
    unidade VARCHAR(30)
);

INSERT INTO faculdade(nome, endereco, unidade) VALUES
	('SPTech School','R. Haddock Lobo','Consolação'),
	('FAM',' R. Augusta','Consolação'),
	('FIAP','Av. Paulista','Paulista');

ALTER TABLE faculdade ADD COLUMN fkCurso INT;
ALTER TABLE faculdade ADD FOREIGN KEY (fkCurso) REFERENCES curso(idCurso);

UPDATE faculdade SET fkCurso = 1 WHERE idFaculdade = 2;
UPDATE faculdade SET fkCurso = 3 WHERE idFaculdade = 1;
UPDATE faculdade SET fkCurso = 2 WHERE idFaculdade = 3;

SELECT * FROM faculdade;
SELECT * FROM curso;

SELECT faculdade.nome AS Faculdade, concat(faculdade.endereco, ' - ', faculdade.unidade) 
AS 'Endereço', concat(curso.nome, ' - ' ,curso.sigla) AS 'Cursos disponíveis'
	FROM faculdade JOIN curso ON curso.idCurso = faculdadOe.fkCurso;

ALTER TABLE faculdade ADD CHECK (sigla = 'ADS' OR sigla = 'SIS' OR sigla = 'CCO');

-- EXCLUIR Constrait
ALTER TABLE faculdade DROP CHEC;
	