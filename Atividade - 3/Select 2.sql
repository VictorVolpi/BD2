USE bdEstoque

--A)Listar as descrições dos produtos ao lado do nome dos fabricantes;

SELECT idProduto, descriçãoProduto, valorProduto, nomeFabricante
	FROM tbProduto
	INNER JOIN tbFabricante
		ON tbProduto.idFabricante = tbFabricante.idFabricante  

--B)Listar as descrições dos produtos ao lado do nome dos fornecedores;

SELECT DISTINCT nomeCliente, nomeFornecedor FROM tbCliente 
	INNER JOIN tbVenda ON tbCliente.idCliente = tbVenda.idCliente
		INNER JOIN tbItensVenda ON tbVenda.idVenda = tbItensVenda.idVenda
			INNER JOIN tbProduto ON tbItensVenda.idvenda = tbProduto.idProduto
				INNER JOIN tbFornecedor ON tbProduto.idProduto = tbFornecedor.idFornecedor

--C)Listar a soma das quantidades dos produtos agrupadas pelo nome do fabricante;
	SELECT nomeFabricante ,SUM(quantidadeProduto) Total FROM tbFabricante
		INNER JOIN tbProduto ON tbFabricante.idFabricante = tbProduto.idFabricante
			GROUP BY nomeFabricante
				ORDER BY Total DESC

--D)Listar o total das vendas ao lado do nome do cliente;

	SELECT nomeCliente, SUM(valorTotalVenda) Total FROM tbCliente 
		INNER JOIN tbVenda ON tbCliente.idCliente =tbVenda.idCliente
			GROUP BY nomeCliente 
				ORDER BY Total DESC 

--E)Listar a média dos preços dos produtos agrupados pelo nome do fornecedor;

SELECT nomeFornecedor ,AVG(valorProduto) Media FROM tbFornecedor
		INNER JOIN tbProduto ON tbFornecedor.idFornecedor = tbProduto.idFornecedor
			GROUP BY nomeFornecedor
				ORDER BY Media DESC

--F)Listar todas a soma das vendas agrupadas pelo nome do cliente em ordem alfabética;

SELECT nomeCliente, SUM(valorTotalVenda) Soma FROM tbCliente
		INNER JOIN tbVenda ON tbCliente.idCliente = tbvenda.idCliente
		GROUP BY nomeCliente
		

--G)Listar a soma dos preços dos produtos agrupados pelo nome do fabricante;

	SELECT nomeFabricante ,SUM(valorProduto) Total FROM tbFabricante
		INNER JOIN tbProduto ON tbFabricante.idFabricante = tbProduto.idFabricante
			GROUP BY nomeFabricante
				ORDER BY Total DESC

--H)Listar a média dos preços dos produtos agrupados pelo nome do fornecedor;

	SELECT nomeFornecedor ,AVG(valorProduto) Media FROM tbFornecedor
		INNER JOIN tbProduto ON tbFornecedor.idFornecedor = tbProduto.idFornecedor
			GROUP BY nomeFornecedor
				ORDER BY Media DESC

--I)Listar a soma das vendas agrupadas pelo nome do produto;

SELECT descriçãoProduto, SUM(valorTotalVenda) Total FROM tbProduto
		INNER JOIN tbVenda ON tbProduto.idProduto = tbVenda.idProduto
			GROUP BY descriçãoProduto
				ORDER BY Total DESC

--J)Listar a soma das vendas pelo nome do cliente somente das vendas realizadas em fevereiro de 2014;


	SELECT nomeCliente ,SUM(valorTotalVenda) Soma FROM tbCliente
		INNER JOIN tbVenda ON tbCliente.idCliente = tbVenda.idCliente
			GROUP BY MONTH (dataVenda) = 2 AND YEAR "(dataVenda) = 2014"