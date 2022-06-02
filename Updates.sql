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

#Update todos os horarios os salarios que correspondem
UPDATE horario h
        JOIN
    salario s ON s.idEmpregado = h.idEmpregado
        AND YEAR(s.dtSalario) = YEAR(h.dtHorario)
        AND MONTH(s.dtSalario) = MONTH(h.dtHorario) 
SET 
    h.idSalario = s.idSalario;

#Update todas as vendas com o valor total, fecha a venda e guarda a data de emisão da venda.
UPDATE venda v
        JOIN
    (SELECT 
        e.idVenda, SUM(e.preco_artigo * e.quantidade) TotalEncomenda
    FROM
        encomenda e
    JOIN artigo a ON a.idArtigo = e.idArtigo
    GROUP BY e.idVenda) e ON e.idVenda = v.idVenda 
SET 
    v.valor_total = e.TotalEncomenda,
    v.estado = "Fechada",
    v.dtEmisao = now();