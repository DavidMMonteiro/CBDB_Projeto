#Seleciona a base de dados
Use gestao_artigos_db;
#Elemina todos os dados na tabela atual
Delete from encomenda where idEncomenda > 0;
Delete from venda where idVenda > 0;
Delete from artigo where idArtigo > 0;
Delete from categoria_artigo where idCat > 0;
Delete from salario where idSalario > 0;
Delete from horario where idHorario > 0;
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
Insert into Utilizador Values(4, default, "1998-06-08", "Rua Genérica 2", "Leiria", "2400-441", "159753654", "Pepe", "Juanma Lopez", "pepe@gmail.com");  

#Dados números de telemovel
Insert into telemovel Values(1, default, default, "951951951", 1); 
Insert into telemovel Values(2, default, default, "951753852", 1); 
Insert into telemovel Values(3, default, default, "987654321", 2); 
Insert into telemovel Values(4, default, default, "987321654", 2); 
Insert into telemovel Values(5, default, default, "987426153", 2); 
Insert into telemovel Values(6, default, default, "954368127", 3); 

#Dados tipo de clientes
Insert into Tipo_Cliente values(1, default, "Loja", "Cliente que compra em loja física");
Insert into Tipo_Cliente values(2, default, "Online", "Cliente que compra em loja online");
Insert into Tipo_Cliente values(3, default, "Comissão", "Cliente que faz comissões");

#Dados Clientes
Insert into Cliente Value(1, 1, default);
Insert into Cliente Value(2, 3, 50.75);

#Dados tipo de empregados
Insert into tipo_empregado values(1, default, "Faturação", "Funcionario da empresa");
Insert into tipo_empregado values(2, default, "Caixa", "Empregado encarregado da caixa física");
Insert into tipo_empregado values(3, default, "Administração", "Administrado do sistema");

#Dados Empregados
Insert into Empregado values(3, default, 2, "Funcionario de loja física");
Insert into Empregado values(4, default, 3, "Administrador da rede da empresa");

#Dados Horarios
Insert into Horario value(default, 3, default, "09:00:00", "18:00:00", "9:00:00", "18:00:00",9, 0,"2022-05-15");
Insert into Horario value(default, 3, default, "09:00:00", "18:00:00", "09:30:00", "18:30:00",9, 0,"2022-05-16");
Insert into Horario value(default, 3, default, "08:00:00", "17:00:00", "08:30:00", "17:30:00", 9, 0,"2022-05-17");
Insert into Horario value(default, 4, default, "09:00:00", "18:00:00", "09:00:00", "20:00:00", 9, 2,"2022-05-15");
Insert into Horario value(default, 4, default, "09:00:00", "18:00:00", "09:00:00", "19:00:00", 9, 1,"2022-05-16");

#Dados Salarios
Insert into Salario value(default, 3, default, 3, 6, now(),null);
Insert into Salario value(default, 4, default, 4, 10, now(), null);

#Dados categoria de artigos
Insert into Categoria_artigo value(1,default, "Tinta oleo", "Tinta feita a partir de oleo");
Insert into Categoria_artigo value(2,default, "Argila", "Material de Argila");
Insert into Categoria_artigo value(3,default, "Ferramentas", "Ferramentas de pintura");

#Dados Artigos
Insert into artigo value(1, default, "Argila Vermelha", "Argila de picmentação vermelha", 4, 5, True, 2);
Insert into artigo value(2, default, "Argila Preta", "Argila de picmentação preta", 4, 10, True, 2);
Insert into artigo value(3, default, "Argila Volcanica", "Argila de base de materiais volcánicas", 6, 3, True, 2);
Insert into artigo value(4, default, "Tinta Oleo verde", "Tinta de oleo de picmentação verde", 3, 20, True, 1);
Insert into artigo value(5, default, "Tinta Oleo Azul", "Tinta de oleo de picmentação azul", 2.5, 25, True, 1);
Insert into artigo value(6, default, "Pincal 30cm", "Pincel de pelo normal 30cm", 2, 15, True, 3);
Insert into artigo value(7, default, "Pincel 15cm", "Pincel de pelo normal 15cm", 1.5, 10, True, 3);
Insert into artigo value(8, default, "Pincel Cabalo 15cm", "Pincel de pelo de cabalo 15cm", 3, 5, True, 3);

#Dados Venda

#Dados Encomenda
