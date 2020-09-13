# 9 - Tipos Textuais

# 9.1 - CHAR: Campo com tamanho fixo. Boa performance em algoritmos de busca
	  -- Tamanho 0 a 255 caracteres
      
# 9.2 - VARCHAR: 21.844 caracteres. Campo com tamanho fixo. Boa performance em algoritmos de busca
	  -- Isso varia de acordo com o encoding da tabela.
	  -- No caso de utf8 que utiliza 3 bytes para armazenamento o tamanho máximo será 21.844 caracteres.
      -- Permite valor padrão (DEFAULT) e NOT NULL

# 9.3 - TINYTEXT: Tamanho máximo de 255 caracteres.

# 9.4 - TEXT: Tamanho máximo de 65.535 caracteres.

# 9.5 - MEDIUMTEXT: Tamanho máximo de 16.777.215 caracteres.

# 9.6 - LONGTEXT: Tamanho máximo de 4.294.967.295 OU 4GB caracteres.
	 
# 9.7 - TINYBLOB, BLOB, MEDIUMBLOB E LONGBLOB
      -- Binary Large Object - grande objeto binário
	  
      -- Capaz de armazenar valores binários ou campos dinâmicos em tabelas.
	  -- O uso não é frequente nas aplicações por ocupar um grande espaço em disco.

# 10 - TIPO TEMPORAIS

# 10.1 - DATE
       -- O range do campo DATE é entre 1000-01-01 até 9999-12-31.
	   -- Trabalhamos com o campo sempre no formato americano (YYYY-MM-DD)
	   -- Há a possibilidade de inserir dados utilizando outros formatos, mas não é recomendado.

# 10.2 - TIME
       -- Aceita valores de -838:59:59.999999 até 838:59:59.999999.
	   -- A máscara aplicada é HH:MM:SS.ssssss (6 casas de precisão de microsegundos)

# 10.3 - DATETIME
       -- Combinação de DATE e TIME.
       -- Sempre no formato americano
       -- Suporta valores entre 1000-01-01 00:00:00.000000 9999-12-31 23:59:59.999999.
       -- O formato aceito YYYY-MM-DD HH:MM:SS.

# 10.4 - TIMESTAMP
       -- Aceita valores de 1970-01-01 00:00:01 até 2038-01-19 05:14:07 (UTC).
	   -- O formato do campo é o mesmo de DATETIME (sem os microssegundos).

# 10.5 - YEAR
       -- Temos 2 formatos para se trabalhar com o ano.
	   -- YEAR(2) onde os valores aceitos são de 70 até 69.
	   -- YEAR(4) onde os valores são aceitos de 1901 até 2155 e 0000.


	   


 











