CREATE DATABASE  bdLivraria
GO
USE bdLivraria

CREATE TABLE tbEditora(
	idEditora INT PRIMARY KEY IDENTITY(1,1)
	,nomeEditora VARCHAR(50) NOT NULL
)

CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1)
	,nomeAutor VARCHAR(50) NOT NULL
)

CREATE TABLE tbGenero(
	idGenero INT PRIMARY KEY IDENTITY(1,1)
	,nomeGenero VARCHAR(50) NOT NULL
)

CREATE TABLE tbLivro(
	idLivro INT PRIMARY KEY IDENTITY(1,1)
	,nomeLivro VARCHAR(50) NOT NULL
	,numPaginas SMALLINT NOT NULL
	,idGenero INT FOREIGN KEY REFERENCES tbGenero(idGenero)
	,idEditora INT FOREIGN KEY REFERENCES tbEditora(idEditora)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
)