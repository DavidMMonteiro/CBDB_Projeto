#Initialize date base
DROP DATABASE IF EXISTS Gestao_Artigos_DB;
CREATE DATABASE Gestao_Artigos_DB;
USE Gestao_Artigos_DB;

#Create Tables
#Table Utilizadores
CREATE TABLE Utilizador (
    idUtilizador INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação utilizador' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data registo utilizador',
    dtNascimento DATE NOT NULL COMMENT 'Data nascimento utilizador',
    rua VARCHAR(150) NOT NULL COMMENT 'Rua da morada do utilizador',
    localidade VARCHAR(150) NOT NULL COMMENT 'Localidade da morada do utilizador',
    cod_postal VARCHAR(9) NOT NULL COMMENT 'Código postal da morada do utilizador',
    nif VARCHAR(9) NOT NULL COMMENT 'Número de identificação fiscal do utilizador',
    primeiro VARCHAR(150) NOT NULL COMMENT 'Primeiro nome do utilizador',
    apelido VARCHAR(150) NOT NULL COMMENT 'Apelido do utilizador',
    email VARCHAR(150) NOT NULL COMMENT 'Direção email do utilizador'
)  ENGINE=INNODB;

#Table Número telemovel
CREATE TABLE Telemovel (
    idTelemovel INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação Telemovel' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data do registo do numero de telemovel',
    prefixo VARCHAR(4) NOt null DEFAULT '0035' COMMENT 'Prefixo do número de telemovel',
    numero VARCHAR(9) NOT NULL COMMENT 'Número de telemovel',
    idUtilizador INT UNSIGNED COMMENT 'Identificação do utilizador',
    CONSTRAINT FK_Utilizador_Telemovel FOREIGN KEY (idUtilizador)
        REFERENCES Utilizador (idUtilizador)
)  ENGINE=INNODB;

#Table Tipo Cliente
CREATE TABLE Tipo_Cliente (
    idTipoCliente INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do tipo de cliente' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data regsito do tipo de cliente',
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do tipo de cliente',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do tipo de cliente'
)  ENGINE=INNODB;

#Table Cliente
CREATE TABLE Cliente(
    idCliente INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cliente' PRIMARY KEY,
    idTipoCliente INT UNSIGNED COMMENT 'Tipo de Cliente',
    valor_conta Decimal not null default 0 comment 'Valor em conta do cliente',
    CONSTRAINT FK_Utilizador_Cliente FOREIGN KEY (idCliente)
        REFERENCES Utilizador (idUtilizador),
    CONSTRAINT FK_TIPOCLIENTE_Cliente FOREIGN KEY(idTipoCliente) REFERENCES Tipo_Cliente(idTipoCliente)
) ENGINE= INNODB;

#Table Tipo Empregado
CREATE TABLE Tipo_Empregado (
    idTipoEmpregado INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do tipo de empregado' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data regsito do tipo de empregado',
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do tipo de empregado',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do tipo de empregado'
)  ENGINE=INNODB;

#Table Empregado
CREATE TABLE Empregado (
    idEmpregado INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação de empregado' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data do registo do empregado',
    idTipoEmpregado INT UNSIGNED COMMENT 'Identificação do tipo de empregado',
    area_trabalho varchar(255) not null comment 'Aréa de trabalho do empregado',
    CONSTRAINT FK_Utilizador FOREIGN KEY (idEmpregado)
        REFERENCES Utilizador (idUtilizador),
    CONSTRAINT FK_TIPOEMPREGADO FOREIGN KEY (idTipoEmpregado)
        REFERENCES Tipo_Empregado (idTipoEmpregado)
)  ENGINE=INNODB;

#Table Salario
CREATE TABLE Salario (
    idSalario INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do tipo de empregado' PRIMARY KEY,
    idEmpregado INT UNSIGNED NOT NULL COMMENT 'Identificador do empregado',
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data de criação do registo',
    Valor_hora DECIMAL NOT NULL COMMENT 'Valor por hora',
    Valor_hora_extra DECIMAL NOT NULL COMMENT 'Valor por hora extra',
    dtSalario DATE NOT NULL COMMENT 'Data de emissão do salário',
    Total DECIMAL DEFAULT 0 COMMENT 'Total do salário',
    CONSTRAINT FK_Empregado_Salario FOREIGN KEY (idEmpregado)
        REFERENCES Empregado (idEmpregado)
)  ENGINE=INNODB;


#Table Horario
CREATE TABLE Horario (
    idHorario INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do horario' PRIMARY KEY,
    idEmpregado INT UNSIGNED NOT NULL COMMENT 'Identificador do empregado',
    idSalario INT UNSIGNED NULL COMMENT 'Identifiador Salario correspondente',
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data de criação do registo',
    Hora_inicio TIME NOT NULL COMMENT 'Hora de inicio de trabalho do empregado',
    Hora_fim TIME NOT NULL COMMENT 'Hora de fim de trabalho do empregado',
    Hora_entrada TIME NOT NULL COMMENT 'Hora de entrada do empregado',
    Hora_Saida TIME NOT NULL COMMENT 'Hora de saída do empregado',
    Horas_Totais INT NOT NULL COMMENT 'Horas totais feitas',
    Horas_Extra INT NOT NULL COMMENT 'Horas extra feitas numa data',
    dtHorario DATE NOT NULL COMMENT 'Data do horário',
    CONSTRAINT Fk_Empregado_Horario FOREIGN KEY (idEmpregado)
        REFERENCES Empregado (idEmpregado),
    CONSTRAINT Fk_Salario_Horario FOREIGN KEY (idSalario)
        REFERENCES Salario (idSalario)
)  ENGINE=INNODB;

#Table Artigos Categorias
CREATE TABLE Categoria_Artigo (
    idCat INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação da Categoria' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data de criação da categoria',
    nome VARCHAR(255) NOT NULL COMMENT 'Nome da categoria',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição da categoria'
)  ENGINE=INNODB;

#Table Artigos
CREATE TABLE artigo (
    idArtigo INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do artigo' PRIMARY KEY,
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data de criação do registo do artigo',
    nome VARCHAR(255) NOT NULL COMMENT 'Nome do artigo',
    descricao VARCHAR(255) NOT NULL COMMENT 'Descrição do artigo',
    stock INT NOT NULL DEFAULT 0 COMMENT 'Numero stock do artigo',
    valor DECIMAL NOT NULL DEFAULT 0 COMMENT 'Valor do artigo',
    estado BOOL NOT NULL DEFAULT FALSE COMMENT 'Identificador se o artigo esta activo (true) ou desativado (falso)',
    idCat INT UNSIGNED Comment 'Identificador da categoria do artigo',
    CONSTRAINT Fk_Artigo_Cartegoria FOREIGN KEY (idCat)
        REFERENCES Categoria_Artigo (idCat)
)  ENGINE=INNODB;

#Table Venda
CREATE TABLE venda (
    idVenda INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do tipo de empregado' PRIMARY KEY,
    idEmpregado INT UNSIGNED NOT NULL COMMENT 'Empregado que efetua a venda',
    idCliente INT UNSIGNED NOT NULL COMMENT 'Cliente que efetua a compra',
    dtRegisto DATETIME NOT NULL DEFAULT NOW() COMMENT 'Data de criação da encomenda',
    dtEmisao DATETIME COMMENT 'Data de emissão da venda',
    estado Enum('Pendente','Fechada','Cancelada') not null default 'Pendente' comment 'Estado da venda',
    valor_total DECIMAL COMMENT 'Valor total da venda',
    CONSTRAINT Fk_Empregado_Venda FOREIGN KEY (idEmpregado)
        REFERENCES Empregado (idEmpregado),
    CONSTRAINT Fk_Cliente_Venda FOREIGN KEY (idCliente)
        REFERENCES Cliente (idCliente)
)  ENGINE=INNODB;

#Table Encomenda
CREATE TABLE encomenda (
    idEncomenda INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificação do tipo de empregado' PRIMARY KEY,
    idVenda INT UNSIGNED NOT NULL COMMENT 'Id da venda asociada',
    idArtigo INT UNSIGNED NOT NULL COMMENT 'Id artigo da encomenda',
    dtRegisto Datetime not null default now() comment 'Data da criação da encomenda',
    quantidade INT NOT NULL DEFAULT 0 COMMENT 'Quantidade do artigo da encomenda',
    preco_artigo DECIMAL NOT NULL COMMENT 'valor no momento do artigo',
    CONSTRAINT Fk_Encomenda_Venda FOREIGN KEY (idVenda)
        REFERENCES venda (idVenda),
    CONSTRAINT Fk_Encomenda_Artigo FOREIGN KEY (idArtigo)
        REFERENCES artigo (idArtigo)
)  ENGINE=INNODB;
