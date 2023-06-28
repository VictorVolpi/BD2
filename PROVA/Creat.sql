CREATE DATABASE bdMotorista

USE bdMotorista

CREATE TABLE tbMotorista(
idMotorista INT PRIMARY KEY IDENTITY (1,1)
,nomeMotorista VARCHAR (50) NOT NULL
,dataNascimentoMotorista SMALLDATETIME NOT NULL
,cpfMotorista CHAR (14) NOT NULL
,CNHMotorista CHAR (15) NOT NULL
,pontuaçaoAcumulada VARCHAR (50) NOT NULL
)

CREATE TABLE tbVeiculo(
idVeiculo INT PRIMARY KEY IDENTITY (1,1)
,modeloVeiculo VARCHAR (50) NOT NULL
,placa VARCHAR (8) NOT NULL
,renavam CHAR (10) NOT NULL
,anoVeiculo SMALLDATETIME NOT NULL
,idMotorista INT FOREIGN KEY REFERENCES tbMotorista (idMotorista)
)

CREATE TABLE tbMulta(
idMulta INT PRIMARY KEY IDENTITY (1,1)
,dataMulta SMALLDATETIME NOT NULL
,horaMulta SMALLDATETIME NOT NULL
,pontuaçãoMulta VARCHAR (50) NOT NULL
,idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo (idVeiculo)
)



