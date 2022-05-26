#Utilizadores
#-------------------------------
SELECT 
    *
FROM
    utilizador;
#-------------------------------
SELECT 
    *
FROM
    utilizador
WHERE
    primeiro LIKE '%C';
#-------------------------------



#Clientes
#-------------------------------
SELECT 
    c.idCliente,
    u.dtNascimento,
    CONCAT(u.primeiro, ' ', u.apelido) Nome_Cliente,
    u.nif,
    CONCAT(u.rua,',',u.localidade,',',u.cod_postal) Morada,
    u.email,
    tc.Nome TipoCliente,
    c.Valor_conta ValorEnConta
FROM
    cliente c
        JOIN
    utilizador u ON c.idCliente = u.idUtilizador
        JOIN
    tipo_cliente tc ON tc.idTipoCliente = c.idTipoCliente;
#-------------------------------
SELECT 
    tp.nome 'Tipo de Cliente', COUNT(*) 'Numero de Clientes'
FROM
    cliente c
        JOIN
    tipo_cliente tp ON c.idTipoCliente = tp.idTipoCliente
GROUP BY c.idTipoCliente;
#--------------------------------
SELECT 
    c.idCliente, CONCAT(c.primeiro, ' ', c.apelido) Nome
FROM
    cliente
        JOIN
    vendas;
#--------------------------------
SELECT 
    CONCAT(c.primeiro, ' ', c.apelido) Nome_Cliente,
    v.idVenda,
    a.Nome,
    e.quantidade,
    e.preco_artigo 'Preço do Artigo no momento',
    e.preco_artigo * e.quantidade 'Preço Encomenda'
FROM
    utilizador c
        JOIN
    venda v ON v.idCliente = c.idUtilizador
        JOIN
    encomenda e ON e.idVenda = v.idVenda
        JOIN
    artigo a ON a.idArtigo = e.idArtigo;
#--------------------------------


#Empregados
SELECT 
    e.idEmpregado,
    u.dtNascimento,
    CONCAT(u.primeiro, ' ', u.apelido) Nome_Empregado,
    u.nif,
    CONCAT(u.rua,',',u.localidade,',',u.cod_postal) Morada,
    u.email,
    te.Nome TipoEmpregado,
    e.area_trabalho 'Area Trabalho'
FROM
    empregado e
        JOIN
    utilizador u ON e.idEmpregado = u.idUtilizador
        JOIN
    tipo_empregado te ON te.idTipoEmpregado = e.idTipoEmpregado;
#--------------------------------
#Under review
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

#Salario
SELECT 
    s.idSalario,
    CONCAT(u.primeiro, ' ', u.apelido) NomeEmpregado,
    s.Valor_hora,
    s.valor_hora_Extra,
    s.dtSalario,
    s.Total SalarioTotal
FROM
    salario s
        JOIN
    utilizador u ON u.idUtilizador = s.idEmpregado
ORDER BY s.dtSalario DESC;
#--------------------------------

#Horario
SELECT 
    CONCAT(u.primeiro, ' ', u.apelido) NomeEmpregado,
    h.idHorario,
    h.dtHorario,
    h.Hora_inicio,
    h.Hora_fim,
    h.Hora_entrada,
    h.hora_saida,
    h.horas_totais,
    h.horas_extra
FROM
    horario h
        JOIN
    utilizador u ON u.idUtilizador = h.idEmpregado;
#--------------------------------

    
#Vendas

#Artigos