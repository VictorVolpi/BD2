USE bdConfeitariaSonho


/*
a)Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo: Ao inserir uma categoria de produto, confirmar
pelo seu nome se o mesmo ja existe no banco de dados. Nesse caso, enviar uma mensagem com essa situação ao usuario.
*/


CREATE PROCEDURE spInserirCategorias
	@nomeCategoria VARCHAR (50)
AS
	IF EXISTS(SELECT idCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoria)
		BEGIN
			PRINT ('Produto '+@nomeCategoria+' já existe!')
		END
	ELSE
		BEGIN
			INSERT  tbCategoriaProduto  (nomeCategoriaProduto) VALUES (@nomeCategoria)
	END

				--RODAR--
	EXEC spInserirCategorias 'Bolo Festa'
	EXEC spInserirCategorias 'Bolo Simples'
	EXEC spInserirCategorias 'Torta'
	EXEC spInserirCategorias 'Salgado'


	--SELECT * FROM tbcategoriaProduto--

	
/*
b)Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  deverá
 antes de inserir verificar se o nome do produto j� existe, evitando assim que um produto seja duplicado:
*/
	
CREATE PROCEDURE spInserirProdutos
	@nomeProduto VARCHAR (50)
	,@precoKiloProduto MONEY
	,@idCategoriaProduto INT
AS
	IF EXISTS (SELECT idProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
		BEGIN
			PRINT ('Produto '+@nomeProduto+' já existe!')
		END
	ELSE
		BEGIN
			INSERT tbProduto (nomeProduto,precoKiloProduto,idCategoriaProduto) VALUES (@nomeProduto, @precoKiloProduto, @idCategoriaProduto)
		END

				--RODAR--

	EXEC spInserirProdutos 'Bolo Floresta Negra', '42.0', '1'
	EXEC spInserirProdutos 'Bolo Prestigio', '43.0', '1'
	EXEC spInserirProdutos 'Bolo Nutella', '44.0', '1'
	EXEC spInserirProdutos 'Bolo Formigueiro', '17.0', '2'
	EXEC spInserirProdutos 'Bolo de cenoura', '19.0', '2'
	EXEC spInserirProdutos 'Torta de palmito', '45.0', '3'
	EXEC spInserirProdutos 'Torta de frango e catupiry', '47.0', '3'
	EXEC spInserirProdutos 'Torta de escarola', '44.0', '3'
	EXEC spInserirProdutos 'Coxinha de frango', '25.0', '4'
	EXEC spInserirProdutos 'Esfiha carne', '27.0', '4'
	EXEC spInserirProdutos 'Folhado de queijo', '31.0', '4'
	EXEC spInserirProdutos 'Risoles misto', '29.0', '4'


	--SELECT * FROM tbProduto--

/*
c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que dever�o ser feitas duas validades: 
-Verificar pelo CPF se o cliente já existe. 
Caso ja exista emitir a mensagem: Cliente cpf XXXXX já cadastrado-Verificar  se  o  cliente  �  morador  de  Itaquera  ou  Guaianases,  
pois  a  confeitaria  nâo  realiza entregas para clientes que residam 
fora desses bairros. Caso o cliente não seja morador desses bairros enviar a mensagem Não foi possivel 
cadastrar o cliente XXXX pois o bairro XXXX nao é atendido pela confeitaria
*/

CREATE PROCEDURE spInserirClientes
	@nomeCliente VARCHAR (50)
	,@dataNascimentoCliente SMALLDATETIME
	,@ruaCliente VARCHAR (100)
	,@numCasaCliente VARCHAR(5)
	,@cepCliente VARCHAR (30)
	,@bairroCliente VARCHAR (50)
	,@cidadeCliente VARCHAR (50)
	,@estadoCliente VARCHAR(50)
	,@cpfCliente VARCHAR (15)
	,@sexoCliente VARCHAR(15)

AS
	IF EXISTS (SELECT idCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		BEGIN
			PRINT ('Cliente cpf: '+@cpfCliente+' j� cadastrado!')
		END
	ELSE IF @bairroCliente LIKE '%Itaquera%' OR @bairroCliente LIKE '%Guaianases%'
		BEGIN
			INSERT tbCliente (nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
			VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
		END
	ELSE
		BEGIN
			PRINT ('N�o foi poss�vel cadastrar o cliente '+@nomeCliente+' pois o bairro '+@bairroCliente+' n�o � atendido pela confeitaria')
		END
			
											--RODAR--
			EXEC spInserirClientes 'Samira Fatah','1990-05-05','Rua Aguapei','1000','08090-000','Guaianases','São Paulo','SP','542.635.288-75','F'
			EXEC spInserirClientes 'Celia Nogueira','1992-06-06','Rua Andes','234','08.456-090','Guaianases','São Paulo','SP','240.872.006-34','F'
			EXEC spInserirClientes 'Paulo Cesar Siqueira','1984-04-04','Rua Castelo do Piaui','232','08.109-000','Itaquera','São Paulo','SP','123.456.789-30','M'
			EXEC spInserirClientes 'Rodrigo Favaroni','1991-04-09','Rua Sansão Castelo Branco','10','08.431-090','Guaianases','São Paulo','SP','321.654.987-03','M'
			EXEC spInserirClientes 'Flavia Regina Brito','1992-04-12','Rua Mariano Moro','300','08.200-123','Itaquera','São Paulo','SP','243.010.888-73','F'

			--SELECT * FROM tbCliente--
/*
d)Criar via stored procedures encomendas abaixo relacionadas, fazendo as verificaçôes abaixo:-No  momento  da  encomenda  o  cliente  irá  fornecer  o  seu  cpf.  Caso  ele  não  tenha  
sido cadastrado enviar a mensagem não foi possivel efetivar a encomenda pois o cliente xxxx n�o est� cadastrado�-Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: �Encomenda XXX para  o cliente 
YYY efetuada com sucesso, sendo que no lugar de XXX dever� aparecer o n�mero da encomenda e no YYY dever� aparecer o nome do cliente;
*/
	
CREATE PROCEDURE spInserirEncomendas
	@dataEncomenda DATE
	,@idCliente INT
	,@valorTotalEncomenda MONEY
	,@dataEntrega DATE
	,@cpfCliente  VARCHAR (15)

AS
	BEGIN	
		DECLARE @idEncomenda INT
		DECLARE @nomeCliente VARCHAR(50)

	IF EXISTS (SELECT idCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		BEGIN
			INSERT tbEncomenda (dataEncomenda, idCliente, valorTotalEncomenda, dataEntregaEncomenda) VALUES (@dataEncomenda, @idCliente, @valorTotalEncomenda, @dataEntrega)
			SET @idEncomenda = (SELECT  MAX (idEncomenda) FROM tbEncomenda)
			SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
			PRINT ('Encomenda n�'+convert(varchar(5),@idEncomenda)+' efetuada com sucesso para o cliente '+@nomeCliente+' efetuada com sucesso') 
		END
	ELSE
		BEGIN
			PRINT ('Não foi possivel efetivar a encomenda pois o cliente com o cpf: '+@cpfCliente+' não está cadastrado!')
		END
	END
									--RODAR--
		EXEC spInserirEncomendas '08/08/2015','1','450.0','15/08/2015','542.635.288-75'
		EXEC spInserirEncomendas '10/10/2015','2','200.0','15/10/2015','240.872.006-34'
		EXEC spInserirEncomendas '10/10/2015','3','150.0','10/12/2015','123.456.789-30'
		EXEC spInserirEncomendas '06/10/2015','1','250.0','12/10/2015','542.635.288-75'
		EXEC spInserirEncomendas '05/10/2015','4','150.0','12/10/2015','243.010.888-73'

		--SELECT * FROM tbEncomenda--

--e)Ao adicionar a encomenda, criar uma Storedprocedure, para que sejaminseridos os itens da encomenda
-- conforme tabela a seguir. Itens da encomenda:
CREATE PROCEDURE spInserirItensEncomenda
	@idEncomenda INT
	,@idProduto INT
	,@quantidadeKilos DECIMAL
	,@subTotal VARCHAR (40)

AS
	INSERT tbItensEncomenda (idEncomenda, idProduto, quantidadeKilos, subTotal) VALUES (@idEncomenda,@idProduto, @quantidadeKilos, @subTotal)

						--RODAR--
	EXEC spInserirItensEncomenda '1','1','2.5','105,00'
	EXEC spInserirItensEncomenda '1','10','2.6','70,00'
	EXEC spInserirItensEncomenda '1','9','6','150,00'
	EXEC spInserirItensEncomenda '1','12','4.3','125,00'
	EXEC spInserirItensEncomenda '2','9','8','200,00'
	EXEC spInserirItensEncomenda '3','11','3.2','100,00'
	EXEC spInserirItensEncomenda '3','9','2','50,00'
	EXEC spInserirItensEncomenda '4','2','3.5','150,00'
	EXEC spInserirItensEncomenda '4','3','2.2','100,00'
	EXEC spInserirItensEncomenda '5','6','3.4','150,00'

	--SELECT * FROM tbItensEncomenda--

--f)Apos todos os cadastros, criar Stored procedures para alterar o que se pede:
	CREATE PROCEDURE spAlterarPreço

	AS

--1-O preço dos produtos da categoria "Bolo festa" sofreram um aumento de 10%
	CREATE PROCEDURE spAumentaPrecoBoloFesta
AS
BEGIN
    DECLARE @categoriaProduto INT;
    
    SELECT @categoriaProduto = idCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Bolo festa';

    IF @categoriaProduto IS NULL
    BEGIN
        PRINT('Categoria "Bolo festa" não encontrada.');
        RETURN;
    END

    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.10
    WHERE idCategoriaProduto = @categoriaProduto;

    PRINT('Preço dos produtos da categoria "Bolo festa" aumentados em 10%.');
END

--2-O preço dos produtos categoria "Bolo simples" estão em promoção e termo um desconto de 20%;
CREATE PROCEDURE spDescontoBoloSimples
AS
BEGIN
    DECLARE @categoriaProduto INT;
    
    SELECT @categoriaProduto = idCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Bolo simples';

    IF @categoriaProduto IS NULL
    BEGIN
        PRINT('Categoria "Bolo simples" não encontrada.');
        RETURN;
    END

    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 0.80
    WHERE idCategoriaProduto = @categoriaProduto;

    PRINT('Preço dos produtos da categoria "Bolo simples" com desconto de 20%.');
END

--3-O preço dos produtos categoria "Torta" aumentaram 25%
CREATE PROCEDURE spAumentaPrecoTorta
AS
BEGIN
    DECLARE @categoriaProduto INT;
    
    SELECT @categoriaProduto = idCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Torta';

    IF @categoriaProduto IS NULL
    BEGIN
        PRINT('Categoria "Torta" não encontrada.');
        RETURN;
    END

    UPDATE tbProduto
    SET precoKiloProduto = precoKiloProduto * 1.25
    WHERE idCategoriaProduto = @categoriaProduto;

    PRINT('Preço dos produtos da categoria "Torta" aumentados em 25%.');
END

--4-O preço dos produtos categoria "Salgado", com exceção da esfihade carne, sofreram um aumento de 20%
CREATE PROCEDURE AumentarPrecosSalgados
AS
BEGIN
    DECLARE @categoriaProduto INT;
    
    SELECT @categoriaProduto = idCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Salgado';

    IF @categoriaProduto IS NULL
    BEGIN
        PRINT('Categoria "Salgado" não encontrada.');
        RETURN;
    END

    UPDATE tbProduto
    SET PrecoKiloProduto = PrecoKiloProduto * 1.20 -- Aumento de 20%
    WHERE idCategoriaProduto = 'Salgado' AND nomeProduto <> 'esfiha de carne';
	
    PRINT('Preço dos produtos da categoria "Salgado",menos a esfiha aumentados em 25%.');
END


--g)Criar uma procedure para excluir clientes pelo CPF sendo que:

GO
CREATE PROCEDURE spExcluirCliente
	@cpfCliente VARCHAR(15)
AS 
	DECLARE @nome VARCHAR(50) = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
	IF EXISTS (SELECT idEncomenda FROM tbEncomenda 
		INNER JOIN tbCliente ON tbCliente.idCliente = tbEncomenda.idCliente
			WHERE cpfCliente = @cpfCliente)
	BEGIN
		PRINT('Impossível remover esse cliente pois o cliente '+@nome+' possui encomendas')
	END
	ELSE
	BEGIN
		DELETE FROM tbCliente WHERE cpfCliente = @cpfCliente;
		PRINT('Cliente '+@nome+' removido com sucesso')
	END

EXEC spExcluirCliente '243.010.888-73'
EXEC spExcluirCliente '542.635.288-75'


	--SELECT * FROM tbCliente--


/* h)Criar uma procedure que permita excluir qualquer item de uma encomenda que exista. 
Para tal o cliente dever� fornecer o c�digo da encomenda e o c�digo do produto que ser� exclu�do da encomenda. 
A procedure dever� remover o item e atualizar o valor total da encomenda, do qual dever� ser subtra�do o valor do item a ser removido. 
A procedure poder� remover apenas um item da encomenda de cada vez.
*/

CREATE PROCEDURE spExcluirItemEncomenda
    @codigoEncomenda INT,
    @codigoProduto INT
AS
BEGIN
    DECLARE @valorItem DECIMAL(10, 2);
    DECLARE @valorTotalEncomenda DECIMAL(10, 2);

    IF NOT EXISTS (SELECT 1 FROM tbItensEncomenda WHERE idEncomenda = @codigoEncomenda AND idProduto = @codigoProduto)
    BEGIN
        PRINT 'O item especificado não existe nesta encomenda.';
        RETURN;
    END

    SELECT @valorItem = subTotal FROM tbItensEncomenda WHERE idEncomenda = @codigoEncomenda AND idProduto = @codigoProduto;

    UPDATE tbEncomenda
    SET valorTotalEncomenda = valorTotalEncomenda - @valorItem
    WHERE idEncomenda = @codigoEncomenda;

    DELETE FROM tbItensEncomenda
    WHERE idEncomenda = @codigoEncomenda AND idProduto = @codigoProduto;

    PRINT 'Item removido da encomenda com sucesso.';
END

--i)Criar  uma  stored  procedure  que  receba  o  cpf  de  um  cliente  e  a  data  de  entrega  de  uma encomenda e exclua essa encomenda feita para esse cliente. Para tal a stored procedure ter� que:

GO
CREATE PROCEDURE spExcluirEncomenda
	@cpfCliente CHAR(14)
	,@dataEntrega DATE
AS
	IF EXISTS (SELECT dataEntregaEncomenda FROM tbEncomenda WHERE dataEntregaEncomenda = @dataEntrega)
		BEGIN
			IF EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
				BEGIN
					DECLARE @idEncomenda INT = (SELECT idEncomenda FROM tbEncomenda
													WHERE idCliente = (SELECT idCliente FROm tbCliente WHERE cpfCliente = @cpfCliente) AND dataEntregaEncomenda = @dataEntrega)
					DELETE FROM tbItensEncomenda WHERE idEncomenda = @idEncomenda
					DELETE FROM tbEncomenda WHERE idEncomenda = @idEncomenda
					PRINT ('Encomenda excluida com sucesso')
				END
			ELSE
				PRINT ('Cliente com esse cpf nao existe')
		END
	ELSE
		PRINT ('Encomenda nao existe na data solicitada')

		--RODAR--
EXEC spExcluirEncomenda '542.635.288-75', '2015-08-08'
	--SELECT * FROM tbEncomenda--


--j)Criar uma stored procedure que receba uma data de entrega e que liste todas as encomendas e itens que dever�o ser entregues na referida data
GO
CREATE PROCEDURE spVerEntregasDia
	@dataEncomenda DATE
AS
	SELECT dataEntregaEncomenda 'Data de entrega', tbEncomenda.idEncomenda 'Codigo da encomenda', valorTotalEncomenda 'Valor total da encomenda' 
		,nomeProduto 'Nome do produto', nomeCliente 'Nome do cliente', ruaCliente 'Endereco do cliente', numCasaCliente 'Numero da casa', bairroCliente 'Bairro' FROM tbItensEncomenda
			INNER JOIN tbProduto ON tbProduto.idProduto = tbItensEncomenda.idProduto
				INNER JOIN tbEncomenda ON tbEncomenda.idEncomenda = tbItensEncomenda.idEncomenda
					INNER JOIN tbCliente ON tbEncomenda.idCliente = tbCliente.idCliente
						WHERE dataEntregaEncomenda = @dataEncomenda

EXEC spVerEntregasDia '2015-08-08'
		--SELECT * FROM tbEncomenda--

SELECT * FROM tbEncomenda
SELECT * FROM tbCliente
SELECT * FROM tbItensEncomenda
SELECT * FROM tbProduto 
SELECT * FROM tbCategoriaProduto
SELECT * FROM tbCliente