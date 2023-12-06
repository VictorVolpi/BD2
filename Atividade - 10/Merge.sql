USE bdEtecMerge


--TURMA 2A
MERGE tb3 AS dest
	USING (
		SELECT rmAluno, nomeAluno, statusAluno
			FROM tb2A
				WHERE statusAluno = 'APROVADO'
					) AS ori
						ON ori.rmAluno = dest.rmAluno
							WHEN NOT MATCHED THEN
								INSERT (rmAluno, nomeAluno, statusAluno)
									VALUES (ori.rmAluno, ori.nomeAluno, ori.statusAluno);

-- TURMA 2B
MERGE tb3 AS dest
	USING (
		SELECT rmAluno, nomeAluno, statusAluno
			FROM tb2B
				WHERE statusAluno = 'APROVADO'
					) AS ori
						ON ori.rmAluno = dest.rmAluno
							WHEN NOT MATCHED THEN
								INSERT (rmAluno, nomeAluno, statusAluno)
									VALUES (ori.rmAluno, ori.nomeAluno, ori.statusAluno);


	SELECT * FROM tb3



-- ou

MERGE tb3 AS dest
	USING (
		SELECT rmAluno, nomeAluno, statusAluno
			FROM tb2A
				WHERE statusAluno = 'APROVADO'
						UNION ALL
							SELECT rmAluno, nomeAluno, statusAluno
								FROM tb2B
									WHERE statusAluno = 'APROVADO'
										) AS ori
											ON ori.rmAluno = dest.rmAluno
												WHEN NOT MATCHED THEN
													INSERT (rmAluno, nomeAluno, statusAluno)
														VALUES (ori.rmAluno, ori.nomeAluno, ori.statusAluno);


SELECT * FROM tb2A
SELECT * FROM tb2B
SELECT * FROM tb3