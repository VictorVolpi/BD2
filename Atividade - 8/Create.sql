create database bdEscolaIdioma 
go
use bdEscolaIdioma
create table tbAluno (
	codAluno int primary key IDENTITY (1,1)
	, nomeAluno varchar (100) not null
	, rgAluno varchar (15) not null
	, cpfAluno char (11) not null
	, logradouro varchar (100) not null
	, numero char (10) not null
	, complemento varchar (80) 
	, cep char (8) not null
	, bairro varchar (30) not null
	, cidade varchar (30) not null
	,  dataNascimento date not null
)
create table tbTelefoneAluno (
	codTelAluno int PRIMARY KEY IDENTITY (1,1)
	, numTelAluno char (11) not null
	, codAluno int FOREIGN KEY references tbAluno (codAluno)
)

create table tbCurso (
	codCurso int PRIMARY KEY IDENTITY(1,1) 
	, nomeCurso varchar (100) not null
	, valorCurso money not null
)
create table tbNivel (
	codNivel int PRIMARY KEY IDENTITY (1,1)
	, descricaoNivel varchar (100) not null
)

create table tbPeriodo (
	codPeriodo int PRIMARY KEY IDENTITY (1,1)
	, descricaoPeriodo varchar (100) not null
)

create table tbTurma(
	codTurma int PRIMARY KEY IDENTITY (1,1)
	, descricaoTurma varchar (100) not null
	, codCurso int FOREIGN KEY references tbCurso (codCurso)
	, codNivel int FOREIGN KEY references tbNivel (codNivel) 
	, codPeriodo int FOREIGN KEY references tbPeriodo (codPeriodo)
	, horario time not null
	, diaDaSemana varchar(20) not null
)

create table tbMatricula(
	codMatricula int primary key IDENTITY (1,1)
	, dataMatricula date not null
	, codAluno int FOREIGN KEY references tbAluno (codAluno)
	, codTurma int FOREIGN KEY references tbTurma (codTurma)
)