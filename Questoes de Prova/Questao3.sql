CREATE TABLE products (
  id INT PRIMARY KEY,
  name varchar(50),
  amount DECIMAL(10,2),
  price DECIMAL(7,2)
);

INSERT INTO products (id, name, amount, price)
VALUES
  (1,	'Two-doors wardrobe',	100,	800),
  (2,	'Dining table',	1000,	560),
  (3,	'Towel holder',	10000,	25.50),
  (4,	'Computer desk',	350,	320.50),
  (5,	'Chair',	3000,	210.64),
  (6,	'Single bed',	750,	460);
  
  SELECT max(price) AS 'Maior Valor', min(price) AS 'Menor Valor' FROM products;
  
  /*  Execute this query to drop the tables */
  -- DROP TABLE products; --
     