CREATE DATABASE venda;

USE venda;

CREATE TABLE produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR(45),
    descricao VARCHAR(255),
    preco DECIMAL
);

CREATE TABLE cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nomeCliente VARCHAR(45),
    email VARCHAR(45),
    rua VARCHAR(45),
    numero VARCHAR(15),
    cep CHAR(8)
    fkIndicador INT,
    FOREIGN KEY (fkIndicador) REFERENCES cliente(idCliente),
);

CREATE TABLE venda (
    idVenda INT PRIMARY KEY AUTO_INCREMENT,
    valor DECIMAL,
    dtVenda DATE,
    fkCliente INT,
    FOREIGN KEY (fkCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE carrinho (
    fkProduto INT, 
    FOREIGN KEY (fkProduto) REFERENCES produto(idProduto),
    fkVenda INT,
    FOREIGN KEY (fkVenda) REFERENCES venda(idVenda),
    qtdProduto INT,
    desconto DECIMAL
);

-- descrição da tabela
DESC estoque;

INSERT INTO produto (nomeProduto, descricao, preco) VALUES
('Tênis Nike','Pra colocar no pé', 420),
('Notebook Lenovo','Nem tão novo assim', 2100),
('Trufa','Brigadeiro e ninho', 4.20),
('Lápis','Funciona bem', 2.50);

INSERT INTO cliente (fkIndicador, nomeCliente, email, rua, numero, cep) VALUES
(null,'Magal','ma@gal.com','Rua Undefined','128','06912917'),
(null,'Victor','victor@email.com','Rua Sei lá','2391','29310200'),
(null,'Vinicius','clementino@email.com','Rua nunca nem vi','18','02910000'),
(null,'Pedro','juarez@email.com','Rua quem viu mentiu','14A','11912910');