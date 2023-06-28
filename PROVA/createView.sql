USE bdEstudio

-- Criar uma view chamada vwMusica para mostrar a quantidade de músicas ao lado do nome de seu autor
CREATE VIEW vwMusica AS
	SELECT COUNT(nomeMusica) AS 'Qtd Músicas', nomeAutor AS 'Autor'
		FROM tbMusica
			INNER JOIN tbAutoria
				ON tbMusica.idMusica = tbAutoria.idMusica
					INNER JOIN tbAutor
						ON tbAutoria.idAutor = tbAutor.idAutor
							GROUP BY nomeAutor

SELECT * FROM vwMusica

-- Usando a view anterior, criar uma nova view chamada vwMaiorCompositor para mostrar o nome do compositor
-- que compôs a maior quantidade de músicas

CREATE VIEW vwMaiorCompositor AS
	SELECT [Autor] FROM vwMusica
		WHERE [Autor] = (SELECT MAX([Autor]) FROM vwMusica)

SELECT * FROM vwMaiorCompositor

-- Criar uma view chamada vwAutoria que mostre o nome das músicas e o nome dos autores, somente das músicas
-- compostas em maio de 2023

CREATE VIEW vwAutoria AS
	SELECT nomeMusica, nomeAutor
		FROM tbMusica
			INNER JOIN tbAutoria
				ON tbMusica.idMusica = tbAutoria.idMusica
					INNER JOIN tbAutor
						ON tbAutoria.idAutor = tbAutor.idAutor
							WHERE MONTH(dataComposicao) = 5 AND YEAR(dataComposicao) = 2023

SELECT * FROM vwAutoria

-- Criar uma view chamada vwMusicaLonga que mostre o nome da música de maior duração

CREATE VIEW vwMusicaLonga AS
	SELECT nomeMusica
		FROM tbMusica
			WHERE duracaoMusica = (SELECT MAX(duracaoMusica) FROM tbMusica)

SELECT * FROM vwMusicaLonga

-- Criar uma view chamada vwGrana que mostre o nome do autor que mais faturou com direitos
-- autorais devido à autoria de músicas (valorDireitoAutoral)

CREATE VIEW vwGrana AS
	SELECT nomeAutor
		FROM tbAutor
			INNER JOIN tbAutoria
				ON tbAutor.idAutor = tbAutoria.idAutor
					INNER JOIN tbMusica
						ON tbAutoria.idMusica = tbMusica.idMusica
							WHERE valorDireitoAutoral = (SELECT MAX(valorDireitoAutoral) FROM tbMusica)

SELECT * FROM vwGrana