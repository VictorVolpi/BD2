CREATE DATABASE bdConfeitariaSonho

GO

USE bdConfeitariaSonho

CREATE TABLE tbCliente (
	idCliente INT PRIMARY KEY IDENTITY (1,1)
	,nomeCliente VARCHAR (50)
	,dataNascimentoCliente SMALLDATETIME
	,ruaCliente VARCHAR (100)
	,numCasaCliente VARCHAR (5)
	,cepCliente VARCHAR (30)
	,bairroCliente VARCHAR (50)
	,cidadeCliente VARCHAR (50)
	,estadoCliente VARCHAR (50)
	,cpfCliente VARCHAR (15)
	,sexoCliente VARCHAR (15)
)

CREATE TABLE tbEncomenda (
	idEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,dataEncomenda DATE
	,idCliente INT FOREIGN KEY REFERENCES tbCliente (idCliente)
	,valorTotalEncomenda MONEY
	,dataEntregaEncomenda DATE
)

CREATE TABLE tbCategoriaProduto (
	idCategoriaProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeCategoriaProduto VARCHAR (50)
)

CREATE TABLE tbProduto (
	idProduto INT PRIMARY KEY IDENTITY (1,1)
	,nomeProduto VARCHAR (50)
	,precoKiloProduto MONEY
	,idCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(idCategoriaProduto)
)

CREATE TABLE tbItensEncomenda (
	idItensEncomenda INT PRIMARY KEY IDENTITY (1,1)
	,idEncomenda INT FOREIGN KEY REFERENCES tbEncomenda(idEncomenda)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeKilos DECIMAL
	,subTotal VARCHAR(40)
)