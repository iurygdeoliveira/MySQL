# 4 - BASES E CONCEITOS

# 4.1 - DEFINIÇÃO DE BANCO DE DADOS

# 4.1.1 - São coleções organizadas de dados que se relacinam de forma a criar algum
		-- sentido (Informação). Essa coleção de dados é gerida por um sistema que
		-- garante que esses dados permaneçam íntegros e atendam a alguns princípios
		-- básicos que veremos mais para frente

# 4.1.2 - Informações relacionadas
# 4.1.3 - Aborda assunto em específico
# 4.1.4 - Banco de Dados vs Bando de Dados
# 4.1.5 - Não há somente uma resposta  


# 4.2 - O QUE É UM SGBD

# 4.2.1 - Capacidade de gerenciar, interagir e manipular as informações do banco de dados
# 4.2.2 - Responsável por controlar a concorrência de requisições
# 4.2.3 - Disponibiliza gatilhos para manter a integridade das informações
# 4.2.4 - Garante a segurança que somente usuários com permissão possam ter 
		-- qualquer tipo de interação com o banco de dados (leitura, escrita,
		-- alteração, remoção...)
# 4.2.5 - Controla o fluxo de informações para não gerar redundância de informações


# 4.3 - ABSTRAÇÃO E PROJEÇÃO

# 4.3.1 - Compreender o processo "humano" e transcrever de maneira lógica e organizada
# 4.3.2 - Organizar, segmentar, analisar todas as informações necessárias e exportar de
        -- maneira que o SGDB compreenda

# 4.4 - BANCO DE DADOS SQL

# 4.4.1 -- Relacional
		--  Todas as informações são relacionadas em torno de um problema que deve ser resolvido
		--  Modelo de Entidade-Relacionamento
		--  Relacionamento 1..1
		--  Relacionamento 1..N
		--  Relacionamento N..M

# 4.4.2 -- Transacional
		-- Uma sequência de processos, que quando executadas formam apenas uma ação
		
        -- 4 Atributos ACID
		
        -- Gerenciado na maioria das vezes pela própria aplicação, mas há a possibilidade
		-- de forçar o uso em determinadas situações

# 4.4.3 -- Normalizado
		-- Tem se normalizado, um banco que atende as 5 formas normais
		
        -- Um banco normalizado nas 5 formas normais tende a ser semânticamente melhor, organização
		-- porém com perda de desempenho
		
        -- Um banco não normalizado (desnormalizado) tende a ter um desempenho melhor, 
		-- porém pode existir perca de semântica

# 4.5 - ATRIBUTOS ACID

# 4.5.1 - Atomicidade: Todo processo deve ter um fim, e quando executado com falha deve ser
		-- desprezada as informações (rollback), e quando finalizada com sucesso devem ser escritas
		-- no repositório (commit)

# 4.5.2 - Consistência: Todos os processos devem ser executados obedecendo todas as regras
		-- e restrições impostas (valores únicos [UNIQUE], chaves estrangeiras [Foreing Key],
		-- valores não nulos [NOT NULL]...)

# 4.5.3 - Isolamento: Nenhuma transação pode afetar outra em andamento. Se elas forem
		-- concorrentes (alteram a mesma tabela por exemplo) uma deve ser finalizada antes
		-- que outra possa ser executada. Nesse momento a transação fica numa fila chamada "spool"

# 4.5.4 - Durabilidade ou Persistência: Toda informação escrita no repositório só pode ser
		-- desfeita/refeita por outra transação. Isso significa que não pode ser suscetível a
		-- erros de hardware por exemplo

# 4.6 - FUNCIONAMENTO BÁSICO

# 4.6.1 - Banco de Dados: Conjunto de Tabelas
# 4.6.2 - Tabelas (Entidade): Conjunto de campos com linhas
# 4.6.3 - Campos (Atributos): Responsável por armazenar uma informação. 
		-- E este possui parâmetros e valores para configuração
# 4.6.4 - Linhas (Registros): Uma informação pertinente ao campo da tabela
# 4.6.5 - Parâmetros e valores: Pertinentes aos campos/atributos
		-- Tipo; Númerico, texto, data/hora
        -- Permite nulo ?
        -- Auto Incremento ?


# 4.7 - CARACTERÍSTICAS BÁSICAS

# 4.8 - SITE OFICIAL E DOCUMENTAÇÃO
 -- https://github.com/mysql/mysql-server
 -- https://dev.mysql.com/doc/
		





 











