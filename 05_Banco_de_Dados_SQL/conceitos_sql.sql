# 5 - BANCO DE DADOS 

# 5.1 - ABSTRAÇÃO E PROJEÇÃO

# 5.1.1 - Compreender o processo "humano" e transcrever de maneira lógica e organizada
# 5.1.2 - Organizar, segmentar, analisar todas as informações necessárias e exportar de
        -- maneira que o SGDB compreenda

# 5.2 - BANCO DE DADOS SQL

# 5.2.1 -- Relacional
		--  Todas as informações são relacionadas em torno de um problema que deve ser resolvido
		--  Modelo de Entidade-Relacionamento
		--  Relacionamento 1..1
		--  Relacionamento 1..N
		--  Relacionamento N..M

# 5.2.2 -- Transacional
		-- Uma sequência de processos, que quando executadas formam apenas uma ação
		
        -- 4 Atributos ACID
		
        -- Gerenciado na maioria das vezes pela própria aplicação, mas há a possibilidade
		-- de forçar o uso em determinadas situações

# 5.2.3 -- Normalizado
		-- Tem se normalizado, um banco que atende as 5 formas normais
		
        -- Um banco normalizado nas 5 formas normais tende a ser semânticamente melhor, organização
		-- porém com perda de desempenho
		
        -- Um banco não normalizado (desnormalizado) tende a ter um desempenho melhor, 
		-- porém pode existir perca de semântica

# 5.3 - ATRIBUTOS ACID

# 5.3.1 - Atomicidade: Todo processo deve ter um fim, e quando executado com falha deve ser
		-- desprezada as informações (rollback), e quando finalizada com sucesso devem ser escritas
		-- no repositório (commit)

# 5.3.2 - Consistência: Todos os processos devem ser executados obedecendo todas as regras
		-- e restrições impostas (valores únicos [UNIQUE], chaves estrangeiras [Foreing Key],
		-- valores não nulos [NOT NULL]...)

# 5.3.3 - Isolamento: Nenhuma transação pode afetar outra em andamento. Se elas forem
		-- concorrentes (alteram a mesma tabela por exemplo) uma deve ser finalizada antes
		-- que outra possa ser executada. Nesse momento a transação fica numa fila chamada "spool"

# 5.3.4 - Durabilidade ou Persistência: Toda informação escrita no repositório só pode ser
		-- desfeita/refeita por outra transação. Isso significa que não pode ser suscetível a
		-- erros de hardware por exemplo
