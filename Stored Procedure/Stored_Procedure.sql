########################################################################
# 1) DESENVOLVIMENTO DE PROCEDIMENTOS ARMAZENADOS OU STORED PROCEDURES #
########################################################################
# 1.1 Definição
-- Os procedimentos armazenados, ou stored procedures, são programas que
-- ficam armazenados no banco de dados, e tem como características principais a
-- realização de processamentos, manipulação e alteração nos dados, e também não
-- fornecer nenhum tipo de retorno para o ponto da aplicação que fez a chamada.
# 1.2 Aplicações
-- Realização de carga de dados.
-- Realização de transformação de dados.
-- Atualizações em massa nos dados.
-- Validações.
-- Cópias parciais ou totais de dados.
# 1.3 Características:
-- Stored Procedures são programas estáticos e sem retorno.
-- São programas implementados no paradigma Estrutural.
-- Podem possuir blocos aninhados.
-- Podem aumentar o desempenho das aplicações.
#####################
# 2) SINTAXE BÁSICA #
#####################
DELIMITER $$ CREATE PROCEDURE NOME_DA_PROCEDURE(PARAMETROS) BEGIN SEQUENCIA DE COMANDOS
END $$ DELIMITER;
#################
# 3) EXEMPLO 01 #
#################
-- Desenvolver um procedimento que realiza a atualização do salário de um funcionário.
-- Parâmetros:
-- O valor do novo salário.
-- O código do empregado a ter seu salário modificado.
DELIMITER $$ CREATE PROCEDURE AtualizarSalario(NovoSalario NUMERIC, CodEmpregado INT) BEGIN
UPDATE EMPREGADOS
SET
  SALARIO = NovoSalario
WHERE
  EMPREGADO_ID = CodEmpregado;
END $$ DELIMITER;
SELECT
  NOME,
  SALARIO
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = 110;
CALL AtualizarSalario(2500, 110);
##################
  # 4) EXEMPLO 02  #
  ##################
  # Declaração de variáveis
  -- Geralmente realizada no início dos procedimentos. Acompanhada da palavra reservada “DECLARE”.
  -- Os tipos de dados principais que podem ser utilizados são:
  -- TINYINT: Números inteiros pequenos, até 1 Byte.
  -- BIGINT: Números inteiros grandes, até 8 Bytes.
  -- DECIMAL / NUMERIC: Números que permitem casas decimais. Em algumas
  -- versões do MySQL utiliza-se o nome decimal e em outras numeric. São
  -- equivalentes.
  -- CHAR: Caracteres, tipo texto, de ocupação de espaço fixa. Definida em sua criação.
  -- VARCHAR: Caracteres, tipo texto, de ocupação de espaço variável. Cada
  -- informação utiliza apenas o espaço necessário, por isso, variável. A ocupação
  -- máxima é definida em sua criação.
  -- BLOB: Tipo de dados binários. Pode armazenar arquivos, documentos, fotos, etc.
  -- TEXT: Tipo de texto longo. Indicado para campos que necessitam armazenar
  -- informações textuais superiores a 3 mil caracteres aproximadamente, até o
  -- máximo de 4GB de dados textuais.
  # Atribuição de valores
  -- Existem duas formas de atribuir valor a uma variável:
  -- Atribuição direta.
  -- Atribuição utilizando o comando SELECT.
  -- Desenvolver um procedimento que realiza a atualização do salário de um funcionário para o valor do salário mínimo.
  -- Parâmetros:
  -- O código do empregado a ter seu salário modificado.
  DELIMITER $$ CREATE PROCEDURE AtualizarSalarioMinimo(CodEmpregado INT) BEGIN -- Declarando Variáveis
  DECLARE SalarioMinimo NUMERIC;
DECLARE NomeFuncionario VARCHAR(50);
-- ATRIBUIÇÃO DE VALORES
SET
  SalarioMinimo = 1079;
SELECT
  NOME INTO NomeFuncionario
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
-- ATUALIZAÇÃO DOS VALORES
UPDATE EMPREGADOS
SET
  SALARIO = SalarioMinimo
WHERE
  EMPREGADO_ID = CodEmpregado;
-- VERIFICAR AS MUDANÇAS QUE FORAM FEITAS
SELECT
  NomeFuncionario AS "Nome do Funcionario",
  SalarioMinimo AS "Salário Mínimo";
END $$ DELIMITER;
SELECT
  NOME,
  SALARIO
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = 110;
CALL AtualizarSalarioMinimo(110);
#################
  # 5) EXEMPLO 03 #
  #################
  # Estruturas de controle
  -- Para controle de fluxo dentro de procedimentos e funções, temos as
  -- duas estruturas, por padrão:
  -- IF-ELSEIF-ELSE.
  -- CASE-WHEN-ELSE.
  # Desenvolver um procedimento que realiza a atualização do salário para os funcionários que recebem menos que R$3.000,00.
  --  Parâmetros:
  -- O código do empregado a ter seu salário modificado.
  -- O valor percentual do aumento.
  DELIMITER $$ CREATE PROCEDURE AtualizarSalarioBaixo(CodEmpregado INT, Aumento INT) BEGIN -- Declarando Variáveis
  DECLARE SalarioBaixo,
  SalarioFuncionario NUMERIC;
-- ATRIBUIÇÃO DE VALORES
SET
  SalarioBaixo = 3000;
SELECT
  SALARIO INTO SalarioFuncionario
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
-- ATUALIZAÇÃO DOS VALORES
  IF SalarioFuncionario < SalarioBaixo THEN
UPDATE EMPREGADOS
SET
  SALARIO = SALARIO + Aumento
WHERE
  EMPREGADO_ID = CodEmpregado;
END IF;
-- VERIFICAR AS MUDANÇAS QUE FORAM FEITAS
SELECT
  NOME AS "Nome do Funcionario",
  SALARIO AS "Salário Mínimo"
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
END $$ DELIMITER;
SELECT
  NOME,
  SALARIO
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = 110;
CALL AtualizarSalarioBaixo(110, 5000);
#################
  # 6) EXEMPLO 04 #
  #################
  # Desenvolver um procedimento que realiza a atualização do salário dos
  -- funcionários, com as seguinte regras:
  -- Salário menor ou igual a R$1.000,00: Aumento de 30%.
  -- Salário maior que R$1.000,00 e menor que R$2000,00: Aumento de 20%.
  -- Salário maior que R$2.000,00: Aumento de 10%.
  -- Parâmetros:
  -- O código do empregado a ter seu salário modificado.
  DELIMITER $$ CREATE PROCEDURE AtualizarSalarioFaixas(CodEmpregado INT) BEGIN -- Declarando Variáveis
  DECLARE SalarioFuncionario NUMERIC;
-- ATRIBUIÇÃO DE VALORES
SELECT
  SALARIO INTO SalarioFuncionario
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
-- ATUALIZAÇÃO DOS VALORES
  IF SalarioFuncionario <= 1000 THEN
UPDATE EMPREGADOS
SET
  SALARIO = SALARIO * 1.3
WHERE
  EMPREGADO_ID = CodEmpregado;
ELSEIF SalarioFuncionario > 1000
  AND SalarioFuncionario < 2000 THEN
UPDATE EMPREGADOS
SET
  SALARIO = SALARIO * 1.2
WHERE
  EMPREGADO_ID = CodEmpregado;
  ELSE
UPDATE EMPREGADOS
SET
  SALARIO = SALARIO * 1.1
WHERE
  EMPREGADO_ID = CodEmpregado;
END IF;
-- VERIFICAR AS MUDANÇAS QUE FORAM FEITAS
SELECT
  NOME AS "Nome do Funcionario",
  SALARIO AS "Salário Mínimo"
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
END $$ DELIMITER;
SELECT
  NOME,
  SALARIO
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = 110;
CALL AtualizarSalarioFaixas(110);
# Exemplo 04 – Utilizando a instrução Case - When:
  -- A seguir o procedimento “atualizaSalarioFaixas” adaptado para utilização
  -- do operador case.
  -- O código realiza exatamente a mesma lógica, porém com a instrução case
  -- no lugar do bloco “IF - ELSEIF - ELSE”.
  DELIMITER $$ CREATE PROCEDURE AtualizarSalarioFaixasCase(CodEmpregado INT) BEGIN -- Declarando Variáveis
  DECLARE SalarioFuncionario NUMERIC;
-- ATRIBUIÇÃO DE VALORES
SELECT
  SALARIO INTO SalarioFuncionario
FROM EMPREGADOS
WHERE
  EMPREGADO_ID = CodEmpregado;
-- ATUALIZAÇÃO DOS VALORES
  CASE
    WHEN SalarioFuncionario <= 1000 THEN
    UPDATE EMPREGADOS
    SET
      SALARIO = SALARIO * 1.3
    WHERE
      EMPREGADO_ID = CodEmpregado;
      WHEN SalarioFuncionario > 1000
      AND SalarioFuncionario < 2000 THEN
    UPDATE EMPREGADOS
    SET
      SALARIO = SALARIO * 1.2
    WHERE
      EMPREGADO_ID = CodEmpregado;
      ELSE
    UPDATE EMPREGADOS
    SET
      SALARIO = SALARIO * 1.1
    WHERE
      EMPREGADO_ID = CodEmpregado;
  END CASE;
-- VERIFICAR AS MUDANÇAS QUE FORAM FEITAS
    SELECT
      NOME AS "Nome do Funcionario",
      SALARIO AS "Salário Mínimo"
    FROM EMPREGADOS
    WHERE
      EMPREGADO_ID = CodEmpregado;
  END $$ DELIMITER;
CALL AtualizarSalarioFaixasCase(110);