##########################
# 1) TRIGGERS (GATILHOS) # 
##########################
# 1.1 Definição
-- Triggers são programas armazenados em bancos de dados, que são
-- executadas apenas a partir de um evento de DML.
# 1.2 Aplicações
-- Auditoria em Banco de Dados
-- Atualização em histórico de alterações nos dados
-- Segurança nos dados
-- Replicação de dados
# 1.3 Características:
-- São executadas a partir de eventos.
-- Não podem ser chamadas diretamente.
-- Sempre estão associadas a alguma tabela.
-- É parte de uma transação, iniciada pelo comando que dispara a trigger.
############
# 2) TIPOS #
############
# Trigger de linha
-- Executada sempre que uma linha é modificada. Acompanhada pela instrução “for each row”.
-- Uma instrução aque atualiza 50 linhas, fará a trigger executar 50 vezes
# Trigger de instrução
-- Executada apenas uma vez, a cada execução de uma instrução DML, mesmo que a instrução modifique várias linhas.
# Trigger de logon (Em alguns SGBDs apenas)
-- Executada sempre que um determinado usuário se conecta ao banco de dados.
#################
# 3) EXEMPLO 01 #
#################
-- Deseja-se criar um mecanismo de registro de histórico, no qual cada
-- atualização realizada em algum registro da tabela regioes deverá ser
-- registrado em tabela de auditoria.
-- Para isto, será gravado, na tabela regioes_audit, os dados antigos e novos
-- em cada atualização.
-- Criando a Tabela auditoria
CREATE TABLE REGIOES_AUDIT (
    REGIAO_ID_ANTIGO NUMERIC,
    REGIAO_NOME_ANTIGO VARCHAR(100),
    REGIAO_ID_NOVO NUMERIC,
    REGIAO_NOME_NOVO VARCHAR(100),
    OPERACAO VARCHAR(10)
);

-- SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $ $ -- atualizar depois
CREATE TRIGGER TRG_ATUALIZACAO_REGIAO
AFTER
UPDATE
    ON REGIOES FOR EACH ROW BEGIN
INSERT INTO
    REGIOES_AUDIT
VALUES
    (
        OLD.REGIAO_ID,
        OLD.REGIAO_NOME,
        NEW.REGIAO_ID,
        NEW.REGIAO_NOME,
        'UPDATE'
    );

END $ $ DELIMITER;

UPDATE
    REGIOES
SET
    REGIAO_NOME = 'America Latina/Norte'
WHERE
    REGIAO_ID = 2;

SELECT
    *
from
    REGIGOES_AUDIT;

#################
# 3) EXEMPLO 02 #
#################
-- Deseja-se criar um mecanismo que impeça inserções indevidas na tabela de países.
-- O departamento responsável afirma que nenhum outro país deve ser incluído na
-- base de dados, pois não haverá expansão para novos territórios da empresa.
-- antes da inserção
DELIMITER $ $ CREATE TRIGGER TGR_INSERIR_PAIS BEFORE
INSERT
    ON PAISES FOR EACH ROW BEGIN SIGNAL SQLSTATE '45001'
SET
    MESSAGE_TEXT = 'Não é permitida a inclusão de novos paises';

END $ $ DELIMITER;

INSERT INTO
    PAISES
VALUES
    (99, 'Araguaína', 1);

#################
# 4) EXEMPLO 03 #
#################
-- Deseja-se criar um mecanismo que implemente deleções lógicas de países.
-- Cada vez que um país for removido da tabela de países, seus dados devem
-- ser mantidos em uma tabela de histórico de modo que, mesmo se um
-- registro for excluído, ele estará disponível para eventuais consultas.
-- CRIANDO TABELA
-- O WHERE SEMPRE SERÁ FALSO, LOGO ELE NÃO TRARÁ NENHUM RESULTADO, COPIARÁ APENAS A ESTRUTURA
CREATE TABLE HISTORICO_PAISES AS
SELECT
    *
FROM
    PAISES
WHERE
    1 <> 1;

DELIMITER $ $ CREATE TRIGGER TGR_REMOCAO_PAIS BEFORE DELETE ON PAISES FOR EACH ROW BEGIN
INSERT INTO
    HISTORICO_PAISES
VALUES
    (OLD.PAIS_ID, OLD.PAIS_NOME, OLD.REGIAO_ID);

END $ $ DELIMITER;

DELETE FROM
    PAISES
WHERE
    PAIS_ID = 'ZW';

SELECT
    *
FROM
    historico_pais;

################
# 5) CONCLUSÃO #
################
-- Triggers são objetos que podem ser úteis na gestão e na auditoria dos dados.
-- São mais eficientes que recursos de auditoria disponíveis nos SGBD’s.
-- Devem ser utilizadas com cuidado, pois causam impacto nas operações de DML.