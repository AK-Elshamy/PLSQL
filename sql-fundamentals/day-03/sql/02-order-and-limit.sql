-- Day 3: ORDER BY and LIMIT practice
USE university_db;

SELECT student_id, student_name, age
FROM students
ORDER BY age DESC, student_id ASC;

SELECT student_id, student_name, age
FROM students
ORDER BY age ASC, student_id ASC;

SELECT student_id, student_name, age
FROM students
ORDER BY age DESC, student_id ASC
LIMIT 5;

SELECT student_id, student_name, age
FROM students
ORDER BY student_id ASC
LIMIT 10;
