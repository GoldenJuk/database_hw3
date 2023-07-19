CREATE DATABASE IF NOT EXISTS hw3_base;
USE hw3_base;
DROP TABLE IF EXISTS staff;

CREATE TABLE IF NOT EXISTS staff 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8,2),
    age INT
);

INSERT staff (first_name, last_name, post, seniority, salary, age)
VALUES
  ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
  ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
  ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
  ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
  ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
  ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
  ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
  ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
  ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
  ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
  ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
  ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
  
SELECT * FROM staff;

-- 1.1. Отсортируеv данные по полю заработная плата (salary) в порядке: убывания:

SELECT * FROM staff 
ORDER BY salary DESC;

-- 1.2. Отсортируеv данные по полю заработная плата (salary) в порядке: возрастания:

SELECT * FROM staff 
ORDER BY salary;

-- 2. Выведем 5 максимальных заработных плат (saraly):

SELECT * FROM staff 
ORDER BY salary DESC 
LIMIT 5;

-- 3. Посчитаем суммарную зарплату (salary) по каждой специальности (роst):

SELECT 
	post, 
    SUM(salary) AS total_salary
FROM staff
GROUP BY post;

-- 4. Найдем кол-во сотрудников со специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно:

SELECT COUNT(*) AS total_workers
FROM staff
WHERE post = 'Рабочий' AND age BETWEEN 24 AND 49;  -- Случайно нагуглил BETWEEN))

-- 5. Найдем количество специальностей:

SELECT COUNT(DISTINCT post) AS total_specialties
FROM staff;

-- 6. Выведим специальности, у которых средний возраст сотрудников меньше 30 лет 

SELECT 
	post AS `Average_age <= 30`
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;