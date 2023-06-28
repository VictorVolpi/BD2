USE bdLivraria

-- a) O total de livros que começam com a letra P
SELECT COUNT(idLivro) AS 'Quantidade de livros que começam com a letra P' FROM tbLivro
	WHERE nomeLivro LIKE 'P%'

-- b) O maior número de páginas entre todos os livros -
SELECT MAX (numPaginas) AS 'Maior numero de páginas ' FROM tbLivro

-- c) O menor número de páginas entre todos os livros
SELECT MIN(numPaginas) AS 'A menor numero de páginas' FROM tbLivro

-- d) A média de páginas entre todos os livros -
SELECT AVG(numPaginas) AS 'Média de paginas' FROM tbLivro

-- e) A soma do número de páginas dos livros de editora código 1
SELECT SUM(numPaginas) AS 'Total de paginas dos livros da editora Melhoramentos' FROM tbLivro
	WHERE idEditora = 1

-- f) A soma dos números de páginas dos livros que começam com a letra A -
SELECT SUM(numPaginas) AS 'Soma das paginas que começam com A' FROM tbLivro
	WHERE nomeLivro LIKE 'A%'

-- g) A média dos números de páginas dos livros que sejam do autor código 3
SELECT AVG(numPaginas) AS 'Média do número de páginas da autora J K Rowling' FROM tbLivro
	WHERE idAutor = 3

-- h) A quantidade de livros da editora de código 4 -
SELECT COUNT(idLivro) AS 'Quantidade de livros editora 4' FROM tbLivro
	WHERE idEditora = 4

-- i) A média do número de páginas dos livros que tenham a palavra “estrela” em seu nome
SELECT AVG(numPaginas) AS 'Média do número de páginas que tenha "estrela" em seu nome' FROM tbLivro	
	WHERE nomeLivro LIKE '%estrela%'

-- j) A quantidade de livros que tenham a palavra “poema” em seu nome -
SELECT COUNT(idLivro) AS 'Livros com poema' FROM tbLivro	
	WHERE nomeLivro LIKE '%poema%'

-- k) A quantidade de livros agrupado pelo nome do gênero
SELECT nomeGenero AS 'Genero', COUNT(idLivro) AS 'Quantidade dos generos dos livros' FROM tbLivro
	RIGHT JOIN tbGenero ON tbLivro.idGenero = tbGenero.idGenero
		GROUP BY nomeGenero

-- l) A soma das páginas agrupada pelo nome do autor -
SELECT nomeAutor, SUM(numPaginas) AS 'Quantidade de paginas' FROM tbAutor
	LEFT JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
		GROUP BY nomeAutor

-- m) A média de páginas agrupada pelo nome do autor em ordem alfabética (de A a Z) (EXERCICIO 13) (EXERCICIO 13) (EXERCICIO 13) (EXERCICIO 13) (EXERCICIO 13)
SELECT nomeAutor, AVG(numPaginas) AS 'Média do número de páginas' FROM tbLivro
	RIGHT JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		GROUP BY nomeAutor
			ORDER BY nomeAutor

-- n) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A) - 
SELECT nomeEditora, COUNT(idLivro) AS 'Quantidade de livros' FROM tbEditora
	LEFT JOIN tbLivro ON tbEditora.idEditora = tbLivro.idEditora
		GROUP BY nomeEditora
			ORDER BY nomeEditora DESC

-- o) A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C” - 
SELECT nomeAutor, SUM(numPaginas) AS 'Soma do número de páginas' FROM tbLivro
	RIGHT JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE nomeAutor LIKE 'C%'
			GROUP BY nomeAutor

-- p) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT nomeAutor, COUNT(idLivro) AS 'Quantidade de livros' FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor = 'Machado de Assis' OR nomeAutor = 'Cora Coralina' OR nomeAutor = 'Graciliano Ramos' OR nomeAutor = 'Clarice Lispector'
			GROUP BY nomeAutor

-- q) A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive) -
SELECT nomeEditora, SUM(numPaginas) AS 'Soma do número de páginas' FROM tbLivro
	RIGHT JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		WHERE numPaginas BETWEEN 200 and 500
			GROUP BY nomeEditora

-- r) O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro, nomeEditora, nomeAutor FROM tbLivro
	JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor

-- s) O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras” -
SELECT nomeLivro, nomeAutor FROM tbLivro
	JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			WHERE nomeEditora = 'Cia das Letras'

-- t)  O nome dos  livros  ao  lado  dos  nomes dos  autores,  somente  dos livros que não  forem do autor “Érico Veríssimo”
SELECT nomeLivro, nomeAutor FROM tbLivro
	JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE nomeAutor != 'Érico Veríssimo'

-- u) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles autores que não tem livros cadastrados -
SELECT nomeAutor, nomeLivro FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor

-- v) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que não tem autores cadastrados
SELECT nomeAutor, nomeLivro FROM tbAutor
	RIGHT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor

-- w) O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor -
SELECT nomeAutor, nomeLivro FROM tbLivro
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor

-- x) Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT nomeLivro, nomeEditora FROM tbLivro
	CROSS JOIN tbEditora 
		WHERE nomeEditora = 'Àtica'

-- y) Somente os nomes dos autores que não tem livros cadastrados -
SELECT nomeAutor FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor
		WHERE tbLivro.idAutor IS NULL

-- z) Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero FROM tbGenero
	LEFT JOIN tbLivro ON tbLivro.idGenero = tbGenero.idGenero
		WHERE tbLivro.idGenero IS NULL