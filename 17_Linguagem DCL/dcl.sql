####################
# 1) LINGUAGEM DCL # 
####################

# 1.1 Definição
-- Em linguagens de programação em bancos de dados, existem os seguintes tipos de linguagens:
-- DML – Data Manipulation Language.
-- DDL – Data Definition Language.
-- DQL ou SQL – Data Query Language.
-- DCL – Data Control Language.

# 1.2 Características
-- Linguagem para definição de usuários.
-- Linguagem para controle de acesso aos objetos.
-- Linguagem para definição e limitação de recursos disponíveis para os usuários.

# 1.3 Definição de Usuários
-- Com instruções DCL são criados novos usuários de banco de dados.
-- É possível definir quais acessos o usuário terá no banco de dados no momento de criação ou posteriormente.

#################
# 2) PERMISSÕES # 
#################

# 2.1 Permissões de acesso
-- Para que um usuário possa acessar os objetos do banco de dados, é
-- necessário que ele possua as atribuições explicitamente dadas pelo
-- administrador.

# 2.2 Tipos de permissões

-- ALL [PRIVILEGES] EVENT
-- ALTER
-- EXECUTE
-- CREATE
-- FILE
-- CREATE USER
-- INDEX
-- CREATE VIEW
-- INSERT
-- DELETE
-- SELECT
-- DROP
-- TRIGGER
-- UPDATE

# 2.3 Exemplo:
-- Para que o usuário aluno possa acessar as tabelas do banco de dados de
-- recursos humanos, devemos utilizar o comando grant para dar-lhe as
-- permissões necessárias.

# 2.4 Criar usuário
-- Nome do usuário: aluno
CREATE USER aluno@localhost IDENTIFIED BY '.Localhost#13';

# 2.5 Comando GRANT
-- Atribui um determinado privilégio ao usuário.

GRANT SELECT, INSERT, DELETE ON recursos_humanos.* TO aluno@'localhost';
-- Linhas 1 e 2: Atribuindo, ao usuário aluno, permissão de select, insert e 
-- delete em todas as tabelas do banco de dados recursos_humanos. O 
-- caractere * indica que são todas as tabelas.

GRANT ALL ON recursos_humanos.* to aluno@'localhost';
-- Atribuindo todos os privilégios no banco de dados de 
-- bi_recursos_humanos ao usuário aluno.

GRANT FILE ON *.* TO aluno@'localhost';
-- Atribuindo permissão de manipulação de arquivos ao usuário aluno

GRANT SELECT ON rh_externo.dep TO aluno@'localhost' WITH GRANT OPTION;
-- Atribuindo permissão de select na tabela dep, do banco de dados 
-- rh_externo, ao usuário aluno com permissão de admin. Opção admin permite 
-- que o usuário possa atribuir este privilégio a outros usuários.

FLUSH PRIVILEGES;
--  Aplicando as modificações no banco de dados.

# 2.6 Comando REVOKE
-- Remove um determinado privilégio de um usuário.

REVOKE SELECT, INSERT, DELETE ON recursos_humanos.* FROM aluno@'localhost';

REVOKE ALL ON recursos_humanos.* FROM aluno@'localhost';

REVOKE FILE ON *.* FROM aluno@'localhost';

REVOKE SELECT ON rh_externo.dep FROM aluno@'localhost' ;

FLUSH PRIVILEGES;

############
# 3) ROLES # 
############

# 3.1 Definição
-- São objetos que agrupam permissões.
-- Após a criação de uma role, utiliza-se o operador GRANT para dar as
-- permissões que a role irá agrupar.
-- Uma vez definidas as permissões, atribui-se a role a um usuário.

# 3.2 Vantagens
-- Padronização de perfis.
-- Praticidade ao criar novos usuários.
-- Melhor controle administrativo.

# 3.3 Exemplo

CREATE ROLE 'app_developer'@'localhost', 'app_read'@'localhost', 'app_write'@'localhost';

GRANT ALL ON recursos_humanos.* TO 'app_developer';
GRANT SELECT ON recursos_humanos.* TO 'app_read';
GRANT INSERT, UPDATE, DELETE ON recursos_humanos.* TO 'app_write';

CREATE USER 'dev1'@'localhost' IDENTIFIED BY '.Localhost#13';
CREATE USER 'read_user1'@'localhost' IDENTIFIED BY '.Localhost#13';
CREATE USER 'read_user2'@'localhost' IDENTIFIED BY '.Localhost#13';
CREATE USER 'rw_user1'@'localhost' IDENTIFIED BY '.Localhost#13';

GRANT 'app_developer' TO 'dev1'@'localhost';
GRANT 'app_read' TO 'read_user1'@'localhost', 'read_user2'@'localhost';
GRANT 'app_read', 'app_write' TO 'rw_user1'@'localhost';

################################
# 4) GERENCIAMENTO DE RECURSOS # 
################################

# 4.1 Tipos de restrições
-- Quantidade de consultas sql por tempo.
-- Quantidade de atualizações por tempo.
-- Quantidade de conexões por tempo.
-- Quantidade de conexões simultâneas.

# 4.2 Exemplo 03:
-- Modificar o perfil de acesso do usuário aluno, limitando seus recursos.
GRANT ALL ON recursos_humanos.* TO aluno@'localhost'; 
ALTER USER aluno@'localhost' WITH MAX_QUERIES_PER_HOUR 20 
MAX_UPDATES_PER_HOUR 10 
MAX_CONNECTIONS_PER_HOUR 5 
MAX_USER_CONNECTIONS 2;

-- Linha 136: Atribuindo todos os privilégios em recursos_humanos para aluno.
-- Linha 137: Limitando o número de consultas por hora em 20. 
-- Linha 138: Limitando o número de updates por hora em 10. 
-- Linha 139: Limitando o número de conexões por hora em 5.
-- Linha 140: Limitando o número de conexões simultâneas em 2.

#################
# 5) CONCLUSÕES # 
#################

-- A linguagem de programação dcl, embora não muito famosa, existe em todos os bancos para auxiliar na gestão.
-- Um bom controle de acesso traz segurança e desempenho.
-- Os SGBDs utilizam a regra do “quanto menos, melhor”, evitando, assim, atribuições desnecessárias.
 

