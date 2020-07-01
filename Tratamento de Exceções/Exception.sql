#############################
# 1) TRATAMENTO DE EXCEÇÕES # 
#############################
# 1.1 Definição
-- Tratamento de exceção são técnicas utilizadas para contornar eventuais
-- problemas durante a execução de sistemas, utilizando procedimentos ou funções.
# 1.2 Vantagens
-- Impede que o programas seja abortados durante a execução de maneira imediata.
-- Promove maior robustez nas aplicações.
-- Permite que uma solução alternativa seja adotada sem prejudicar a execução de todo o fluxo do sistema.
# 1.3 Diagrama
# 1.4 Características
-- Durante o desenvolvimento de um procedimento ou função, o desenvolvedor deve prever quais tipos de erros
--  podem ocorrer em execução.
-- A partir do mapeamento dos possíveis erros, incluir os respectivos tratamentos na aplicação.
# 1.5 Exemplo de possíveis erros 
-- Inserir registro que viola uma chave primária.
-- Inserir registro que viola uma chave estrangeira.
-- Utilizar atribuição de mais de um valor para uma variável através do SELECT – INTO.
-- Não retornar nenhum valor em comando de atribuição SELECT – INTO.
-- Inserir um tipo de dado incompatível com uma coluna.
# 1.6 Tratamento de exceção nas diferentes tecnologias
-- MySQL: Instrução Handler
-- SQLSERVER: Try-Catch
-- Oracle: Cláusula Exceptions
#################
# 2) EXEMPLO 01 #
#################
-- Desenvolver uma função que retorna o salário de um determinado funcionário
-- Parâmetros: Sobrenome do Funcionario
-- Retorno: Salário do Funcionário
SET
  GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $ $ CREATE FUNCTION RetornarSalario(SobrenomeProcurado VARCHAR(100)) RETURNS NUMERIC BEGIN DECLARE SalarioApurado NUMERIC;

SELECT
  SALARIO INTO SalarioApurado
FROM
  EMPREGADOS
WHERE
  SOBRENOME = SobrenomeProcurado;

RETURN SalarioApurado;

END $ $ DELIMITER;

SELECT
  RetornarSalario('King');

-- Adicionando um tratamento de exceção
DELIMITER $ $ CREATE FUNCTION RetornarSalarioException(SobrenomeProcurado VARCHAR(100)) RETURNS NUMERIC BEGIN DECLARE SalarioApurado,
Erro NUMERIC;

DECLARE CONTINUE HANDLER FOR 1172
SET
  Erro = 1;

SELECT
  SALARIO INTO SalarioApurado
FROM
  EMPREGADOS
WHERE
  SOBRENOME = SobrenomeProcurado;

-- Retornar o menor salario caso existe mais de uma linha
IF Erro = 1 THEN
SELECT
  MIN(SALARIO) INTO SalarioApurado
FROM
  EMPREGADOS
WHERE
  SOBRENOME = SobrenomeProcurado;

END IF;

RETURN SalarioApurado;

END $ $ DELIMITER;

SELECT
  RetornarSalarioException('King');

#################
# 3) EXEMPLO 02 #
#################
-- Desenvolver uma procedure que escreve o nome completo do funcionário.
-- Parâmetros: Sobrenome do funcionário.
-- Em caso de erro, apresentar mensagem amigável.
DELIMITER $ $ CREATE PROCEDURE EscreveNomeCompleto(SobrenomeProcurado VARCHAR(100)) BEGIN DECLARE SalarioApurado,
Erro NUMERIC;

DECLARE NomeCompleto VARCHAR(100);

DECLARE EXIT HANDLER FOR 1172
SELECT
  'Existe mais de um funcionário com o mesmo sobrenome' AS 'MENSGEM DE ERRO';

SELECT
  CONCAT(NOME, " ", SOBRENOME) INTO NomeCompleto
FROM
  EMPREGADOS
WHERE
  SOBRENOME = SobrenomeProcurado;

SELECT
  NomeCompleto;

END $ $ DELIMITER;

CALL EscreveNomeCompleto('King');

#################
# 3) EXEMPLO 03 #
#################
-- Desenvolver uma procedure que cadastra um departamento.
-- Parâmetros:
-- ID do novo departamento.
-- Nome do novo departamento.
-- ID da localidade.
DELIMITER $ $ CREATE PROCEDURE CadastrarDepto(
  ID_Depto DECIMAL(4, 0),
  Nome_Depto VARCHAR(30),
  ID_Local DECIMAL(4, 0)
) BEGIN IF ID_Depto IS NOT NULL THEN
INSERT INTO
  DEPARTAMENTOS(
    DEPARTAMENTO_ID,
    DEPARTAMENTO_NOME,
    LOCALIDADE_ID
  )
VALUES
  (ID_Depto, Nome_Depto, ID_Local);

ELSE
SELECT
  'O Campo id é obrigatorio';

END IF;

END $ $ DELIMITER;

-- Cadastrando um departamento duclicado
CALL CadastrarDepto(250, 'GERENCIA', 1);

-- 1062
-- Cadastrando, incluindo um departamento em uma localidade inexistente
CALL CadastrarDepto(2000, 'GERENCIA', 1);

-- 1452
DELIMITER $ $ CREATE PROCEDURE CadastrarDeptoException(
  ID_Depto DECIMAL(4, 0),
  Nome_Depto VARCHAR(30),
  ID_Local DECIMAL(4, 0)
) BEGIN DECLARE LocalPadrao,
Erro INT;

DECLARE CONTINUE HANDLER FOR 1062
SET
  Erro = 2;

DECLARE CONTINUE HANDLER FOR 1452
SET
  Erro = 1;

SET
  LocalPadrao = 1500;

IF ID_Depto IS NOT NULL THEN
INSERT INTO
  DEPARTAMENTOS(
    DEPARTAMENTO_ID,
    DEPARTAMENTO_NOME,
    LOCALIDADE_ID
  )
VALUES
  (ID_Depto, Nome_Depto, ID_Local);

ELSE
SELECT
  'O Campo id é obrigatorio';

END IF;

IF Erro = 1 THEN
INSERT INTO
  DEPARTAMENTOS(
    DEPARTAMENTO_ID,
    DEPARTAMENTO_NOME,
    LOCALIDADE_ID
  )
VALUES
  (ID_Depto, Nome_Depto, LocalPadrao);

SELECT
  'Departamento cadastrado na localidade padrao' AS RESULTADO;

END IF;

IF Erro = 2 THEN
SELECT
  'Chave Primaria informada esta duplicada' AS RESULTADO;

END IF;

END $ $ DELIMITER;

-- Cadastrando um departamento duclicado
CALL CadastrarDeptoException(250, 'GERENCIA', 1);

-- 1062
-- Cadastrando, incluindo um departamento em uma localidade inexistente
CALL CadastrarDeptoException(2000, 'GERENCIA', 1);

-- 1452
################
# 4) CONCLUSÃO #
################
-- Tratamento de exceções são recursos que podem ser utilizados no desenvolvimento das aplicações.
-- Garantem mais robustez e qualidade ao código.
-- Não causam impacto no desempenho dos programas.
-- Impedem que a aplicação aborte sua execução, contornando eventuais problemas.