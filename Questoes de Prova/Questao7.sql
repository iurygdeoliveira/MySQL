--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2620

CREATE TABLE customers (
  id INT PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2),
  credit_limit DECIMAL(10,2)
);

CREATE TABLE orders (
  id INT PRIMARY KEY,
  orders_date date,
  id_customers INT REFERENCES customers(id)
);


INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES
  (1,	'Nicolas Diogo Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (2,	'Cecília Olivia Rodrigues',	'Rua Sizuka Usuy',	'Cianorte',	'PR',	3170),
  (3,	'Augusto Fernando Carlos Eduardo Cardoso',	'Rua Baldomiro Koerich',	'Palhoça',	'SC',	1067),
  (4,	'Pedro Cardoso',	'Acesso Um',	'Porto Alegre',	'RS',	475),
  (5,	'Sabrina Heloisa Gabriela Barros',	'Rua Engenheiro Tito Marques Fernandes',	'Porto Alegre',	'RS',	4312),
  (6,	'Joaquim Diego Lorenzo Araújo',	'Rua Vitorino',	'Novo Hamburgo',	'RS',	2314);

INSERT INTO orders (id, orders_date, id_customers)
VALUES
  (1,	str_to_date('13/05/2016',"%d/%m/%Y"),	3),
  (2,	str_to_date('12/01/2016',"%d/%m/%Y"),	2),
  (3,	str_to_date('18/04/2016',"%d/%m/%Y"),	5),
  (4,	str_to_date('07/09/2016',"%d/%m/%Y"),	4),
  (5,	str_to_date('13/02/2016',"%d/%m/%Y"),	6),
  (6,	str_to_date('05/08/2016',"%d/%m/%Y"),	3);

SELECT c.name AS Cliente, o.id as Pedido 
FROM customers c, orders o
WHERE c.id = o.id_customers AND (o.orders_date BETWEEN '2016-01-01' AND '2016-06-30')

  /*  Execute this query to drop the tables */
  -- DROP TABLE orders, customers; --
