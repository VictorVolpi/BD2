CREATE DATABASE bdUniversidade

USE bdUniversidade

CREATE TABLE tbProfessor (
	idProfessor INT PRIMARY KEY IDENTITY(1,1)
	,nomeProfessor VARCHAR(30) NOT NULL
	,cpfAluno CHAR (11) NOT NULL
	,dtNascProfessor SMALLDATETIME NOT NULL

)

CREATE TABLE tbDisciplina (
	idDisciplina INT PRIMARY KEY IDENTITY(1,1)
	,nomeDisciplina VARCHAR(50) NOT NULL
	,cargaHorariaDisciplina TIME NOT NULL
)

CREATE TABLE tbCampus (
	idCampus INT PRIMARY KEY IDENTITY(1,1)
	,nomeCampus VARCHAR(30) NOT NULL
)

CREATE TABLE tbCurso (
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(35) NOT NULL
)

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(30) NOT NULL
	,cpfAluno CHAR (11) NOT NULL
	,rgAluno CHAR (9) NOT NULL
	,logradouroAluno VARCHAR (50) NOT NULL
	,cepAluno VARCHAR (50) NOT NULL
	,sexoAluno VARCHAR (10) NOT NULL
	,cidadeALuno VARCHAR (50) NOT NULL
	,estadoALuno VARCHAR (50) NOT NULL
	,dtNascAluno SMALLDATETIME NOT NULL
) 

CREATE TABLE tbTurma (
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	,anoFormacao DATE NOT NULL
	,numSala VARCHAR(2) NOT NULL
	,semestre CHAR(2) NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	,idCampus INT FOREIGN KEY REFERENCES tbCampus(idCampus)
	,idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina (idDisciplina) 
)

CREATE TABLE tbMatricula (
	idMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dtMatricula DATE NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)

CREATE TABLE tbAtribuicao (
	idAtribuicao INT PRIMARY KEY IDENTITY(1,1)
	,idProfessor INT FOREIGN KEY REFERENCES tbProfessor(idProfessor)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
	,idDisciplina INT FOREIGN KEY REFERENCES tbDisciplina(idDisciplina)
)

CREATE TABLE tbFoneAluno(
idFoneAluno INT PRIMARY KEY IDENTITY(1,1)
,numFoneAluno VARCHAR (30) NOT NULL
,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
)