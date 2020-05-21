############################################
# 1) POR QUE PROGRAMAR EM BANCO DE DADOS ? #
############################################
-- 1.1 Otimização da utilização do recurso do SGBD (sistema gerenciador de banco de dados)
--  Drivers de conexão não são utilizados.
--  Trafego de dados pela rede é reduzido.
--  O código é executado na mesma estrutura de memória em que estão os dados.
-- 1.2 Redução do overhead de conexão.
-- 1.3 Desempenho
-- O código é nativo
-- 1.4 Segurança
-- Os dados são processados internamente
-- 1.5 Integração com linguagens de programação de servidor, permitindo redução da complexidade das aplicações
-- Ex.: PHP, C#, Java etc
################################
# 2) ESTRUTURAS DE PROGRAMAÇÃO #
################################
-- 2.1 Blocos anônimos
-- Presente apenas em algumas linguagens. (Ex: PL/SQL).
-- 2.2 Stored Procedures (Procedimentos armazenados).
-- 2.3 Functions (Funções).
-- 2.4 Triggers (Gatilhos).
-- 2.5 Views (Visões)
#####################
# 3) VIEWS (VISÕES) #
#####################
-- 3.1 View (visão) é um objeto de banco de dados que armazena uma consulta
-- SQL, de modo que seja possível reutilizá-la sem que seja necessário
-- reescrever a consulta.
-- São tabelas virtuais, relações virtuais, que não armazenam dados fisicamente no banco
-- mas que retornam dados de uma consulta SQL especifica.
-- podem ser criadas e excluidas a qualquer momento, sem que haja perda de dados
-- E como se fosse uma consulta SQL pré-programda no banco, que irá refletir
-- o estado atual
-- Contém linhas e colunas como uma tabela real, e pode receber comandos como uma tabela normal
-- where, join
-- O uso de views é aplicado em consultas SQL rotineiras, para evitar ter que
-- digitar novamente aquela mesma consulta SQL
-- Mostra sempre os resultados de dados atualizados do banco.
-- A Visão consulta as tabelas e recria os dados toda vez
-- que o programador ou aplicação consulta aquela visão
-- 3.2 Vantagens:
-- Reutilização.
-- Restrição de acesso a dados sensíveis.
-- Uma empresa necessita fornecer acesso aos desenvolvedores para que
-- possam realizar consultas e construírem relatórios com informações dos
-- funcionários.
-- Problema: Os desenvolvedores podem ter acesso a informações sensíveis como salário?
-- Solução: Criar uma view que disponibilize apenas as informações que os desenvolvedores possam ter acesso.
-- retirando colunas ou mascarando dados
-- Utilização de nomes significativos.
-- 3.3 Tipos
-- View simples.
-- View complexa.
-- View Materializadas.
###############
# 5) EXEMPLO  #
###############
-- Suponha que desejemos calcular a média de nota de aluno, por curso
SELECT
  A.nome AS 'Nome do Aluno',
  C.nome AS 'Nome do Curso',
  AVG(N.nota) AS 'Médias de Notas'
FROM nota N
JOIN resposta R ON R.id = N.resposta_id
JOIN exercicio E ON E.id = R.exercicio_id
JOIN secao S ON S.id = E.secao_id
JOIN curso C ON C.id = S.curso_id
JOIN aluno A ON A.id = R.aluno_id
GROUP BY
  C.nome,
  A.nome;
-- Para se criar uma visão
  CREATE VIEW vw_MEDIAS_DO_CURSO AS
SELECT
  A.nome AS 'Nome do Aluno',
  C.nome AS 'Nome do Curso',
  AVG(N.nota) AS 'Médias de Notas'
FROM nota N
JOIN resposta R ON R.id = N.resposta_id
JOIN exercicio E ON E.id = R.exercicio_id
JOIN secao S ON S.id = E.secao_id
JOIN curso C ON C.id = S.curso_id
JOIN aluno A ON A.id = R.aluno_id
GROUP BY
  C.nome,
  A.nome;
-- Usando a view
SELECT
  *
FROM vw_MEDIAS_DO_CURSO;
-- Alterando tabelas que estão inclusas em uma view
UPDATE aluno
set
  nome = 'Amado Amoroso Amável'
WHERE
  id = 2;
-- Para alterar uma visão
  ALTER VIEW vw_MEDIAS_DO_CURSO AS
SELECT
  A.nome AS 'Nome do Aluno',
  AVG(N.nota) AS 'Médias de Notas'
FROM nota N
JOIN resposta R ON R.id = N.resposta_id
JOIN aluno A ON A.id = R.aluno_id
GROUP BY
  A.nome;
############################
  # 6) VIEWS MATERIALIZADAS  #
  ############################
  -- Views comuns armazenam a consulta SQL.
  -- Views materializadas armazenam os resultados de consultas
  -- Comportamento semelhante ao de tabelas.
  -- Views materializadas são utilizadas para melhoria de desempenho de
  -- consultas.
  ALTER VIEW vw_MEDIAS_DO_CURSO AS
SELECT
  A.nome AS 'Nome do Aluno',
  C.nome AS 'Nome do Curso',
  AVG(N.nota) AS 'Médias de Notas'
FROM nota N
JOIN resposta R ON R.id = N.resposta_id
JOIN exercicio E ON E.id = R.exercicio_id
JOIN secao S ON S.id = E.secao_id
JOIN curso C ON C.id = S.curso_id
JOIN aluno A ON A.id = R.aluno_id
GROUP BY
  C.nome,
  A.nome;
CREATE TABLE TBL_VM_MEDIAS_DO_CURSO AS
SELECT
  *
FROM vw_MEDIAS_DO_CURSO;
##################
  # 7) CONCLUSÕES  #
  ##################
  -- Views são objetos muito úteis em bancos de dados.
  -- Podem ser reutilizadas.
  -- Podem proteger os dados.
  -- Não causam impacto no desempenho das consultas.