# 8 - TIPOS NUMÉRICOS 

# 8.1 - BOOL(BOOLEAN): 
      -- Valores permitidos: 0 = FALSE   / 1 = TRUE 
      -- Qualquer outro valor que não seja zero, é considerado como true automaticamente

# 8.2 - TINYINT
      -- Valores permitidos, para valores negativos habilitados:  -128 / 127
      -- Valores permitidos, para valores NÃO negativos habilitados:  0 / 255
      -- Requer 1 byte para armazenamento do valor

# 8.3 - SMALLINT
	  -- Valores permitidos, para valores negativos habilitados:  -32768 / 32767
      -- Valores permitidos, para valores NÃO negativos habilitados:  0 / 65535
      -- Requer 2 bytes para armazenamento do valor

# 8.4 - MEDIUMINT
	  -- Valores permitidos, para valores negativos habilitados:  -8388608 / 8388607
      -- Valores permitidos, para valores NÃO negativos habilitados:  0 / 16777215
      -- Requer 3 bytes para armazenamento do valor
      
# 8.5 - INT(INTEGER)
	  -- Valores permitidos, para valores negativos habilitados:  -2147483648 / 2147483647
      -- Valores permitidos, para valores NÃO negativos habilitados:  0 / 4294967295
      -- Requer 4 bytes para armazenamento do valor
      
# 8.6 - BIG INT
	  -- Valores permitidos, para valores negativos habilitados:  -9223372036854775808 / 9223372036854775807
      -- Valores permitidos, para valores NÃO negativos habilitados:  0 / 18446744073709551615
      -- Requer 8 bytes para armazenamento do valor

# 8.7 - DECIMAL(M,D)
      -- M é o tamanho do número
      -- D é a quantidade após a virgula
      -- Também pode ser chamado de DEC ou NUMERIC
      -- O tamanho de M é de no máximo 65 caracteres.
      -- Pontuação e sinal não são contabilizados. Casas decimais são contados.
	  -- Ex: -12345.67 [M = 7]
	  -- Se M for omitido, o valor atribuído será 10.
	  -- Permite o uso de número negativos, ZEROFILL
      -- Normalmente utilizado para campos financeiros e monetários