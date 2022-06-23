/*
TeSP_PSI_2122_CDBD
Sistema de Informação para gestão de empresa de distribuição
David Machado Monteiro, estudante n.º 2211849
Tiago Miguel Marques Amaro nº2211862
*/

#Consultas Clientes

#---------------------------------------
#Consulta Geral para obter informação dos clientes
Select * from v_clientes;
#---------------------------------------

#---------------------------------------
#Consulta para obter os números de telemovel dos clientes
Select * from v_telemovel_clientes;
#---------------------------------------

#---------------------------------------
#Consulta para obter o quantidade de clientes por tipo
SELECT 
    tp.nome 'Tipo de Cliente', COUNT(*) 'Numero de Clientes'
FROM
    v_clientes c
        JOIN
    tipo_cliente tp ON c.idTipoCliente = tp.idTipoCliente
GROUP BY c.idTipoCliente;
#---------------------------------------

#---------------------------------------
#Consulta para obter as encomendas feitas pelos clientes
SELECT 
	c.idCliente,
    c.Nome Nome_Cliente,
    v.idVenda,
    e.idEncomenda,
    e.Artigo,
    e.quantidade,
    e.preco_artigo 'Preço do Artigo no momento',
    e.preco_artigo * e.quantidade 'Preço Encomenda'
FROM
    v_clientes c
        JOIN
    v_vendas v ON v.idCliente = c.idCliente
        JOIN
    v_encomendas e ON e.idVenda = v.idVenda;
#---------------------------------------

#---------------------------------------
#Consulta para obter as encomendas feitas pelos clientes
SELECT 
	c.idCliente,
    c.nome Nome_Cliente,
    v.idVenda idVenda,
    s.valor_total
FROM
    v_clientes c
        JOIN
    v_vendas v ON v.idCliente = c.idCliente
        JOIN
    (SELECT 
        v.idVenda, SUM(e.preco_artigo * e.quantidade) Valor_Total
    FROM
        v_vendas v
    JOIN v_encomendas e ON e.IdVenda = v.idVenda
    GROUP BY v.IdVenda) s ON s.idVenda = v.idVenda;
#---------------------------------------

#Consultas Empregados

#---------------------------------------
#Consulta Geral para obter informação dos empregados
Select * from v_empregados;
#---------------------------------------

#---------------------------------------
#Consulta para obter os números de telemovel dos empregados
Select * from v_telemovel_empregados;
#---------------------------------------

#---------------------------------------
#Consulta para obter horas efetuadas pelo empregados
Select * from v_horas_empregados;
#---------------------------------------

#---------------------------------------
#Consulta quantidade de empregados por Tipo
#---------------------------------------
SELECT 
    e.Tipo_Empregado, COUNT(*) NumeroEmpregados
FROM
    v_empregados e
GROUP BY e.idTipoEmpregado;
#---------------------------------------

#---------------------------------------
#

#Consultas Horários

#---------------------------------------
#Consulta horarios gerais dos empregados
Select * from v_horarios_empregados;
#---------------------------------------

#---------------------------------------
#Consulta horarios de um mês espécifico
SELECT 
    *
FROM
    v_horarios_empregados
WHERE
    YEAR(DataHorario) = YEAR('2022-04-00')
AND 
    MONTH(DataHorario) = MONTH('2022-04-00');
#---------------------------------------

#---------------------------------------
#Consulta horarios a partir de uma data
SELECT 
    *
FROM
    gestao_artigos_db.v_horarios_empregados
WHERE
    DataHorario >= "2022-05-16";
#---------------------------------------

#---------------------------------------
#Consulta horarios entre duas datas
SELECT 
    *
FROM
    gestao_artigos_db.v_horarios_empregados
WHERE
    DataHorario BETWEEN '2022-04-15' AND '2022-05-16';
#---------------------------------------

#Consultas Salários

#---------------------------------------
#Consulta Geral para obter informação dos salarios dos empregados
Select * from v_salario_total;
#---------------------------------------

#---------------------------------------
#Consulta salarios espécificos de um empregado
SELECT 
    *
FROM
    v_salario_total
WHERE
    IdEmpregado = 3;
#---------------------------------------

#---------------------------------------
#Consulta salarios emitidos apartir de uma data
SELECT 
    *
FROM
    v_salario_total
WHERE
    ano = 2022 And mes >= 5;
#---------------------------------------

#Consultas Artigos

#---------------------------------------
#Consulta Geral para obter informação dos artigos
Select * from v_artigos;
#---------------------------------------

#---------------------------------------
#Consulta o stock dos artigos
SELECT 
    idArtigo, Nome, stock
FROM
    gestao_artigos_db.v_artigos;
#---------------------------------------

#---------------------------------------
#Consulta o estado dos artigos
SELECT 
    idArtigo, nome, Estado
FROM
    gestao_artigos_db.v_artigos;
#---------------------------------------

#---------------------------------------
#Consulta dos artigos vendidos, a quantidade vendida e em ordem descendente de quantidade vendida
SELECT 
    idArtigo, Artigo, SUM(Quantidade) Quantidade
FROM
    gestao_artigos_db.v_encomendas
GROUP BY idArtigo
ORDER BY 3 DESC;
#---------------------------------------

#---------------------------------------
#Consulta para obter os artigos por categoria id ou nome
SELECT 
    *
FROM
    gestao_artigos_db.v_artigos
WHERE
    idCat = 2 OR Categoria LIKE ‘Argila’
ORDER BY Categoria;
#---------------------------------------

#Consultas Encomendas

#---------------------------------------
#Consulta Geral das encomendas
Select * from v_encomendas;
#---------------------------------------

#Consultas Vendas

#---------------------------------------
#Consulta Geral das vendas
Select * from v_vendas;
#---------------------------------------

#---------------------------------------
#Consulta para obter vendas efetuadas por um empregado
SELECT * FROM v_vendas
where idEmpregado = 3;
#---------------------------------------

#---------------------------------------
#Consulta para obter vendas efetuadas por um cliente
SELECT * FROM gestao_artigos_db.v_vendas
WHERE idCliente = 1;
#---------------------------------------

#---------------------------------------
#Consulta numero de vendas efetuadas por un empregado
SELECT 
   idEmpregado, Nome_Empregado, COUNT(idVenda) 'Vendas Efetuadas'
FROM
    gestao_artigos_db.v_vendas
GROUP BY idEmpregado;
#---------------------------------------

#---------------------------------------
#Consulta numero de vendas efetuadas por un cliente
SELECT 
   idCliente, Nome_Cliente, COUNT(idVenda) 'Compras Efetuadas'
FROM
    gestao_artigos_db.v_vendas
GROUP BY idCliente;
#---------------------------------------

#---------------------------------------
#Consulta o valor total gasto pelos clientes
SELECT 
    idCliente, Nome_Cliente, SUM(valor_total) 'Valor Total das Compras'
FROM
    gestao_artigos_db.v_vendas
GROUP BY idCliente;
#---------------------------------------


