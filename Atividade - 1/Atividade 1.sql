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

CREATE TABLE tbCrian�a(
idCrian�a INT PRIMARY KEY IDENTITY(1,1)
,nomeCrian�a VARCHAR(30) NOT NULL
,dtNascCrian�a SMALLDATETIME NOT NULL
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
,idCrian�a INT FOREIGN KEY REFERENCES tbCrian�a (idCrian�a)
)

CREATE TABLE tbDoen�a(
idDoen�a INT PRIMARY KEY IDENTITY(1,1)
,nome VARCHAR(30) NOT NULL
,cid VARCHAR(30) NOT NULL
)


CREATE TABLE tbRegistroProntuario(
idRegistroProntuario INT PRIMARY KEY IDENTITY(1,1)
,idCrian�a  INT FOREIGN KEY REFERENCES tbCrian�a (idCrian�a)
,idDoen�a  INT FOREIGN KEY REFERENCES tbDoen�a (idDoen�a)
,dataRegistro SMALLDATETIME NOT NULL
)


CREATE TABLE tbFilia��o(
idFilia��o  INT PRIMARY KEY IDENTITY(1,1)
,dtFilia��o  SMALLDATETIME NOT NULL
,idPadrinhoMadrinha INT FOREIGN KEY REFERENCES tbPadrinhoMadrinha (idPadrinhoMadrinha)
,idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel (idResponsavel)
,idCrian�a INT FOREIGN KEY REFERENCES tbCrian�a (idCrian�a)
) 

CREATE TABLE tbApadrinhamento(
idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
,idCrian�a INT FOREIGN KEY REFERENCES tbCrian�a (idCrian�a)
,idPadrinhoMadrinha INT FOREIGN KEY REFERENCES tbPadrinhoMadrinha (idPadrinhoMadrinha)
,dtFilia��o SMALLDATETIME NOT NULL
)