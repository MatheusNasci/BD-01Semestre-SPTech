CREATE DATABASE PraticaFuncionario;

USE PraticaFuncionario;

CREATE TABLE funcionario(
    idFuncionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45),
    telefone CHAR(9),
    salario DECIMAL(10,2), 
    CHECK (salario > 0)
);

CREATE TABLE setor(
    idSetor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nomeSetor VARCHAR(45),
    numSetor INT,
    fkFunc INT,
    FOREIGN KEY (fkFunc) REFERENCES funcionario(idFuncionario)
);

-- Criar chave composta 
CREATE TABLE acompanhante(
    idAcomp INT AUTO_INCREMENT,
    fkAcomp INT,
    PRIMARY KEY (idAcomp, fkAcomp),
    nome VARCHAR(45),
    relacao VARCHAR(45),
    dtNasc DATE,
    FOREIGN KEY (fkAcomp) REFERENCES acompanhante(idAcomp)
);

INSERT INTO funcionario(nome, telefone, salario)VALUES
    ('Magal','98564432',1500.00),
    ('Cleiton','98453213',1899.00),
    ('Jamal','91264786',2600.00),
    ('Jamal','980006543',4100.00),
    ('Maria','91212134',2350.00);

INSERT INTO setor(nomeSetor, numSetor)VALUES
    ('RH',10),
    ('Zeladoria',3),
    ('Admistrativo',12),
    ('Motorista',1);

INSERT INTO acompanhante(nome, relacao, dtNasc, fkAcomp)VALUES
    ('Matheus','Primo','2002-06-17',1),
    ('Beatriz','Esposa','1990-01-19',2),
    ('Rebeca','Namorada','1998-03-03',3),
    ('Pamela','Amiga','1980-07-17',4);


-- Atribuindo cargos
UPDATE setor SET fkFunc = 4 WHERE idSetor = 1;
UPDATE setor SET fkFunc = 1 WHERE idSetor = 2;
UPDATE setor SET fkFunc = 3 WHERE idSetor = 3;
UPDATE setor SET fkFunc = 2 WHERE idSetor = 4;
UPDATE setor SET fkFunc = 5 WHERE idSetor = 3;

-- Atribuindo convidados aos funcionarios
UPDATE funcionario SET fkAcomp = 1 WHERE idFuncionario = 1;
UPDATE funcionario SET fkAcomp = 2 WHERE idFuncionario = 2;
UPDATE funcionario SET fkAcomp = 3 WHERE idFuncionario = 3;
UPDATE funcionario SET fkAcomp = 4 WHERE idFuncionario = 4;

-- Chave Estrangeira 
ALTER TABLE funcionario ADD COLUMN fkAcomp INT;
ALTER TABLE funcionario ADD FOREIGN KEY (fkAcomp) REFERENCES acompanhante(idAcomp);

-- Exibir todos os dados de cada tabela criada, separadamente.
SELECT * FROM acompanhante;
SELECT * FROM setor;
SELECT * FROM funcionario;


--  Exibir os dados dos setores e dos seus respectivos funcionários.
SELECT setor.nomeSetor, setor.numSetor, funcionario.nome, funcionario.telefone, funcionario.salario FROM setor
 JOIN funcionario ON funcionario.idFuncionario = setor.fkFunc;

-- Exibir os dados de um determinado setor (informar o nome do setor na
-- consulta) e dos seus respectivos funcionários.
SELECT * FROM setor WHERE nomeSetor = 'RH';

-- Exibir os dados dos funcionários e de seus acompanhantes.
SELECT funcionario.nome, funcionario.telefone, funcionario.salario, acompanhante.nome, acompanhante.relacao FROM funcionario JOIN acompanhante ON funcionario.fkAcomp = acompanhante.idAcomp;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e
-- os dados de seus acompanhantes.
SELECT funcionario.nome, acompanhante.nome, acompanhante.relacao FROM funcionario 
JOIN acompanhante ON funcionario.fkAcomp = acompanhante.idAcomp WHERE funcionario.nome = 'Jamal';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus
-- acompanhantes.
SELECT funcionario.nome, setor.nomeSetor, acompanhante.nome, acompanhante.relacao FROM funcionario
JOIN acompanhante ON funcionario.fkAcomp = acompanhante.idAcomp
JOIN setor ON setor.fkFunc = funcionario.idFuncionario;