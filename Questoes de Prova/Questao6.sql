--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2618

CREATE TABLE providers (
  id INT PRIMARY KEY,
  name varchar(255),
  street varchar(255),
  city varchar(255),
  state char(2)
);

CREATE TABLE categories (
  id INT PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE products (
  id INT PRIMARY KEY,
  name varchar (255),
  amount DECIMAL(10,2),
  price DECIMAL(10,2),
  id_providers INT REFERENCES providers (id),
  id_categories INT REFERENCES categories (id)
);

INSERT INTO providers (id, name, street, city, state)
VALUES
  (1,	'Ajax SA',	'Rua Presidente Castelo Branco',	'Porto Alegre',	'RS'),
  (2,	'Sansul SA',	'Av Brasil',	'Rio de Janeiro',	'RJ'),
  (3,	'South Chairs',	'Rua do Moinho',	'Santa Maria',	'RS'),
  (4,	'Elon Electro',	'Rua Apolo',	'São Paulo',	'SP'),
  (5,	'Mike Electro',	'Rua Pedro da Cunha',	'Curitiba',	'PR');

INSERT INTO categories (id, name)
VALUES
  (1,	'Super Luxury'),
  (2,	'Imported'),
  (3,	'Tech'),
  (4,	'Vintage'),
  (5,	'Supreme');
  
INSERT INTO products (id, name, amount, price, id_providers, id_categories)
VALUES
  (1,	'Blue Chair',	30,	300.00,	5,	5),
  (2,	'Red Chair',	50,	2150.00,	2,	1),
  (3,	'Disney Wardrobe',	400,	829.50,	4,	1),
  (4,	'Blue Toaster',	20,	9.90,	3,	1),
  (5,	'TV',	30,	3000.25,	2,	2);
  
  SELECT
  pd.name AS produto,
  (SELECT pv.name FROM providers pv WHERE pv.name = 'Sansul SA') as Fornecedor,
  (SELECT cg.name FROM categories cg WHERE cg.name = 'Imported') as Categorias
  FROM products pd 
  WHERE pd.id_providers = (SELECT pv.id FROM providers pv WHERE pv.name = 'Sansul SA')
  AND pd.id_categories = (SELECT cg.id FROM categories cg WHERE cg.name = 'Imported')
  
/*  Execute this query to drop the tables */
-- DROP TABLE products, categories, providers; --