USE sprint1;

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY auto_increment,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica (idMusica, titulo, artista, genero) VALUES
	(null,'Eu Amo você','Tim Maia','MPB'),
    (null,'Progresso','Dfideliz','Trap'),
    (null,'Ela Partiu','Tim Maia','MPB'),
    (null,'Ninja','Dropgun','Eletrônica'),
    (null,'Rock N Roll','Skrillex','Eletrônica'),
    (null,'Nego Drama','Racionais MC','Rap');
    
SELECT * FROM Musica;


    
