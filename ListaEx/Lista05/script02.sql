CREATE DATABASE Gastos;

USE Gastos;

CREATE TABLE pessoa(
    idPessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(50),
    dtNasc DATETIME,
    profissao VARCHAR(45)
);

CREATE TABLE gasto(
    idGasto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    valor DECIMAL(10,2),
    dtGasto DATE,
    descricao VARCHAR(150)
);

-- Insira dados nas tabelas.
INSERT INTO pessoa(nome, dtNasc, profissao)VALUES
    ('Maria','2005-03-01','Estudante'),
    ('João','1989-01-09','Advogado'),
    ('Flávia','1990-06-12','Enfermera'),
    ('Aline','2000-12-19','Psicologa');

INSERT INTO gasto(dtGasto, valor, descricao) VALUES
    ('2022-04-04',12.56,'Carrefour'),
    ('2021-08-18',56.70,'MCdonalds'),
    ('2022-01-22',267.90,'Roupas'),
    ('2020-12-01',350.00,'Tenis Nike');

-- Exiba os dados de cada tabela individualmente.Exiba somente os dados de cada tabela, mas filtrando por algum dado da
-- tabela (por exemplo, as pessoas de alguma profissão, etc).
SELECT nome FROM pessoa WHERE profissao = 'Advogado';
SELECT nome, dtNasc FROM pessoa WHERE dtNasc LIKE '1%';
SELECT nome, profissao FROM pessoa WHERE nome LIKE '%A';

SELECT dtGasto FROM gasto WHERE valor LIKE '%6';
SELECT valor FROM gasto WHERE dtGasto LIKE '2020%';
SELECT valor, descricao FROM gasto WHERE valor = '56.70';

-- Adicionando FK
ALTER TABLE pessoa ADD COLUMN fkGasto INT;
ALTER TABLE pessoa ADD FOREIGN KEY (fkGasto) REFERENCES gasto(idGasto);

-- Exiba os dados das pessoas e dos seus gastos correspondentes.
UPDATE pessoa SET fkGasto = 1 WHERE idPessoa = 4;
UPDATE pessoa SET fkGasto = 2 WHERE idPessoa = 2;
UPDATE pessoa SET fkGasto = 3 WHERE idPessoa = 1;
UPDATE pessoa SET fkGasto = 4 WHERE idPessoa = 3;

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes.
SELECT pessoa.nome AS Nome, pessoa.profissao AS Profissão, gasto.dtGasto AS 'Data Gasto', CONCAT('R$ ',gasto.valor) AS Valor
    FROM pessoa JOIN gasto ON gasto.idGasto = pessoa.fkGasto;

-- Atualize valores já inseridos na tabela.
UPDATE gasto SET valor = 780.00 WHERE idGasto = 4;
UPDATE gasto SET valor = 65.22 WHERE idGasto = 1;
UPDATE gasto SET valor = 567.00 WHERE idGasto = 3;
UPDATE gasto SET valor = 150.00 WHERE idGasto = 1;

-- Exclua um ou mais registros de alguma tabela
DELETE FROM pessoa WHERE idPessoa = 3;
DELETE FROM pessoa WHERE dtNasc = '2005-03-01';