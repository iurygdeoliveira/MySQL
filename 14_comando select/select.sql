# 14 - COMANDO SELECT

SELECT * FROM tbl_users;

SELECT user_name, user_lastname FROM tbl_users;

SELECT user_id, user_name, user_lastname, user_created FROM tbl_users
WHERE user_years_old BETWEEN 23 AND 25;

SELECT u.user_id, UPPER(u.user_name) as 'user_name', u.user_lastname, 
DATE_FORMAT(u.user_created, '%d/%m/%Y %H:%i:%s') user_created_brl FROM tbl_users u
WHERE u.user_years_old BETWEEN 23 AND 25;

