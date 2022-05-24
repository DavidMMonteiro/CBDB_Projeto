SELECT * FROM gestao_artigos_db.horasempregado;

SELECT 
    s.idEmpregado IdEmpregado,
    CONCAT(u.primeiro, ' ', u.apelido) Nome_Empregado,
    h.Ano,
    h.Mes,
    (s.valor_hora * h.HorasTotais + s.valor_hora_extra * h.HorasExtra) Total
FROM
    Salario s
JOIN
    horasempregado h ON h.idEmpregado = s.idEmpregado
JOIN 
	utilizador u on u.idUtilizador = s.idEmpregado
group by s.idEmpregado, h.Ano, h.Mes;