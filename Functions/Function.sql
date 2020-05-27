#############################################
# 1) DESENVOLVIMENTO DE FUNCTIONS OU FUNÇÕES # 
#############################################

# 1.1 Definição
-- Functions, ou Funções, são programas desenvolvidos e armazenados
-- dentro do banco de dados, que geram algum tipo de retorno.

-- E assim como as Stored Procedures ficam armazenados em banco de dados para o
-- posterior reuso.

-- As regras sintáticas e estruturais das functions são as mesmas dos
-- procedimentos, são linguagens estruturais, podem conter blocos aninhados, além
-- de também permitir modularização, ou seja, uma função pode invocar outras
-- funções ou procedimentos durante seu fluxo.

# 1.2 Aplicações
-- Realização de cálculos.
-- Realização de formatação de dados.
-- Realização de conversão de dados.
-- Validações.

# 1.3 Características:
-- Functions são programas que possuem um tipo de retorno.
-- São programas implementados no paradigma Estrutural.
-- Podem possuir blocos aninhados.
-- Podem aumentar o desempenho das aplicações.

#####################
# 2) SINTAXE BÁSICA #
#####################

DELIMITER $$

CREATE FUNCTION NOME_FUNCTION(PARAMETROS) RETURNS TIPO_RETORNO
BEGIN
		SEQUENCIA DE COMANDOS
        RETURN VALOR_DE_RETORNO
END;

DELIMITER ;

#################
# 3) EXEMPLO 01 #
#################

-- Desenvolver uma função que realiza a simulação do aumento de salário dos funcionários.

-- Parâmetros:
-- O código do funcionário.
-- O percentual de aumento desejado.

-- Retorno:
-- O valor do salário com o acréscimo informado como parâmetro.

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION CalcularAumento(CodFuncionario INT, PercentualAumento INT) RETURNS DECIMAL
BEGIN
		DECLARE SalarioAtual, Resultado DECIMAL;
        
        SELECT SALARIO INTO SalarioAtual FROM EMPREGADOS WHERE EMPREGADO_ID = CodFuncionario;
        
        SET Resultado = SalarioAtual + (SalarioAtual * PercentualAumento / 100);
        
        RETURN Resultado;
END $$

DELIMITER ;

SELECT CalcularAumento(101,10) AS "Salário Reajustado";

SELECT CONCAT(NOME," ",SOBRENOME) AS "Nome Completo",
	   SALARIO AS "Salário Antigo",
       CalcularAumento(EMPREGADO_ID,10) AS "Salário Reajustado"
FROM EMPREGADOS;

##################
# 4) EXEMPLO 02  #
##################

-- Desenvolver uma função que realiza a formatação do CPF, incluindo a máscara adequada.

-- Parâmetros:
-- O CPF que será formatado.

-- Retorno:
-- O valor do CPF com os separadores adequados.

DELIMITER $$

CREATE FUNCTION FormatarCPF(CPF VARCHAR(11)) RETURNS VARCHAR(14)
BEGIN
		DECLARE Parte1, Parte2, Parte3, Digito, CPF_FORMATADO VARCHAR(14);
        
        SET Parte1 = SUBSTRING(CPF,1,3);
        SET Parte2 = SUBSTRING(CPF,4,3);
        SET Parte3 = SUBSTRING(CPF,7,3);
        SET Digito = SUBSTRING(CPF,10);
        
        SET CPF_FORMATADO = CONCAT(Parte1,'.',Parte2,'.',Parte3,'-',Digito);
        
        RETURN CPF_FORMATADO;
END $$

DELIMITER ;

SELECT FormatarCPF('09734576511') AS "CPF Formatado";

#################
# 5) EXEMPLO 03 #
#################

-- Desenvolver uma função que verifica se um determinado funcionário irá
-- completar 10 anos de empresa no ano atual, para premiá-lo na festa da
-- empresa.

-- Parâmetros:
-- O código do funcionário.

-- Retorno:
-- A Quantidade de Anos

DELIMITER $$

CREATE FUNCTION CompletarDezAnos(CodFuncionario INT) RETURNS INT
BEGIN
		DECLARE QtdAnos, Retorno INT;
        
        -- YEAR: EXTRAI O ANO DE UMA DATA
        -- CURDATE: CALCULA A DATA ATUAL
        SELECT YEAR(CURDATE()) - YEAR(DATA_ADMISSAO) INTO QtdAnos
        FROM EMPREGADOS
        WHERE EMPREGADO_ID = CodFuncionario;
        
        RETURN QtdAnos;
END $$

DELIMITER ;

SELECT CompletarDezAnos(EMPREGADO_ID) AS "Tempo em Anos", NOME
FROM EMPREGADOS;

#################
# 6) EXEMPLO 04 #
#################

-- Desenvolver uma função que realiza a conversão de moeda. A função deverá converter dólares em reais.

-- Parâmetros:
-- Valor em dólar.

-- Retorno:
-- Valor em reais.

DELIMITER $$

CREATE FUNCTION Converter(Salario DECIMAL(8,2)) RETURNS DECIMAL(8,2)
BEGIN
		DECLARE Cotacao, Valor_Real DECIMAL(8,2);
        
        SET Cotacao = 5.15;
        SET Valor_Real = ROUND(Salario * Cotacao,2);
        
        RETURN Valor_Real;
END $$

DELIMITER ;

SELECT NOME, SOBRENOME, SALARIO AS "Salario em Dolar", Converter(SALARIO) AS "Salario em Reais"
FROM EMPREGADOS;
