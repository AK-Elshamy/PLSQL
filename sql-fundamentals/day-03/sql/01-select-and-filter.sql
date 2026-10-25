-- Day 3: SELECT and WHERE practice
USE university_db;

SELECT student_name AS Name, email AS Email
FROM students;

SELECT student_name, age
FROM students
WHERE age > 20;

SELECT student_name, age
FROM students
WHERE age > 20
  AND (student_name LIKE 'Ahmed%' OR student_name LIKE 'Omar%');

SELECT student_name, age
FROM students
WHERE age BETWEEN 18 AND 22;

SELECT student_name, age
FROM students
WHERE student_name IN ('Ahmed', 'Omar', 'Mariam');

SELECT student_name, age
FROM students
WHERE student_name LIKE 'M%';

SELECT student_name, phone
FROM students
WHERE phone IS NULL;

SELECT student_name, phone
FROM students
WHERE phone IS NOT NULL;
