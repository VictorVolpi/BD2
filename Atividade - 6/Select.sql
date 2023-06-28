USE bdLivrariaBrasileira

--1) O total de livros que começam com a letra P certo
,

-- 14) A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A) - 
SELECT nomeEditora, COUNT(idLivro) AS 'QUANTIDADE DE LIVROS' FROM tbEditora
	LEFT JOIN tbLivro ON tbEditora.idEditora = tbLivro.idEditora
		GROUP BY nomeEditora
			ORDER BY nomeEditora DESC

--15)  A  soma  de  páginas dos livros agrupados  pelo  nome  do autor  que  sejam  de  autores  cujo nome comece com a letra “C”

SELECT nomeAutor,SUM(numPaginas) AS 'SOMA DE PAGINAS' FROM tbLivro
	JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE nomeAutor != 'C%'
			GROUP BY nomeAutor


-- 16) A quantidade de livros agrupados pelo nome do autor, cujo nome do autor seja “Machado de Assis” ou “Cora Coralina” ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT nomeAutor, COUNT(idLivro) AS 'QUANTIDADE DE LIVROS' FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor
		WHERE nomeAutor = 'Machado de Assis' OR nomeAutor = 'Cora Coralina' OR nomeAutor = 'Graciliano Ramos' OR nomeAutor = 'Clarice Lispector'
			GROUP BY nomeAutor

--17) A  soma  das  páginas  dos  livros  agrupadas  pelo  nome  da  editora  cujo  número  de  páginas esteja entre 200 e 500 (inclusive)

SELECT nomeEditora AS 'Editora', SUM (numPaginas) AS 'NUMERO DE PAGINAS ' FROM tbEditora
	JOIN tbLivro ON tbEditora.idEditora = tbLivro.idEditora
	WHERE numPaginas  BETWEEN 200 AND 500
	GROUP BY nomeEditora
		

-- 18) O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro AS'NOME LIVRO', nomeEditora AS 'NOME EDITORA', nomeAutor AS 'AUTOR' FROM tbLivro
	JOIN tbEditora ON tbEditora.idEditora = tbLivro.idEditora
		JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor

--19)O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Cia das Letras”

SELECT nomeLivro AS 'NOME LIVRO' ,nomeAutor AS 'NOME AUTOR' FROM tbLivro
	JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		 JOIN tbEditora ON tbLivro.idEditora = tbEditora.idEditora
			WHERE nomeEditora != 'Cia das Letras'

-- 20)  O nome dos  livros  ao  lado  dos  nomes dos  autores,  somente  dos livros que não  forem do autor “Érico Veríssimo”
SELECT nomeLivro AS 'NOME LIVRO', nomeAutor AS 'NOME AUTOR' FROM tbLivro
	JOIN tbAutor ON tbLivro.idAutor = tbAutor.idAutor
		WHERE nomeAutor != 'Érico Veríssimo'


--21) Os  nomes dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles autores que  não tem livros cadastrados

	SELECT tbAutor.nomeAutor,tbLivro.nomeLivro FROM tbAutor
		LEFT OUTER JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor

-- 22) Os nomes dos autores ao lado dos nomes dos livros, inclusive daqueles livros que não tem autores cadastrados
SELECT nomeAutor AS 'NOME AUTOR', nomeLivro AS 'NOME LIVRO' FROM tbAutor
	RIGHT JOIN tbLivro ON tbAutor.idAutor = tbLivro.idAutor


--23) O  nome dos  autores  ao  lado  dos nomes  dos  livros,  indiferente  do  autor  ter  ou  não  livro publicado, e indiferente do livro pertencer a algum autor
	SELECT  nomeAutor AS 'NOME AUTOR', nomeLivro AS 'NOME LIVRO'  FROM tbLivro 
	FULL JOIN tbAutor ON tbAutor.idAutor = tbLivro.idAutor


-- 24) Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT nomeLivro AS 'NOME LIVRO', nomeEditora AS 'NOME EDITORA' FROM tbLivro
	CROSS JOIN tbEditora 
		WHERE nomeEditora = 'Atica'


--25)Somente os nomes dos autores que não tem livros cadastrados
SELECT nomeAutor AS 'NOME AUTOR' FROM tbAutor
	LEFT JOIN tbLivro ON tbLivro.idAutor = tbAutor.idAutor
		WHERE tbLivro.idAutor IS NULL

-- 26) Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero AS 'NOME GENERO' FROM tbGenero
	LEFT JOIN tbLivro ON tbLivro.idGenero = tbGenero.idGenero
		WHERE tbLivro.idGenero IS NULL