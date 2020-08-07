###########################
# 1) PESQUISAS FULL TEXT  # 
###########################

# 1.1 Definição
-- Full text search é um mecanismo de busca em textos longos. A pesquisa é
-- realizada utilizando nos termos da consulta o texto que foi digitado pelo usuário

# 1.2 OPERADOR LIKE
-- É possível utilizar operador Like para pesquisas em texto.
-- Em grandes textos ou muitas combinações no filtro = Lentidão.
-- Em muitas situações não utiliza índices, diferente do full text search que possui índice próprio.
-- Com o Full text search podemos realizar as mesmas comparações do Like, porém com melhor desempenho.
-- Apresenta mais mecanismos de pesquisa.

# 1.3 Arquitetura do full text search

#####################################
# 2) Elementos do Full Text Search  # 
#####################################

# 2.1 Índices
-- Definidos na estrutura da tabela.

# 2.2 Operador Match
-- Em uma consulta, este operador define em quais colunas a busca será realizada.

# 2.3 Operador Against
-- Operador responsável pela busca, recebendo os termos a serem localizados pela consulta.

##############
# 3) EXEMPLO # 
##############

# 3.1 - Criando tabela com indices fulltext
CREATE TABLE FILMES (
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
TITULO VARCHAR(100) NOT NULL UNIQUE,
RESENHA LONGTEXT,
HORA TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FULLTEXT KEY (RESENHA) -- CRIANDO UM ÍNDICE FULLTEXT
) ENGINE=InnoDB default charset=utf8;

# 3.2 - Inserindo os dados na tabela

INSERT INTO FILMES(TITULO,RESENHA,HORA) VALUES ("O Homem de Aço","A ideia era recriar o super-herói do zero, como se nada do
 que tivesse sido feito sobre ele antes interessasse (talvez pelo último filme, que
 na minha opinião foi incompreendido, não ter alcançado o sucesso esperado). O primeiro
 passo foi chamar  Christopher Nolan para produzir, diretor que fez muito sucesso com
 os bons filmes do Batman. Assim, o filme segue os mesmos moldes do homem-morcego, e
 finca o universo dentro do realismo. Funcionou com Batman, que é um homem 'comum', com
 o homem de aço não funcionou da mesma forma. Pior ainda, para que nada remetesse aos
 filmes anteriores, excluíram a clássica trilha de John Williams que é uma das mais
 icônicas e memoráveis da história do cinema. Posso lhes dizer que talvez esse filme
 caia no esquecimento, mas a trilha clássica perdurará enquanto existir cinema. 
Vamos então falar de um grande acerto do filme, que é a escolha do elenco. Começando pelo
 próprio Superman, que ganha as feições de Henry Cavill, que se mostra como a melhor 
 escolha desde que Christopher Reeve vestiu a capa, sendo que fisicamente talvez ele s
 eja ainda melhor. Seu pai biológico é bem interpretado por Russel Crowe e está bem 
 na Terra com Kevin Costner e Diana Lane como seus pais adotivos e Amy Adams como Lois Lane;
 e pra completar um Michael Shannon ainda mais psicopata do que estamos acostumados.
 A menção honrosa vai para Laurence Fishburne como Perry White, que está no filme porque
 seu personagem não podia ter ficado de fora.","2017-08-04 07:54:29");
 
 INSERT INTO FILMES(TITULO,RESENHA,HORA) VALUES ("STAR WARS: OS ÚLTIMOS JEDI","A primeira sensação que tive ao ver os momentos iniciais de Star Wars:
 Os Últimos Jedi não foi de nostalgia, essa sensação tivemos ao ver o Despertar da Força.
 Essa foi mais aquela sensação de curiosidade em saber qual seria o rumo de todo esse universo
 que conhecemos. Bom, temos um rumo a todos que conhecemos, alguns inclusive tomas caminhos bem
 definidos e sem dizer que a representação da força está muito bem definida nessa versão com 
 direito a force push e tudo. Mas mesmo assim alguns assuntos para mim não foram resolvidos.
 Acho que é só eu que acho, mas parece-me que a questão de vilões bons que são mortos sem serem 
 bem expostos ainda continua na franquia, um exemplo é a capitã Phasma, que acredito que deveria
 continuar a atazanar a vida do Fin. Sim, deveria ser uma pedra no sapato do personagem maior.
 Outro assunto seria a origem do Grande Líder Supremo, já que não nos é revelado no filme como
 foi que ele conheceu toda essa questão da força e todo o resto. Sei que nos primeiros episódios
 quando é revelado que o Palpatine é um Sith as informação aparecem como que mágicas e toda a ordem
 Jedi toma conhecimento do Sith, mas lá é diferente, já que eles sabiam que tinha um Sith rondando,
 só não sabiam quem era. Dessa vez não é mencionado essa questão de Sith, e em momento algum é dito
 o que realmente Snoke é. Sem dizer as especulações que advém de todos os lugares. Mas aí no filme,
 quando estava todo concentrado esperando a explicação de ele ter surgido do nada na história… Nada
 acontece e ele é derrotando tão de repente como foi quando surgiu na franquia pela primeira vez.
 Mas acredito que ele morreu para completar o treinamento de Kilo Ren, ainda mais quando o vilão diz
 que precisava matar Rey para que o treinamento fosse completado. Se formos ver os ensinamentos do
 lado sombrio que o Kylo deve ter recebido de Luke, é lógico que o mestre deveria ser executado para 
 assim o caminho sombrio ser completado e revelar um dos ensinamentos sith de que o aprendiz sempre
 fara de tudo para tomar o lugar o mestre. Foi o que aconteceu e em minha opinião de forma prematura.
 Acredito que eles fizeram isso por não terem uma ideia boa o bastante para justificar a presença do 
 vilão na parte filmística. As informações dizem que a estória de Snoke será contada em aventuras
 narrativas, ou seja, em livros. O que para mim é uma pena. Por isso digo que o destino deste vilão
 não foi completado, seria como a origem de Darh Maul que da mesma forma que surgiu foi logo
 desaparecido e tendo sido seu lado completado no universo expandido, que mesmo assim não foi
 completado. A menos que Dath Maul seja o Snoke completando seu destino como o vilão do passado.
 Se vermos a maneira que o Snoke morreu podemos dizer que de fato é o mesmo vilão se contarmos o
 modo que ele morreu sendo cortado pela metade.","2019-01-27 01:15:51");
 
 INSERT INTO FILMES(TITULO,RESENHA,HORA) VALUES ("THOR RAGNAROK","Bem, quem está acompanhando o universo da Marvel desde Homem de Ferro 1 sabe
 que o Thor sempre foi um herói com pouca personalidade nos filmes. As vezes ele era reduzido a um mongol
 gigante com um martelo. O que nós vemos em Ragnarok é um Thor diferente. Sim, pegaram a injeção 'Humor de Guardiões da Galáxia'
 e injetaram umas cinco doses nele, então nós temos um Thor muito mais engraçado do que antes, mas ele
 agora não precisa de outras pessoas para começar as piadas. Ele consegue levar o seu filme sem precisar
 necessariamente dos outros personagens, mesmo os outros sendo excelentes. Você vê isso logo na primeira cena
 do filme, onde ele está totalmente diferente de antes. E daí pra frente, o filme nos tira várias risadas.
 Talvez algumas pessoas não gostem disso, alegando que o deus do trovão precisaria de um ar mais sério e soturno,
 porém nós sabemos que a Marvel não é de fazer muitos filmes assim, então eles foram para a comédia, e foi um
 resultado que agradou mais do que os dois primeiros filmes. O filme como um todo é algo realmente parecido com
 Guardiões da Galáxia no quesito humor e leveza. Ele tem sim, como pano de fundo, o Ragnarok, o fim do mundo dos
 nórdicos, porém isso é misturado com a jornada pessoa de Thor e Hulk. Sim, os dois personagens têm sua própria jornada,
 o que deixa a química do filme muito boa, e a Valquíria também foi bem inserida, com suas motivações, seus medos,
 e sua personalidade. Não me surpreenderia se ela ganhasse mais destaque nos próximos filmes da Marvel, principalmente na fase 4.
 Os antagonistas do filme possuem um carisma único. Desde a temível Hela ao esquisito Grão-Mestre, nós temos
 dois opostos, que consegue ferrar a vida dos nossos heróis de um jeito único. É claro que não tem como deixar
 de falar da atuação incrível da Cate Blanchett, nossa eterna Galadriel. Ela mesma, em várias entrevistas, disse
 que estava adorando interpretar uma vilã, e ela fez um ótimo trabalho. Você conseguia ver nela o fogo de insanidade
 que a personagem possuía, mas ao mesmo tempo vemos que ela também é uma filha que foi rejeitada pelo pai, e que
 o odeia por isso. E, por último, gostaria de falar sobre o relacionamento entre Thor e Loki. Tivemos esse relacionamento
 construído nos dois primeiros filmes do Thor e em Vingadores 1. Nós não temos como esperar que as coisas mudem
 entre os dois, mas a relação deles evolui para uma relação de dois irmãos, que as vezes se estranham, mas quando um
 precisa do outro, eles estarão lá. Para evitar os spoilers, não vou comentar mais sobre isso, mas é uma
 das melhores coisas do filme. Puxando para questões mais técnicas, a direção do filme me agradou bastante. Taika Waititi
 é um diretor que trabalha bastante com improviso, e ele mesmo falou que muita coisa do filme foi improvisada,
 e você consegue perceber essas cenas. As direções de câmera também estavam boas. Talvez em uma ou duas cenas em que os
 pirocópteros que os personagens faziam ficaram confusos, mas no geral é agradável de ver. E temos que dar um
 crédito a trilha sonora do filme. Tanto a trilha original quanto a música do primeiro trailer, que apareceu duas
 vezes no filme, em dois momentos propícios a isso, dão um show, e deixam o filme incrível.","2017-11-17 23:32:35");
 
 INSERT INTO FILMES(TITULO,RESENHA,HORA) VALUES ("EX MACHINA – INSTINTO ARTIFICIAL","Eu consegui ver um pouco do pensamento do sociólogo Zygmunt Bauman no filme,
 e acho que era essa a intenção do diretor Garlam passar um pouco dessa visão, na qual vivemos em um mundo que atravessa
 uma metamorfose permanente, uma incerteza constante. Essa ideia de nunca saber o que esperar do futuro, das pessoas com
 quem convivemos e até mesmo das nossas próprias criações, são muito bem expostas no filme e que deixa um espaço bem
 amplo para reflexão. O filme começa com Caleb Smith (Domhnall Gleeson) vencendo um concurso na empresa onde trabalha;
 e seu prêmio é basicamente conhecer o brilhante criador da empresa que vive recluso da sociedade, Nathan (Oscar Isaac),
 e testar a sua mais nova invenção. E como não poderia ser melhor, a invenção de Nathan é, nada menos que,
 uma inteligência artificial, que deve passar pelo Teste de Turing. E o teste é o próprio Caleb. Como é de se esperar,
 nem tudo são flores, mesmo no contexto dessa perfeição futurista. Quando Caleb conhece Ava (Alicia Vikander),
 a inteligência artificial que deve passar pelo teste, logo de cara vemos que ele fica encantando demais pela robô,
 não simplesmente por ela ser uma revolução no mundo tecnológico, mas ao ponto de vir a despertar um sentimento por ela.
 Enquanto Nathan parece guardar segredos demais e mantém um mistério sobre certos assuntos, o que desperta uma certa
 suspeita acerca de seu caráter. O que vemos no desenrolar do filme, é uma sucessão de acontecimentos que realmente
 conseguem te prender de tal forma, que você já não sabe mais em que personagem confiar. Com a mente atordoada das mesmas
 dúvidas de Caleb, você se vê completamente preso a uma série de dúvidas, por mais previsível que pareça o final. Os argumentos
 colocados de forma bastante coerente no filme, conseguem levantar certas dúvidas como: quanto de nossas vidas estão armazenadas
 nessa modernidade que nos faz refém? Ela que facilita tanto nossas vidas e ao mesmo tempo nos prende nesse círculo vicioso,
 sempre precisando mais e mais. Será que essa evolução, esse passo em direção ao futuro, também não seria um passo em direção
 ao fim ou um retrocesso? Afinal, na seleção natural os mais fortes sobrevivem. Certo?! Bom, cada um que tire suas próprias
 conclusões.","2017-06-07 13:34:38");

insert into FILMES(TITULO,RESENHA,HORA) 
values ("A MOSCA (1986)","Esta é uma obra de terror assustadora, mas ao mesmo tempo extremamente cativante e romântica estrelada
por Jeff Goldblum, que interpreta um cientista que conduz uma experiência de teletransporte. Uma jornalista (Geena Davis), que
apaixonou-se por ele ao fazer a reportagem sobre suas descobertas científicas, acaba se envolvendo com uma horrenda criatura, cuja
a aparência de inseto gradualmente passa a ser predominante. Essa é a sinopse do filme mais nojento que você vai ver hoje. Há muitas 
partes de asco que você presenciará, não assista o filme na hora do almoço, deixe para assistir em seu momento de lazer, se sua esposa]
ou quem estiver com você não gostar de coisas nojentas, melhor nem ficar para ver. Cinco horas sentado para fazer
 a maquiagem? Para tirar devia ser em um minuto. Ganhou o Oscar de melhor maquiagem, que demorava cerca de 5 horas para terminar de maquiar
 o Jeff Goldblum.","2019-05-18 22:26:01"); 

 
#3.1 - Realizando as buscas

-- 3.1.1 - Natural Language Mode
-- Por padrão, uma busca fulltext utiliza este modo, o MySQL espera receber uma consulta com a função MATCH(),
-- aonde será informada a coluna que contém o índice FullText e também qual é o termo para ser buscado, este que é
-- passado como parâmetro na função AGAINST(), que também recebe o tipo da busca a ser executada, nesse caso, IN NATURAL
-- LANGUAGE MODE. Por padrão, a busca será realizada não fazendo distinção entre maiúsculas e minúsculas. 

-- Quantos filmes com o termo "Tom Hanks" nas resenhas existem ?
SELECT COUNT(ID) AS 'FILMES COM TOM HANKS' FROM FILMES WHERE MATCH(RESENHA) AGAINST('Tom Hanks' IN NATURAL LANGUAGE MODE);

SELECT COUNT(ID) AS 'FILMES COM TOM HANKS' FROM FILMES WHERE RESENHA LIKE '%Tom Hanks%';

-- Quantos filmes com o termo "Cate Blanchett" nas resenhas existem ?
SELECT COUNT(ID) AS 'FILMES COM Cate Blanchett' FROM FILMES WHERE MATCH(RESENHA) AGAINST('Cate Blanchett' IN NATURAL LANGUAGE MODE);

SELECT COUNT(ID) AS 'FILMES COM Cate Blanchett' FROM FILMES WHERE RESENHA LIKE '%Cate Blanchett%';
-- Quais são os filmes com Cate Blanchett ?
SELECT TITULO AS 'FILMES COM Cate Blanchett' FROM FILMES WHERE MATCH(RESENHA) AGAINST('Cate Blanchett' IN NATURAL LANGUAGE MODE);
SELECT TITULO AS 'FILMES COM Cate Blanchett' FROM FILMES WHERE RESENHA LIKE '%Cate Blanchett%';

-- Qual a relevância do termo 'Cate Blanchett' realizado na pesquisa
SELECT ID, TITULO, FORMAT(MATCH(RESENHA) AGAINST('Cate Blanchett' IN NATURAL LANGUAGE MODE),2) AS 'RELEVANCIA'
FROM FILMES WHERE MATCH(RESENHA) AGAINST('Cate Blanchett' IN NATURAL LANGUAGE MODE);

-- 3.1.2 - Boolean Mode
-- a busca utilizando o modo booleano é util para realizar pesquisas por frases, termos que podem
-- ou não estarem na mesma ordem. A sintaxe é parecida com o modelo que vimos no anterior

-- Pesquisando por dois termos presentes em uma resenha mas que estão em posições diferentes dentro da resenha
SELECT TITULO FROM FILMES WHERE MATCH(RESENHA) AGAINST('humor modernidade' IN BOOLEAN MODE);

-- Pesquisando pelo termo inteligência e NÃO PESQUISAR pelo termo metarmofose
SELECT TITULO FROM FILMES WHERE MATCH(RESENHA) AGAINST('+inteligencia -metamorfose' IN BOOLEAN MODE);

-- Pesquisando pelo termo psicopata e homem no mesmo filme
SELECT TITULO FROM FILMES WHERE MATCH(RESENHA) AGAINST('+psicopata +homem' IN BOOLEAN MODE);

###################
# 4) CONCLUSÕES  # 
###################

-- O mecanismo de busca full text search é uma poderosa ferramenta na busca de textos.
-- Possui índices próprios, garantindo um bom desempenho.
-- Em pesquisas complexas é mais indicado que o operador Like.


