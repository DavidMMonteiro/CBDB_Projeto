#Update all Salario row dinamicamente
UPDATE salario s
        JOIN
    (SELECT s.*, st.salarioTotal
    FROM
        salario s
    JOIN salarioTotal st ON st.idEmpregado = s.idEmpregado
        AND YEAR(s.dtSalario) = st.Ano
        AND MONTH(s.dtSalario) = st.mes) st ON st.idSalario = s.idSalario
        AND YEAR(s.dtSalario) = YEAR(st.dtSalario)
        AND MONTH(s.dtSalario) = MONTH(st.dtSalario) 
SET 
    s.Total = st.SalarioTotal;

UPDATE horario h
        JOIN
    salario s ON s.idEmpregado = h.idEmpregado
        AND YEAR(s.dtSalario) = YEAR(h.dtHorario)
        AND MONTH(s.dtSalario) = MONTH(h.dtHorario) 
SET 
    h.idSalario = s.idSalario;