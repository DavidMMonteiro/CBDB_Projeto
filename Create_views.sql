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
            JOIN
        empregado e ON e.idEmpregado = h.idEmpregado
            JOIN
        utilizador u ON u.idUtilizador = h.idEmpregado
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
        utilizador u ON u.idUtilizador = s.idEmpregado
    GROUP BY s.idEmpregado , h.Ano , h.Mes;

CREATE OR REPLACE VIEW VerEmpregados AS
    SELECT 
        u.idUtilizador,
        u.dtNascimento,
        CONCAT(u.rua,
                ', ',
                u.localidade,
                ', ',
                u.cod_postal) Morada,
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

CREATE OR REPLACE VIEW VerClientes AS
    SELECT 
        u.idUtilizador,
        u.dtNascimento,
        CONCAT(u.rua,
                ', ',
                u.localidade,
                ', ',
                u.cod_postal) Morada,
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
        
CREATE OR REPLACE VIEW TelemovelEmpregados AS
    SELECT 
        CONCAT(u.primeiro, ' ', u.apelido) Nome,
        u.nif,
        CONCAT('+', t.prefixo, ' ', t.numero) Telemovel
    FROM
        telemovel t
            JOIN
        empregado e ON e.idEmpregado = t.idUtilizador
            JOIN
        utilizador u ON u.idUtilizador = e.idEmpregado;
        
CREATE OR REPLACE VIEW TelemovelClientes AS
    SELECT 
        CONCAT(u.primeiro, ' ', u.apelido) Nome,
        u.nif,
        CONCAT('+', t.prefixo, ' ', t.numero) Telemovel
    FROM
        telemovel t
            JOIN
        cliente c ON c.idCliente = t.idUtilizador
            JOIN
        utilizador u ON u.idUtilizador = c.idCliente;
        
CREATE OR REPLACE VIEW VerArtigos AS
    SELECT 
        a.idArtigo,
        a.nome,
        a.descricao,
        a.stock,
        a.valor,
        IF(a.estado, 'Ativo', 'Desactivo') Estado,
        ca.nome
    FROM
        artigo a
            JOIN
        categoria_artigo ca ON ca.idCat = a.idCat;