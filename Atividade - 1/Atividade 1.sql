CREATE DATABASE bdONG

GO

USE bdONG 

CREATE TABLE tbStatus(
idStatus INT PRIMARY KEY IDENTITY(1,1)
,descStatus VARCHAR (20) NOT NULL
)

CREATE TABLE tbSexo(
idSexo INT PRIMARY KEY IDENTITY(1,1)
,descSexo VARCHAR (20) NOT NULL
)

CREATE TABLE tbCriança(
idCriança INT PRIMARY KEY IDENTITY(1,1)
,nomeCriança VARCHAR(30) NOT NULL
,dtNascCriança SMALLDATETIME NOT NULL
,idStatus INT FOREIGN KEY REFERENCES tbStatus (idStatus)
,idSexo INT FOREIGN KEY REFERENCES tbSexo (idSexo)
)

CREATE TABLE tbResponsavel(
idResponsavel INT PRIMARY KEY IDENTITY(1,1)
,nomeResponsavel VARCHAR(30) NOT NULL
,cpfResponsavel CHAR (11)NOT NULL
)

CREATE TABLE tbPadrinhoMadrinha(
idPadrinhoMadrinha INT PRIMARY KEY IDENTITY(1,1)
,nomePadrinhoMadrinha VARCHAR(30) NOT NULL
,cpfPadrinhoMadrinha CHAR (11)NOT NULL
)

CREATE TABLE tbHistorico(
idHistorico INT PRIMARY KEY IDENTITY(1,1)
,dataHistorico SMALLDATETIME NOT NULL
,idCriança INT FOREIGN KEY REFERENCES tbCriança (idCriança)
)

CREATE TABLE tbDoença(
idDoença INT PRIMARY KEY IDENTITY(1,1)
,nome VARCHAR(30) NOT NULL
,cid VARCHAR(30) NOT NULL
)


CREATE TABLE tbRegistroProntuario(
idRegistroProntuario INT PRIMARY KEY IDENTITY(1,1)
,idCriança  INT FOREIGN KEY REFERENCES tbCriança (idCriança)
,idDoença  INT FOREIGN KEY REFERENCES tbDoença (idDoença)
,dataRegistro SMALLDATETIME NOT NULL
)


CREATE TABLE tbFiliação(
idFiliação  INT PRIMARY KEY IDENTITY(1,1)
,dtFiliação  SMALLDATETIME NOT NULL
,idPadrinhoMadrinha INT FOREIGN KEY REFERENCES tbPadrinhoMadrinha (idPadrinhoMadrinha)
,idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel (idResponsavel)
,idCriança INT FOREIGN KEY REFERENCES tbCriança (idCriança)
) 

CREATE TABLE tbApadrinhamento(
idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
,idCriança INT FOREIGN KEY REFERENCES tbCriança (idCriança)
,idPadrinhoMadrinha INT FOREIGN KEY REFERENCES tbPadrinhoMadrinha (idPadrinhoMadrinha)
,dtFiliação SMALLDATETIME NOT NULL
)