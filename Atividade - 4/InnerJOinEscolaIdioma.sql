USE bdEscolaIdiomas

 --1 Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno AS 'Nome Aluno', nomeCurso AS 'Nome Curso' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso

--2 Apresentar a quantidade de alunos matriculados por nome do curso;
	SELECT COUNT(tbAluno.idAluno)AS 'QTD de Alunos', nomeCurso FROM tbAluno
		INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
		GROUP BY nomeCurso

--3 Apresentar a quantidade de alunos matriculados por nome da turma; (CERTA)
 SELECT COUNT(tbAluno.idAluno) AS 'Qtd de Alunos Matriculados',nomeTurma FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idMatricula
	INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		GROUP BY nomeTurma


--4 Apresentar a quantidade de alunos que fizeram matricula em maio de 2016 (CERTA)
	SELECT COUNT (tbAluno.nomeAluno) AS 'Alunos Matriculados em 05/2016', dataMatricula AS 'Data Matricula' FROM tbAluno
			INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
				WHERE MONTH(dataMatricula)  = 5 AND YEAR(dataMatricula) = 2016
					GROUP BY dataMatricula



--5 Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados (CERTA)
	SELECT tbAluno.nomeAluno AS 'Aluno', nomeTurma AS 'Nome Turma', nomeCurso AS 'Nome Curso' 
		FROM tbAluno
	INNER JOIN tbMatricula 
		ON tbAluno.idAluno = tbMatricula.idAluno
			INNER JOIN tbTurma 
				ON tbMatricula.idTurma = tbTurma.idTurma
					INNER JOIN tbCurso
						ON tbTurma.idCurso = tbCurso.idCurso
							ORDER BY nomeAluno


--6 Apresentar o nome dos cursos e os horários em que eles são oferecidos (CERTA)
	SELECT nomeCurso AS 'Nome Curso',horarioTurma AS 'Horario Turma' FROM tbCurso
	INNER JOIN tbTurma ON tbCurso.idCurso = tbTurma.idCurso

--7 Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles (CERTA)
	SELECT COUNT(tbAluno.nomeAluno) AS 'qtde de alunos', naturalidadeAluno AS 'Naturalidade' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
	INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
	INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
	WHERE nomeCurso = 'Ingles' 
	GROUP BY naturalidadeAluno


--8)Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa (CERTA)
	SELECT nomeAluno,dataMatricula FROM tbAluno
INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno

--9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês (Certa)
	SELECT tbAluno.nomeAluno FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idMatricula
	INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
	INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
	WHERE nomeAluno LIKE 'A%' AND nomeCurso = 'Inglês'

--10)Apresentar a quantidade de matriculas feitas no ano de 2016 (CERTA)
	SELECT COUNT(tbMatricula.dataMatricula) AS 'Quantidade de Matriculas' FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016

--11)Apresentar a quantidade de matriculas por nome do curso (CERTA)
	SELECT COUNT(tbMatricula.idMatricula) AS 'Qtd. matrículas', nomeCurso FROM tbMatricula
	INNER JOIN tbAluno ON tbAluno.idAluno = tbMatricula.idAluno
	INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
	INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
	GROUP BY nomeCurso

--12)Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00 (CERTA)

	SELECT COUNT(tbAluno.idAluno) AS'Quantidades de Aluno' FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
		WHERE valorCurso > 300.00

--13)Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbAluno.idAluno = tbMatricula.idAluno
		INNER JOIN tbTurma ON tbMatricula.idTurma = tbTurma.idTurma
		INNER JOIN tbCurso ON tbTurma.idCurso = tbCurso.idCurso
		WHERE nomeCurso = 'Alemão'
