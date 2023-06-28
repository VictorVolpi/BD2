USE bdMotorista

--a) Obter a quantidade de multas aplicadas por nome do motorista

SELECT nomeMotorista, COUNT(idMulta) FROM tbMotorista 
	INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista
		INNER JOIN tbMulta ON tbVeiculo.idVeiculo = tbMulta.idVeiculo 
				GROUP BY nomeMotorista


--b) Obter as placas dos veículos ao lado do nome dos motoristas

	SELECT nomeMotorista, placa FROM tbMotorista 
		INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista 
		ORDER BY nomeMotorista

--c) Obter a quantidade de carros pelo cpf do motorista

SELECT cpfMotorista, COUNT(idVeiculo) FROM tbMotorista 
	INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista 
		GROUP BY nomeMotorista

--D) Apresentar o nome dos motoristas que tomaram multas de 7 pontos em março de 2022

SELECT nomeMotorista, pontuaçãoMulta FROM tbMotorista 
	INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista 
		INNER JOIN tbMulta ON tbVeiculo.idVeiculo = tbMulta.idVeiculo 
			WHERE pontuaçãoMulta= 7 AND dataMulta BETWEEN '01/03/2021' AND '31/03/2021' 
			ORDER BY nomeMotorista

-- E)Todas as multas do motorista de cpf '123.456.789-00
	SELECT cpfMotorista, idMulta FROM tbMotorista
		INNER JOIN tbVeiculo ON tbMotorista.idMotorista = tbVeiculo.idMotorista
			INNER JOIN tbMulta ON tbVeiculo.idVeiculo = tbMulta.idVeiculo
				WHERE cpfMotorista= '123.456.789-00'



