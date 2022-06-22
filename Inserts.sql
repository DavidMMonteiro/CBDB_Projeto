/*
TeSP_PSI_2122_CDBD
Sistema de Informação para gestão de empresa de distribuição
David Machado Monteiro, estudante n.º 2211849
*/

#Seleciona a base de dados
Use gestao_artigos_db;
#Elemina todos os dados na tabela atual
Delete from encomenda where idEncomenda > 0;
Delete from venda where idVenda > 0;
Delete from artigo where idArtigo > 0;
Delete from categoria_artigo where idCat > 0;
Delete from horario where idHorario > 0;
Delete from salario where idSalario > 0;
Delete from empregado where idEmpregado > 0;
DELETE FROM tipo_empregado WHERE idTipoEmpregado > 0;
Delete from Cliente where idCliente > 0;
Delete from tipo_cliente where idTipoCLiente > 0;
Delete from telemovel where idTelemovel > 0;
Delete from Utilizador where idUtilizador > 0;

#Começa a inserir os dados default

#Dados utilizador
Insert into Utilizador Values(1, default, '1999-12-26', "Rua das Eiras Nº94 A", "Leiria", "2400-441", "999999999", "David", "Machado Monteiro", "davidubi2010@gmail.com");
Insert into Utilizador Values(2, default, "2000-10-05", "Rua dos Doces", "Leiria", "2400-441", "987654321", "Carlos", "Montes Pedreira", "carlos@gmail.com"); 
Insert into Utilizador Values(3, default, "2001-05-02", "Rua Genérica 1", "Leiria", "2400-441", "123456789", "Mario", "Rodriguez Fernadez", "mario@gmail.com"); 
Insert into Utilizador Values(4, default, "2002-04-08", "Rua Genérica 2", "Leiria", "2400-441", "159753654", "Pepe", "Juanma Lopez", "pepe@gmail.com");  
Insert into Utilizador Values(5, default, "1980-02-07", "Rua Carlos II", "Leiria", "2400-441", "159753656", "Marcos", "Dias Marques", "marcos@gmail.com");  
Insert into Utilizador Values(6, default, "1998-11-05", "Rua Felipe V", "Leiria", "2400-441", "159753658", "Rodrigo", "Guerra Lopez", "rodrigo@gmail.com");  
Insert into Utilizador Values(7, default, "1992-12-08", "Rua da Madeira", "Leiria", "2400-441", "159753690", "Felipe", "Juão Carlos", "felipe@gmail.com");  
Insert into Utilizador Values(8, default, "1991-03-08", "Rua Fatima", "Leiria", "2400-441", "159753689", "Pedro", "Nunes Something", "pedro@gmail.com");  

#Dados números de telemovel
Insert into telemovel Values(1, default, default, "951951951", 1); 
Insert into telemovel Values(2, default, default, "951753852", 1); 
Insert into telemovel Values(3, default, default, "987654321", 2); 
Insert into telemovel Values(4, default, default, "987321654", 2); 
Insert into telemovel Values(5, default, default, "987426153", 2); 
Insert into telemovel Values(6, default, default, "954368127", 3); 
Insert into telemovel Values(7, default, default, "954682317", 4); 

#Dados tipo de clientes
Insert into Tipo_Cliente values(1, default, "Loja", "Cliente que compra em loja física");
Insert into Tipo_Cliente values(2, default, "Online", "Cliente que compra em loja online");
Insert into Tipo_Cliente values(3, default, "Comissão", "Cliente que faz comissões");

#Dados Clientes
Insert into Cliente Value(1, 1, default);
Insert into Cliente Value(2, 3, 50.75);
Insert into Cliente Value(5, 1, default);
Insert into Cliente Value(7, 1, 10);

#Dados tipo de empregados
Insert into tipo_empregado values(1, default, "Faturação", "Funcionario da empresa");
Insert into tipo_empregado values(2, default, "Caixa", "Empregado encarregado da caixa física");
Insert into tipo_empregado values(3, default, "Administração", "Administrado do sistema");
Insert into tipo_empregado values(4, default, "Diretor", "Diretor empresa");
Insert into tipo_empregado values(5, default, "Caixa Jefe", "Jefe dos empregados de caixa");

#Dados Empregados
Insert into Empregado values(3, default, 2, "Funcionario de loja física");
Insert into Empregado values(4, default, 3, "Administrador da rede da empresa");
Insert into Empregado values(6, default, 4, "Diretor");
Insert into Empregado values(8, default, 5, "Administrador de caixa de loja física");

#Dados Horarios
Insert into Horario value(1, 3, default, default, "09:00:00", "18:00:00", "09:00:00", "18:00:00", 8, 0,"2022-04-30");
Insert into Horario value(2, 3, default, default, "09:00:00", "18:00:00", "09:00:00", "18:00:00", 8, 0,"2022-05-15");
Insert into Horario value(3, 3, default, default, "09:00:00", "18:00:00", "09:30:00", "18:30:00", 8, 0,"2022-05-16");
Insert into Horario value(4, 3, default, default, "08:00:00", "17:00:00", "08:30:00", "17:30:00", 8, 0,"2022-05-17");
Insert into Horario value(5, 4, default, default, "09:00:00", "18:00:00", "09:00:00", "20:00:00", 8, 2,"2022-05-15");
Insert into Horario value(6, 4, default, default, "09:00:00", "18:00:00", "09:00:00", "19:00:00", 8, 1,"2022-05-16");
Insert into Horario value(7, 4, default, default, "09:00:00", "18:00:00", "09:00:00", "18:00:00", 8, 1,"2022-06-01");
Insert into Horario value(8, 4, default, default, "09:00:00", "18:00:00", "09:00:00", "17:00:00", 8, 1,"2022-06-02");
Insert into Horario value(9, 4, default, default, "09:00:00", "18:00:00", "09:00:00", "20:00:00", 8, 1,"2022-06-03");

#Dados Salarios
Insert into Salario value(1, 3, default, 3, 6, '2022-04-01',null);
Insert into Salario value(2, 3, default, 3, 6, '2022-05-01',null);
Insert into Salario value(3, 4, default, 4, 10, '2022-05-01', null);

#Dados categoria de artigos
Insert into Categoria_artigo value(1,default, "Tinta oleo", "Tinta feita a partir de oleo");
Insert into Categoria_artigo value(2,default, "Argila", "Material de Argila");
Insert into Categoria_artigo value(3,default, "Ferramentas", "Ferramentas de pintura");

#Dados Artigos
Insert into artigo value(1, default, "Argila Vermelha", "Argila de picmentação vermelha", 4, 5.0, True, 2);
Insert into artigo value(2, default, "Argila Preta", "Argila de picmentação preta", 4, 5.0, True, 2);
Insert into artigo value(3, default, "Argila Volcanica", "Argila de base de materiais volcánicas", 6, 5.0, True, 2);
Insert into artigo value(4, default, "Tinta Oleo verde", "Tinta de oleo de picmentação verde", 3, 5.0, True, 1);
Insert into artigo value(5, default, "Tinta Oleo Azul", "Tinta de oleo de picmentação azul", 2, 5.0, True, 1);
Insert into artigo value(6, default, "Pincal 30cm", "Pincel de pelo normal 30cm", 15, 2.0, True, 3);
Insert into artigo value(7, default, "Pincel 15cm", "Pincel de pelo normal 15cm", 10, 1.50, True, 3);
Insert into artigo value(8, default, "Pincel Cabalo 15cm", "Pincel de pelo de cabalo 15cm", 5, 3.0, True, 3);

#Dados Venda
insert into venda values(1,3,1,default,null, default, null);
insert into venda values(2,4,2,default,null, default, null);
insert into venda values(3,4,2,default,null, default, null);
insert into venda values(4,3,1,default,null, default, null);

#Dados Encomenda
Insert into encomenda value(1, 1, 1, default, 2, 5.0);
Insert into encomenda value(2, 1, 2, default, 1, 5.0);
Insert into encomenda value(3, 2, 6, default, 3, 2.0);
Insert into encomenda value(4, 2, 7, default, 5, 1.50);
Insert into encomenda value(5, 2, 8, default, 1, 3.0);
Insert into encomenda value(6, 3, 1, default, 2, 5.0);
Insert into encomenda value(7, 3, 2, default, 1, 5.0);