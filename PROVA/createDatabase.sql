CREATE DATABASE bdEstudio
GO

USE bdEstudio

CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1)
	, nomeAutor VARCHAR(40) NOT NULL
)
	
CREATE TABLE tbMusica(
	idMusica INT PRIMARY KEY IDENTITY(1,1)
	, nomeMusica VARCHAR(40) NOT NULL
	, duracaoMusica INT NOT NULL
	, dataComposicao DATE NOT NULL
	, valorDireitoAutoral INT NOT NULL
)

CREATE TABLE tbAutoria(
	idAutoria INT PRIMARY KEY IDENTITY(1,1)
	, idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
	, idMusica INT FOREIGN KEY REFERENCES tbMusica(idMusica)
)
