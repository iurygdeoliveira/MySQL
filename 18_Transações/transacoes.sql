#################
# 1) TRANSAÇÕES # 
#################

# 1.1 Definição
-- Transações em banco de dados são operações encapsuladas em um bloco, chamado -- transação, e que devem acontecer de maneira completa ou o SGBD deve garantir -- que todas as operações serão desfeitas em caso de erro.

-- Uma transação é uma unidade de execução do programa que acessa e
-- possivelmente atualiza vários itens de dados. Normalmente, uma transação
-- é iniciada por um programa do usuário escrito em linguagens de manipulação
-- de dados (normalmente, SQL) ou linguagem de programação. Uma transação é
-- delimitada pelas instruções (ou chamadas de função) na forma de
-- begin (begin / star transaction) e end (end transaction)
-- (silberschatz)

# 1.2 Tudo ou nada
-- Transação acontece de maneira completa, ou não acontece, não existem
-- alterações parciais

########################
# 2) PROPRIEDADES ACID # 
########################

# 2.1 Atomicidade
-- Todas as operações da transação devem refletir no banco de dados, caso
-- contrário, nenhuma das instruções deve ser refletida no banco de dados

# 2.2 Consistência
-- Ao término da execução de uma transação, os dados no banco de dados devem
-- permanecer consistentes

# 2.3 Isolamento
-- Embora várias transações possam ocorrer simultaneamente no banco de dados,
-- nenhuma das transações podem afetar as demais, de modo que, ao final das
-- transações, o banco de dados deve refletir o resultado corretamente, como se
-- estivesse executando cada transação em sequência

# 2.4 Durabilidade
-- Ao final da exeucção de uma transação, o banco de dados deve relfetir e
-- manter as alterações realizadas por ela

# 2.5 - Mostrar Diagrama com os estadados de uma transação 


######################
# 3) EXEMPLO TEÓRICO # 
######################

# 1 Ler valor saque (R$200,00) - Pode ser feito com uma SELECT
# 2 Ler saldo (R$1000,00) - Pode ser feito com uma SELECT
# 3 Subtrair saldo (R$1000,00 - R$200,00) - R$ 800,00 - Pode ser feito com um
#   UPDATE
# 4 Atualizar saldo (R$ 800,00) - Pode ser feito com um UPDATE
# 5 Entregar valor sacado - Comportamento do sistema/hardware resultante

##########################################
# 4) COMANDO QUE DELIMITAM UMA TRANSAÇÃO # 
##########################################

-- START TRAMSACTION
-- BEGIN - END
-- COMMIT
-- ROLLBACK

#################
# 5) EXEMPLO 01 # 
#################

-- Criar uma transação que realiza duas inserções na tabela de dependentes
-- Caso alguma das inserções não seja concluída com sucesso, não deverá ser
-- gravado nada na tabela
-- Caso as duas inserções sejam concluídas, ambas devem persistir em banco
-- de dados

CREATE TABLE DEPENDENTES (
    DEPENDENTE_ID INT AUTO_INCREMENT PRIMARY KEY,
    DEPENDENTE_NOME VARCHAR(100),
    EMPREGADO_ID DECIMAL(6,0)
);

ALTER TABLE DEPENDENTES ADD CONSTRAINT FK_EMP_ID FOREIGN KEY(EMPREGADO_ID)
REFERENCES EMPREGADOS(EMPREGADO_ID)

START TRANSACTION;
    -- INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Fulano',1);
    INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Fulano',101);
    INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Sicrano',100);
COMMIT;

#################
# 6) EXEMPLO 02 # 
#################

-- Demonstrar utilização do SAVEPOINT, para confirmações parciais
-- Melhorar o controle da transação
DELIMTER $$

CREATE PROCEDURE InsereRegistros()
BEGIN 
    START TRANSACTION
        INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Maria da Silva',101);
        SAVEPOINT A;
        INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Fernando Soares',102);
        SAVEPOINT B;
        INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Joaquim Barbosa',105);
        SAVEPOINT C;
        INSERT INTO DEPENDENTES(DEPENDENTE_NOME, EMPREGADO_ID) VALUES ('Daniel Prado',100);
        SAVEPOINT D;
    ROLLBACK TO SAVEPOINT B;
END $$

DELIMITER ;

CALL InsereRegistros();

#################
# 7) CONCLUSÕES # 
#################

-- Transações são unidades lógicas de trabalho, facilitando agestão de mudanças nos dados
-- Transações melhoram o controle de operações efetivas no banco de dados
-- Transações permitem melhor satisfação com relação as regras de negócio, mantendo a consistências
-- dos dados













 

