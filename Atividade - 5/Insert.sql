USE bdLivraria

INSERT INTO tbAutor(nomeAutor)
VALUES
	('Chico Buarque')
	,('Jorge Amado')
	, ('J.K. Rowling')
	, ('William Shakespeare')
	, ('Monteiro Lobato')
	, ('Cora Coralina')
	, ('Clarice Lispector')
	SELECT * FROM tbAutor

INSERT INTO tbGenero(nomeGenero)
VALUES
	('Fic��o')
	, ('Romance')
	, ('Trag�dia')
	SELECT * FROM tbGenero

INSERT INTO tbEditora(nomeEditora)
VALUES
	('Melhoramentos')
	,('Globo')
	, ('�tica')
	, ('Companhia das Letras')
	, ('Abril')
	SELECT * FROM tbEditora

INSERT INTO tbLivro(nomeLivro, numPaginas, idGenero, idEditora, idAutor)
VALUES
	('Budapeste', 176, 2, 4, 1)
	,('O Bicho-da-Seda', 454, 2, 5, 3)
	,('Gabriela, Cravo e Canela', 214, 1, 2, 2)
	,('Reina��es de Narizinho', 143, 2, 2, 5)
	,('Romeu e Julieta', 421, 1, 3, 4)
	,('O Irm�o Alem�o', 478, 1, 4, 1)
	,('Terras do Sem-Fim', 125, 1, 3, 2)
	,('Animais Fant�sticos e Onde Habitam',	267, 2, 4, 3)
	SELECT * FROM tbLivro