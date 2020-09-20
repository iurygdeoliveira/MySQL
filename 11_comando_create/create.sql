#11 - COMANDO CREATE TABLE E CREATE DATABASE 

-- https://dev.mysql.com/doc/refman/8.0/en/create-database.html
CREATE DATABASE IF NOT EXISTS tads DEFAULT CHARACTER SET 'utf8' DEFAULT COLLATE = 'utf8_general_ci';

USE tads; 

-- https://dev.mysql.com/doc/refman/8.0/en/create-table.html
CREATE TABLE IF NOT EXISTS TESTE (
	id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Campo para armazenar o ID',
    nome VARCHAR(255) NOT NULL,
    hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8MB4;




