USE Sprint2;

CREATE TABLE Pet (
    idPet INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    dtNasc DATETIME,
    tipoAnimal VARCHAR(45),
    CONSTRAINT chkTipoAnimal CHECK(tipoAnimal IN('Cachorro','Gato','Passaro')),
    raca VARCHAR(45)
    -- auto_increment=101 vai começar a partir do número especificado
)auto_increment = 101;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    telFixo INT,
    telCel INT,
    endereco VARCHAR(100),
    fkPet INT,
    FOREIGN KEY (fkPet) REFERENCES Pet(idPet)
);


-- Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente,
-- e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
-- menos 2 clientes diferentes que tenham o mesmo sobrenome.

ALTER TABLE Cliente ADD COLUMN sobrenome VARCHAR(45);

INSERT INTO Cliente (nome, sobrenome, telFixo, telCel, endereco)VALUES
    ('Matheus','Oliveira',55202939,918239128,'Rua Gomes Carvalho - 314'),
    ('Mariana','Oliveira',55652701,912355560,'Rua Gomes Carvalho - 19'),
    ('Sarah','Rodrigues',55614623,916162731,'Avenida Brigadeiro - 203'),
    ('Vivian','Silva',56772877,911232391,'Avenidade Paulista - 2314');
    
SELECT nome FROM Cliente;
SELECT telFixo FROM Cliente;
SELECT telCel FROM Cliente;
SELECT endereco FROM Cliente;
SELECT sobrenome FROM Cliente;

SELECT nome FROM Pet;
SELECT dtNasc FROM Pet;
SELECT tipoAnimal FROM Pet;