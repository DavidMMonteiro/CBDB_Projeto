# Create Users
Drop User 'diretor'@'localhost';
CREATE USER If not exists 'administrador.Sistema'@'localhost' IDENTIFIED BY 'adminSistema';
CREATE USER If not exists 'diretor'@'localhost' IDENTIFIED BY 'diretor';
CREATE USER If not exists 'administrador'@'localhost' IDENTIFIED BY 'admin';
CREATE USER If not exists 'faturacao'@'localhost' IDENTIFIED BY 'faturacao';
CREATE USER If not exists 'administrador.caixa'@'localhost' IDENTIFIED BY 'adminCaixa';
CREATE USER If not exists 'caixa'@'localhost' IDENTIFIED BY 'caixa';
CREATE USER If not exists 'administrador.armazem'@'localhost' IDENTIFIED BY 'adminArmazem';
CREATE USER If not exists 'producao'@'localhost' IDENTIFIED BY 'adminArmazem';

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
Grant Select on gestao_artigos_db.* to 'faturacao'@'localhost';

#Faturação Insert Privileges 
Grant Insert on gestao_artigos_db.salario to 'faturacao'@'localhost';

#Faturação Update Privileges 
Grant Update on gestao_artigos_db.salario to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.artigo to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.encomenda to 'faturacao'@'localhost';
Grant Update on gestao_artigos_db.venda to 'faturacao'@'localhost';

#Faturação Delete Privileges
Grant Delete on gestao_artigos_db.salario to 'faturacao'@'localhost';
Grant Delete on gestao_artigos_db.venda to 'faturacao'@'localhost';
Grant Delete on gestao_artigos_db.encomenda to 'faturacao'@'localhost';
# ----------------------------------------

# ----------------------------------------
#Set Administrador Caixa Privileges
#Administrador Caixa Select Privileges 
Grant Select on gestao_artigos_db.* to 'administrador.caixa'@'localhost';
Revoke Select on gestao_artigos_db.v_salario_total from 'administrador.caixa'@'localhost';
Revoke Select on gestao_artigos_db.salario from 'administrador.caixa'@'localhost';