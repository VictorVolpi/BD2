USE bdEscolaIdiomas

INSERT INTO tbCurso (nomeCurso,cargahorariaCurso,valorCurso)
VALUES

	('Inglês',2000,'356')
	,('Espanhol',3000,'478')
	,('Alemão',4000,'500')
	SELECT * FROM tbCurso


INSERT INTO tbAluno(nomeAluno, rgAluno, dataNascAluno, naturalidadeAluno )
VALUES

	('Paulo Santos','82.282.122-0','10/03/2000','SP')
	,('Maria da Gloria','45.233.123-0','03/10/1999','SP')
	,('Pedro Nogeira da Silva','23.533.211-9','04/04/1998','SP')
	,('Gilson Barros Silva','34.221.111-x','09/09/1995','PE')
	,('Mariana Barbosa Santos', '54.222.122-9','10/10/2001','RJ')
	,('Alessandro Pereira', '24.402.454-9','11/10/2003','ES')
	,('Aline Melo', '88.365.012-3','08/10/2001','RJ')
	SELECT * FROM tbAluno



INSERT INTO tbTurma (nomeTurma,horarioTurma, idCurso)
VALUES

	('1IA','12:00',1)
	,('1IC','18:00',3)
	,('1IB','18:00',1)
	,('1AA','19:00',2)
	SELECT * FROM tbTurma

INSERT INTO tbMatricula (dataMatricula ,idAluno ,idTurma)
VALUES

	('03/10/2015',1,1)
	,('04/05/2014',2,1)
	,('04/05/2014',2,4)
	,('03/05/2012',3,2)
	,('03/03/2016',1,3)
	,('07/05/2015',4,2)
	,('05/07/2015',4,3)
	SELECT * FROM tbMatricula