CREATE OR REPLACE VIEW HorasEmpregado AS
SELECT 
	e.idEmpregado idEmpregado,
    CONCAT(u.primeiro, ' ', u.apelido) Nome_Empregado,
    SUM(h.Horas_Totais) HorasTotais,
    SUM(h.Horas_Extra) HorasExtra,
    YEAR(h.dtHorario) Ano,
    MONTH(h.dtHorario) Mes
FROM
    horario h
JOIN empregado e ON e.idEmpregado = h.idEmpregado
JOIN utilizador u ON u.idUtilizador = h.idEmpregado
GROUP BY h.idEmpregado , Ano , Mes;

CREATE OR REPLACE VIEW SalarioTotal AS
SELECT 
    s.idEmpregado IdEmpregado,
    h.Nome_Empregado,
    h.Ano,
    h.Mes,
    (s.valor_hora * h.HorasTotais + s.valor_hora_extra * h.HorasExtra) SalarioTotal
FROM
    Salario s
JOIN
    horasempregado h ON h.idEmpregado = s.idEmpregado
JOIN 
	utilizador u on u.idUtilizador = s.idEmpregado
group by s.idEmpregado, h.Ano, h.Mes;

