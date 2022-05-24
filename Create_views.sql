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
