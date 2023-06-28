--DROP DATABASE bdEscolaIdiomas

CREATE DATABASE bdEscolaIdiomas 

GO

 USE bdEscolaIdiomas

 CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY (1,1)
	,nomeCurso VARCHAR  (30) NOT NULL
	,cargahorariaCurso SMALLDATETIME NOT NULL
	,valorCurso SMALLMONEY NOT NULL
)

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR (100) NOT NULL
	,rgAluno CHAR (12)NOT NULL
	,naturalidadeAluno VARCHAR (50) NOT NULL
	,dataNascAluno SMALLDATETIME
)

CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY (1,1)
	,nomeTurma VARCHAR (50) NOT NULL
	,horarioTurma SMALLDATETIME NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCurso (idCurso)
)

CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula SMALLDATETIME NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)