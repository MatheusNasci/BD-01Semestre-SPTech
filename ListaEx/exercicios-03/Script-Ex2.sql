USE Sprint2;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY NOT NULL auto_increment,
    titulo VARCHAR(40),
    artista VARCHAR(40)
);

CREATE TABLE Album (
	idAlbum INT PRIMARY KEY NOT NULL auto_increment,
    nome VARCHAR(40),
    tipo VARCHAR(10),
    dtLancamento DATE,
    CONSTRAINT chkTipo CHECK(tipo = 'digital' or tipo = 'físico')
) auto_increment = 100;
-- Nesse auto_increment ele vai comecar a contar o ID a partir do 100

INSERT INTO Musica (titulo, artista) VALUES
	('Sete Mares','Tim Maia'),
    ('Eu amo você','Tim Maia'),
    ('Racionais','Vida Loka Pt.2');
    
INSERT INTO Album (nome, tipo, dtLancamento) VALUES
	('Descobridor dos Sete Mares','físico','1991-03-19'),
    ('Nada como um dia após o outro','digital','2000-06-20');         

-- Exibir todos os dados das tabelas separadamente;
SELECT * FROM Album;
SELECT * FROM Musica;

-- Criar a chave estrangeira na tabela de acordo com a regra de negócio;
-- PRIMEIRO ADD CHAVE ESTRANGEIRA
ALTER TABLE Musica ADD COLUMN fkAlbum INT;
ALTER TABLE Musica ADD FOREIGN KEY (fkAlbum) REFERENCES Album (idAlbum);

-- Atualizar os álbuns de cada música;
UPDATE Musica SET fkAlbum = 100 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 100 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 101 WHERE idMusica = 3;

-- Exibir as músicas e seus respectivos álbuns;
SELECT Musica.titulo, Musica.artista, Album.nome, Album.tipo FROM Musica
	JOIN Album ON fkAlbum = idAlbum;

-- Exibir somente o título da música e o nome do seu respectivo álbum;
SELECT Musica.titulo, Album.nome FROM Musica
	JOIN Album ON fkAlbum = idAlbum;
    
-- Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo
SELECT Musica.titulo, Musica.artista, Album.nome, Album.tipo FROM Musica
	JOIN Album ON fkAlbum = idAlbum WHERE Album.nome = 'Descobridor dos Sete Mares';
