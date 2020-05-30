##############################
# 1) ESTRUTURAS DE REPETIÇÃO # 
##############################

# 1.1 Definição
-- Estruturas de repetição são instruções que permitem a execução de um
-- bloco de código repetidamente, de acordo com alguma regra definida na
-- estrutura.

# 1.2 Tipos
-- Estruturas com contadores implícitos
-- Ex.: FOR (não disponível no MySQL).

-- Estruturas que executam testes lógicos antes do bloco de instruções
-- Ex.: WHILE.

-- Estruturas que executam testes lógicos depois do bloco de instruções
-- Ex.: REPEAT, LOOP.

###################################
# 2) ESTRUTURA DE REPETIÇÃO WHILE #
###################################

-- Estrutura de repetição que executa um teste lógico em seu início, como condição de parada da repetição.

-- Recomendável para situações em que o bloco de código pode não ser executado ou ser executado várias vezes.

-- No exemplo a seguir, uma estrutura de repetição que procura o primeiro funcionário do quadro de funcionários,
-- que possui um cargo especificado no parâmetro.

DELIMITER $$

CREATE PROCEDURE ExibirCargo(CargoEspecifico VARCHAR(50))
BEGIN
	DECLARE CodEmpregado, Contador INT;
    DECLARE NomeProcurado, SobrenomeProcurado, CargoProcurado VARCHAR(100);
    
    SELECT MIN(EMPREGADO_ID) INTO CodEmpregado FROM EMPREGADOS;
    
    SELECT NOME, SOBRENOME, CARGO_ID INTO NomeProcurado, SobrenomeProcurado, CargoProcurado
    FROM EMPREGADOS WHERE EMPREGADO_ID = CodEmpregado;
    
    SET CodEmpregado = CodEmpregado + 1;
    
    Repetir: WHILE NomeProcurado IS NOT NULL DO
			 IF CargoProcurado = CargoEspecifico THEN
				SELECT NomeProcurado, SobrenomeProcurado; -- Exibindo o funcionario encontrado
			    LEAVE Repetir; -- Saindo do laço de repetição
			 END IF;
             
             SELECT NOME, SOBRENOME, CARGO_ID INTO NomeProcurado, SobrenomeProcurado, CargoProcurado
			 FROM EMPREGADOS WHERE EMPREGADO_ID = CodEmpregado;
    
			 SET CodEmpregado = CodEmpregado + 1;
             
			 END WHILE;
    
END $$

DELIMITER ;

CALL ExibirCargo('SH_CLERK');

###################################
# 2) ESTRUTURA DE REPETIÇÃO REPEAT #
###################################

-- Estrutura de repetição que executa um teste lógico em seu final, como condição de parada da repetição.
-- Recomendável para situações em que o bloco de código é executado pelo menos uma vez, 
-- mas pode ser executado várias vezes.

DELIMITER $$

CREATE PROCEDURE ExibirCargoRepeat(CargoEspecifico VARCHAR(50))
BEGIN
	DECLARE CodEmpregado, Contador INT;
    DECLARE NomeProcurado, SobrenomeProcurado, CargoProcurado VARCHAR(100);
    
    SELECT MIN(EMPREGADO_ID) INTO CodEmpregado FROM EMPREGADOS;
    
    REPEAT
           
        SELECT NOME, SOBRENOME, CARGO_ID INTO NomeProcurado, SobrenomeProcurado, CargoProcurado
	    FROM EMPREGADOS WHERE EMPREGADO_ID = CodEmpregado;
    
	    SET CodEmpregado = CodEmpregado + 1;
        
        IF CargoProcurado = CargoEspecifico THEN
			SELECT NomeProcurado, SobrenomeProcurado; -- Exibindo o funcionario encontrado
	    END IF;
	
    UNTIL CargoProcurado = CargoEspecifico
	END REPEAT;
    
END $$

DELIMITER ;

CALL ExibirCargoRepeat('SH_CLERK');

##################################
# 3) ESTRUTURA DE REPETIÇÃO LOOP #
##################################

-- Estrutura de repetição que executa o teste lógico em qualquer ponto do bloco, à escolha do programador.
-- Recomendável para situações em que o bloco de código é executado nenhuma, uma vez ou executado várias vezes.

DELIMITER $$

CREATE PROCEDURE ExibirCargoLoop(CargoEspecifico VARCHAR(50))
BEGIN
	DECLARE CodEmpregado, Contador INT;
    DECLARE NomeProcurado, SobrenomeProcurado, CargoProcurado VARCHAR(100);
    
    SELECT MIN(EMPREGADO_ID) INTO CodEmpregado FROM EMPREGADOS;
    
    SELECT NOME, SOBRENOME, CARGO_ID INTO NomeProcurado, SobrenomeProcurado, CargoProcurado
    FROM EMPREGADOS WHERE EMPREGADO_ID = CodEmpregado;
    
    SET CodEmpregado = CodEmpregado + 1;
    
    Repetir: LOOP
    
			 IF CargoProcurado = CargoEspecifico THEN
				SELECT NomeProcurado, SobrenomeProcurado; -- Exibindo o funcionario encontrado
			    LEAVE Repetir; -- Saindo do laço de repetição
			 END IF;
             
             SELECT NOME, SOBRENOME, CARGO_ID INTO NomeProcurado, SobrenomeProcurado, CargoProcurado
			 FROM EMPREGADOS WHERE EMPREGADO_ID = CodEmpregado;
    
			 SET CodEmpregado = CodEmpregado + 1;
             
			 END LOOP;
    
END $$

DELIMITER ;

CALL ExibirCargoLoop('SH_CLERK');