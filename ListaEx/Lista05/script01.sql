-- Estou fazendo os comandos via CMD pois, meu MySQL está com problema.
CREATE DATABASE PetShop;

USE PetShop;

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

INSERT INTO Pet(nome, dtNasc, tipoAnimal)VALUES
    ('Magal','2019-03-17','Cachorro'),
    ('Bob','2021-12-08','Cachorro'),
    ('Mingau','2018-02-19','Gato'),
    ('Mel','2018-02-19','Gato'),
    ('Louro','2017-01-02','Passaro');

UPDATE Cliente SET fkPet = 101 WHERE idCliente = 1;
UPDATE Cliente SET fkPet = 102 WHERE idCliente = 2;
UPDATE Cliente SET fkPet = 103 WHERE idCliente = 3;
UPDATE Cliente SET fkPet = 104 WHERE idCliente = 4;
UPDATE Cliente SET fkPet = 105 WHERE idCliente = 1;

-- Esqueci de colocar as raças dos animais
UPDATE Pet SET raca = 'Labrador' WHERE idPet = 101;
UPDATE Pet SET raca = 'Pastor Alemão' WHERE idPet = 102;
UPDATE Pet SET raca = 'Siamês' WHERE idPet = 103;
UPDATE Pet SET raca = 'Persa' WHERE idPet = 104;
UPDATE Pet SET raca = 'Calopsita' WHERE idPet = 105;
    
-- Exibir todos os dados de cada tabela criada, separadamente
SELECT nome FROM Cliente;
SELECT telFixo FROM Cliente;
SELECT telCel FROM Cliente;
SELECT endereco FROM Cliente;
SELECT sobrenome FROM Cliente;

SELECT nome FROM Pet;
SELECT dtNasc FROM Pet;
SELECT tipoAnimal FROM Pet;

-- Altere o tamanho da coluna nome do cliente
ALTER TABLE Cliente MODIFY COLUMN nome VARCHAR(100);
DESC Cliente;

-- Exibir os dados de todos os pets que são de um determinado tipo 
SELECT * FROM Pet WHERE tipoAnimal = 'Cachorro';

-- Exibir apenas os nomes e as datas de nascimento dos pets.
SELECT nome, dtNasc FROM Pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome.
SELECT * FROM Pet ORDER BY nome ASC;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro.
SELECT endereco AS Endereço, CONCAT(nome, ' ',sobrenome) as Nome FROM Cliente ORDER BY endereco ASC;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra.
SELECT * FROM Pet WHERE Nome LIKE 'm%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome.
SELECT * FROM Cliente WHERE sobrenome LIKE 'Oliveira';

-- Alterar o telefone de um determinado cliente.
UPDATE Cliente SET telFixo = '55652701' WHERE idCliente = 1;

-- Exibir os dados dos clientes para verificar se alterou.
SELECT nome, telFixo FROM Cliente; 

-- Exibir os dados dos pets e dos seus respectivos donos.
SELECT CONCAT(Cliente.nome, ' ', Cliente.sobrenome) AS 'Nome Cliente', Pet.nome AS 'Nome Pet' FROM Cliente
    JOIN Pet ON Cliente.fkPet = Pet.idPet;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um
-- determinado cliente.
SELECT CONCAT (Cliente.nome, ' ', Cliente.sobrenome) AS 'Nome Cliente', Pet.nome AS 'Nome Pet', 
Pet.raca AS Raça, Cliente.telCel AS Contato FROM Cliente JOIN Pet ON Pet.idPet = Cliente.fkPet 
WHERE Cliente.idCliente = 3;

-- Excluir algum pet.
DELETE FROM Pet WHERE idPet = '101';

-- Exibir os dados dos pets para verificar se excluiu.
SELECT * FROM Pet;

-- Excluir as tabelas.
DROP TABLE Cliente;
DROP TABLE Pet;