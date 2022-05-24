#Utilizadores


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
Select c.idCliente, concat(c.primeiro, ' ', c.apelido) Nome from cliente 
join vendas;


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


#Vendas

#Artigos