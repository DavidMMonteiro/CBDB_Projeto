#Lista das horas efetuadas por empregado num mes comcreto
CREATE OR REPLACE VIEW v_horas_empregados AS
    SELECT 
        e.idEmpregado idEmpregado,
        CONCAT(u.primeiro, ' ', u.apelido) Nome_Empregado,
        SUM(h.Horas_Totais) HorasTotais,
        SUM(h.Horas_Extra) HorasExtra,
        YEAR(h.dtHorario) Ano,
        MONTH(h.dtHorario) Mes
    FROM
        horario h
            JOIN
        empregado e ON e.idEmpregado = h.idEmpregado
            JOIN
        utilizador u ON u.idUtilizador = h.idEmpregado
    GROUP BY h.idEmpregado , Ano , Mes;

#Salario total dos empregados num mes comcreto
CREATE OR REPLACE VIEW v_Salario_Total AS
    SELECT 
        s.idEmpregado IdEmpregado,
        h.Nome_Empregado,
        h.Ano,
        h.Mes,
        (s.valor_hora * h.HorasTotais + s.valor_hora_extra * h.HorasExtra) SalarioTotal
    FROM
        Salario s
            JOIN
        v_horas_empregados h ON h.idEmpregado = s.idEmpregado
            JOIN
        utilizador u ON u.idUtilizador = s.idEmpregado
    GROUP BY s.idEmpregado , h.Ano , h.Mes;

#Informação dos empregados
CREATE OR REPLACE VIEW V_Empregados AS
    SELECT 
        u.idUtilizador,
        u.dtNascimento,
        CONCAT(u.rua, ', ', u.localidade, ', ', u.cod_postal) Morada,
        u.nif,
        CONCAT(u.primeiro, ' ', u.apelido) nome,
        u.email,
        te.nome 'Função',
        e.area_trabalho
    FROM
        utilizador u
            JOIN
        empregado e ON u.idUtilizador = e.idEmpregado
            JOIN
        tipo_empregado te ON te.idTipoEmpregado = e.idTipoEmpregado; 

# Informação dos clientes
CREATE OR REPLACE VIEW V_Clientes AS
    SELECT 
        u.idUtilizador,
        u.dtNascimento,
        CONCAT(u.rua, ', ', u.localidade, ', ', u.cod_postal) Morada,
        u.nif,
        CONCAT(u.primeiro, ' ', u.apelido) nome,
        u.email,
        tc.nome 'TipoCliente',
        c.valor_conta 'Valor em Conta'
    FROM
        utilizador u
            JOIN
        cliente c ON u.idUtilizador = c.idCliente
            JOIN
        tipo_cliente tc ON tc.idTipoCliente = c.idTipoCliente; 
        
#Lista de telemoveis dos empregados
CREATE OR REPLACE VIEW v_Telemovel_Empregados AS
    SELECT 
		u.idUtilizador,
        CONCAT(u.primeiro, ' ', u.apelido) Nome,
        u.nif,
        CONCAT('+', t.prefixo, ' ', t.numero) Telemovel
    FROM
        telemovel t
            JOIN
        empregado e ON e.idEmpregado = t.idUtilizador
            JOIN
        utilizador u ON u.idUtilizador = e.idEmpregado;

#Lista de telemoveis dos clientes
CREATE OR REPLACE VIEW v_Telemovel_Clientes AS
    SELECT 
		u.idUtilizador,
        CONCAT(u.primeiro, ' ', u.apelido) Nome,
        u.nif,
        CONCAT('+', t.prefixo, ' ', t.numero) Telemovel
    FROM
        telemovel t
            JOIN
        cliente c ON c.idCliente = t.idUtilizador
            JOIN
        utilizador u ON u.idUtilizador = c.idCliente;

#Informação dos artigos
CREATE OR REPLACE VIEW V_Artigos AS
    SELECT 
        a.idArtigo,
        a.nome,
        a.descricao,
        a.stock,
        a.valor,
        IF(a.estado, 'Ativo', 'Desactivo') Estado,
        ca.nome Categoria
    FROM
        artigo a
            JOIN
        categoria_artigo ca ON ca.idCat = a.idCat;
        
#Lista dos horarios dos empregados
CREATE OR REPLACE VIEW V_Horarios_Empregados AS
    SELECT 
        h.idHorario,
        e.Nome,
        h.Hora_inicio,
        h.hora_fim,
        h.dtHorario DataHorario
    FROM
        horario h
            JOIN
        v_empregados e ON e.idUtilizador = h.idEmpregado;
        
#Lista de vendas
CREATE OR REPLACE VIEW v_vendas AS
    SELECT 
        v.idVenda,
        c.Nome 'Nome Cliente',
        e.Nome 'Nome Empregado',
        v.estado,
        v.dtEmisao,
        v.valor_total
    FROM
        venda v
            JOIN
        v_clientes c ON c.idUtilizador = v.idCliente
            JOIN
        v_empregados e ON e.idUtilizador = v.idEmpregado;

#Lista de encomendas e vendas asociadas
CREATE OR REPLACE VIEW v_encomendas AS
    SELECT 
        e.idVenda,
        e.idEncomenda,
        a.Nome Artigo,
        e.quantidade,
        e.preco_artigo,
        (e.preco_artigo * e.quantidade) 'Valor Encomenda'
    FROM
        encomenda e
            JOIN
        v_artigos a ON a.idArtigo = e.idArtigo;