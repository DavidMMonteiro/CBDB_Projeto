# Create Users
Drop user 'administrador.Sistema'@'localhost';
CREATE USER If not exists 'administrador.Sistema'@'localhost' IDENTIFIED BY 'adminSistema';
Drop user 'diretor'@'localhost';
CREATE USER If not exists 'diretor'@'localhost' IDENTIFIED BY 'diretor';
Drop user 'administrador'@'localhost';
CREATE USER If not exists 'administrador'@'localhost' IDENTIFIED BY 'admin';
Drop user 'faturacao'@'localhost';
CREATE USER If not exists 'faturacao'@'localhost' IDENTIFIED BY 'faturacao';
Drop user 'administrador.caixa'@'localhost';
CREATE USER If not exists 'administrador.caixa'@'localhost' IDENTIFIED BY 'adminCaixa';
Drop user 'caixa'@'localhost';
CREATE USER If not exists 'caixa'@'localhost' IDENTIFIED BY 'caixa';
Drop user 'administrador.armazem'@'localhost';
CREATE USER If not exists 'administrador.armazem'@'localhost' IDENTIFIED BY 'adminArmazem';
Drop user 'producao'@'localhost';
CREATE USER If not exists 'producao'@'localhost' IDENTIFIED BY 'producao';

# ----------------------------------------
# Set Administrador Sistema Privileges
GRANT All privileges On gestao_artigos_db.* to 'administrador.Sistema'@'localhost' with grant option;
# ----------------------------------------

# ----------------------------------------
#Set Diretor Privileges
Grant Select, Insert, Update, Delete on gestao_artigos_db.* to 'diretor'@'localhost';
# ----------------------------------------


# ----------------------------------------
#Set Administrador Privileges
Grant Select, Insert, Update, Delete  on gestao_artigos_db.* to 'administrador'@'localhost';
# ----------------------------------------

# ----------------------------------------
#Set Faturação Privileges
#Faturação Select Privileges 
Grant Select on gestao_artigos_db.salario to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_salario_total to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_artigos to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_clientes to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_clientes to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_empregados to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_empregados to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_encomendas to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_horarios_empregados to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_horas_empregados to 'faturacao'@'localhost';
Grant Select on gestao_artigos_db.v_vendas to 'faturacao'@'localhost';

#Faturação Insert Privileges 
Grant Insert on gestao_artigos_db.salario to 'faturacao'@'localhost';

#Faturação Update Privileges 
Grant Update on gestao_artigos_db.salario to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.v_artigos to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.v_encomendas to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.v_vendas to 'faturacao'@'localhost';

#Faturação Delete Privileges
Grant Delete on gestao_artigos_db.salario to 'faturacao'@'localhost';
Grant Delete on gestao_artigos_db.v_encomendas to 'faturacao'@'localhost';
Grant Delete on gestao_artigos_db.v_vendas to 'faturacao'@'localhost';
# ----------------------------------------

# ----------------------------------------
#Set Administrador Caixa Privileges
#Administrador Caixa Select Privileges 
Grant Select on gestao_artigos_db.v_artigos to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_clientes to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_clientes to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_empregados to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_empregados to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_encomendas to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_horarios_empregados to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_horas_empregados to 'administrador.caixa'@'localhost';
Grant Select on gestao_artigos_db.v_vendas to 'administrador.caixa'@'localhost';

#Administrador Caixa Insert Privileges 
Grant Insert on gestao_artigos_db.utilizador to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.empregado to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.cliente to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.telemovel to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.horario to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.venda to 'administrador.caixa'@'localhost';
Grant Insert on gestao_artigos_db.encomenda to 'administrador.caixa'@'localhost';

#Administrador Caixa Update Privileges 
Grant Update on gestao_artigos_db.v_clientes to 'administrador.caixa'@'localhost';
Grant Update on gestao_artigos_db.v_empregados to 'administrador.caixa'@'localhost';
Grant Update on gestao_artigos_db.v_horarios_empregados to 'administrador.caixa'@'localhost';
Grant Update on gestao_artigos_db.v_vendas to 'administrador.caixa'@'localhost';
Grant Update on gestao_artigos_db.v_encomendas to 'administrador.caixa'@'localhost';

#Administrador Caixa Delete Privileges
Grant Delete on gestao_artigos_db.utilizador to 'administrador.caixa'@'localhost';
Grant Delete on gestao_artigos_db.cliente to 'administrador.caixa'@'localhost';
Grant Delete on gestao_artigos_db.empregado to 'administrador.caixa'@'localhost';
Grant Delete on gestao_artigos_db.encomenda to 'administrador.caixa'@'localhost';
Grant Delete on gestao_artigos_db.venda to 'administrador.caixa'@'localhost';
# ----------------------------------------

# ----------------------------------------
#Set Caixa Privileges
#Caixa Select Privileges 
Grant Select on gestao_artigos_db.v_artigos to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_clientes to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_clientes to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_empregados to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_empregados to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_encomendas to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_horarios_empregados to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_horas_empregados to 'caixa'@'localhost';
Grant Select on gestao_artigos_db.v_vendas to 'caixa'@'localhost';

#Caixa Insert Privileges 
Grant Insert on gestao_artigos_db.utilizador to 'caixa'@'localhost'; 
Grant Insert on gestao_artigos_db.cliente to 'caixa'@'localhost'; 
Grant Insert on gestao_artigos_db.telemovel to 'caixa'@'localhost'; 
Grant Insert on gestao_artigos_db.venda to 'caixa'@'localhost'; 
Grant Insert on gestao_artigos_db.encomenda to 'caixa'@'localhost'; 

#Caixa Update Privileges 
Grant Update on gestao_artigos_db.v_clientes to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.v_telemovel_clientes to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.v_vendas to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.v_encomendas to 'caixa'@'localhost'; 

#Caixa Delete Privileges
Grant Delete on gestao_artigos_db.utilizador to 'caixa'@'localhost'; 
Grant Delete on gestao_artigos_db.cliente to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.telemovel to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.venda to 'caixa'@'localhost'; 
Grant Update on gestao_artigos_db.encomenda to 'caixa'@'localhost'; 
# ----------------------------------------

# ----------------------------------------
#Set Administrador Armazem Privileges
#Administrador Armazem Select Privileges 
Grant Select(idArtigo, idCat) on gestao_artigos_db.artigo to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_artigos to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.categoria_artigo to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_horarios_empregados to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_encomendas to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_vendas to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_empregados to 'administrador.armazem'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_empregados to 'administrador.armazem'@'localhost';

#Administrador Armazem Insert Privileges
Grant Insert on gestao_artigos_db.utilizador to 'administrador.armazem'@'localhost';
Grant Insert on gestao_artigos_db.empregado to 'administrador.armazem'@'localhost';
Grant Insert on gestao_artigos_db.telemovel to 'administrador.armazem'@'localhost';
Grant Insert on gestao_artigos_db.horario to 'administrador.armazem'@'localhost';
Grant Insert on gestao_artigos_db.categoria_artigo to 'administrador.armazem'@'localhost';
Grant Insert on gestao_artigos_db.artigo to 'administrador.armazem'@'localhost';

#Administrado Armazaem Update Privileges
Grant update on gestao_artigos_db.v_empregados to 'administrador.armazem'@'localhost';
Grant update on gestao_artigos_db.v_telemovel_empregados to 'administrador.armazem'@'localhost';
Grant update on gestao_artigos_db.v_horarios_empregados to 'administrador.armazem'@'localhost';
Grant update on gestao_artigos_db.v_artigos to 'administrador.armazem'@'localhost';
Grant Update(idCat) on gestao_artigos_db.artigo to 'administrador.armazem'@'localhost';

#Administrado Armazaem Update Privileges
Grant Delete on gestao_artigos_db.utilizador to 'administrador.armazem'@'localhost';
Grant Delete on gestao_artigos_db.empregado to 'administrador.armazem'@'localhost';
Grant Delete on gestao_artigos_db.telemovel to 'administrador.armazem'@'localhost';
Grant Delete on gestao_artigos_db.horario to 'administrador.armazem'@'localhost';
Grant Delete on gestao_artigos_db.artigo to 'administrador.armazem'@'localhost';
Grant Delete on gestao_artigos_db.categoria_artigo to 'administrador.armazem'@'localhost';
# ----------------------------------------

# ----------------------------------------
#Set Produção Privileges
#Produção Select Privileges 
Grant Select(idArtigo, idCat) on gestao_artigos_db.artigo to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_artigos to 'producao'@'localhost';
Grant Select on gestao_artigos_db.categoria_artigo to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_horarios_empregados to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_encomendas to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_vendas to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_empregados to 'producao'@'localhost';
Grant Select on gestao_artigos_db.v_telemovel_empregados to 'producao'@'localhost';

#Produção Insert Privileges
Grant Insert on gestao_artigos_db.artigo to 'producao'@'localhost';
Grant Insert on gestao_artigos_db.categoria_artigo to 'producao'@'localhost';

#Produção Update Privileges
Grant Update(idCat) on gestao_artigos_db.artigo to 'producao'@'localhost';
Grant Update on gestao_artigos_db.v_artigos to 'producao'@'localhost';

#Produção Delete Privileges
Grant Delete on gestao_artigos_db.artigo to 'producao'@'localhost';
Grant Delete on gestao_artigos_db.categoria_artigo to 'producao'@'localhost';
