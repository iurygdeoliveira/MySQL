CREATE TABLE doctors (
id INT,
name VARCHAR(255)
);

CREATE TABLE work_shifts (
id INT,
name VARCHAR(255),
bonus decimal(10,2)
);

CREATE TABLE attendances (
id INT,
id_doctor INT,
hours INT,
id_works_shift INT
);

INSERT INTO doctors(id, name)
VALUES 
      (1, 'Arlino'),
      (2, 'Tiago'),
      (3, 'Amanda'),
      (4, 'Wellington');
      
INSERT INTO work_shifts(id, name, bonus)
VALUES 
      (1, 'nocturnal',15),
      (2, 'afternoon',2),
      (3, 'day',1);

INSERT INTO attendances(id, id_doctor, hours, id_works_shift)
VALUES 
      (1, 1,5,1),
      (2, 3,2,1),
      (3, 3,3,2),
      (4, 2,2,3),
      (5, 1,5,3),
      (6, 4,1,3),
      (7, 4,2,1),
      (8, 3,2,2),
      (9, 2,4,2);
      
-- ( ( 1 * 150 ) + 1% ) + ( ( 2 * 150 ) + 15% )
SET sql_mode='';
SELECT d.name as NOME, 
round(sum( ( a.hours * 150 ) +  ( ( ( a.hours * 150 ) * w.bonus)/100.0 ) ),1)  as Salary
FROM doctors d, attendances a, work_shifts w
where d.id = a.id_doctor and w.id = a.id_works_shift
group by d.id
order by Salary desc



