USE bdMotorista

INSERT INTO tbMotorista (nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista ,pontuaçaoAcumulada)
VALUES

		('José dos Santos', '10/03/1970', '099.578.457-30' ,'222333444555666', '20 pontos')
		SELECT * FROM tbMotorista


INSERT INTO tbVeiculo (modeloVeiculo , placa, renavam, anoVeiculo, idMotorista)
VALUES

		('Corolla', 'EBI9545', '25555554' , '2022',1)

			SELECT * FROM tbVeiculo


INSERT INTO tbMulta (dataMulta , horaMulta, pontuaçãoMulta, idVeiculo)
VALUES

		('01/05/2021', '20:00', '20' ,1)

		SELECT * FROM tbMulta


