USE bdEstudio

INSERT INTO tbAutor(nomeAutor)
VALUES
	('Gusttavo Lima')
	, ('MC Kevin')
	, ('Marilia Mendon�a')
	, ('MC Daleste')

INSERT INTO tbMusica(nomeMusica, duracaoMusica, dataComposicao, valorDireitoAutoral)
VALUES
	('Tcheretche', 2, '15/05/2010', 200)
	, ('Cavalo de Tr�ia', 2.5, '15/05/2015', 300)
	, ('Quem eu quero n�o me quer', 2.5, '12/05/2023', 200000)
	, ('S�o Paulo', 4, '23/05/2023', 1500)
	, ('Vera Cruz', 2, '05/05/2023', 500)
	, ('Musica', 12, '05/05/2023', 600)

INSERT INTO tbAutoria(idAutor, idMusica)
VALUES
	(1, 1)
	, (2, 2)
	, (3, 3)
	, (4, 4)
	, (2, 5)


SELECT * FROM tbAutor
SELECT * FROM tbMusica
SELECT * FROM tbAutoria