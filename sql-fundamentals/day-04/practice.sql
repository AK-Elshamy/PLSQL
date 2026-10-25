-- Day 4: Aggregate Functions, GROUP BY, and HAVING
-- Check your schema first: DESCRIBE students;

-- 1. Overall student statistics
-- Requires the phone column. Remove COUNT(phone) if your table has no phone column.
SELECT
    COUNT(*) AS total_students,
    COUNT(phone) AS students_with_phone,
    AVG(age) AS average_age,
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM students;

-- 2. Count students in each age group
SELECT
    age,
    COUNT(*) AS total_students
FROM students
GROUP BY age
ORDER BY age;

-- 3. Age groups with age >= 20 and at least 3 students in the filtered result
SELECT
    age,
    COUNT(*) AS total_students
FROM students
WHERE age >= 20
GROUP BY age
HAVING COUNT(*) >= 3
ORDER BY total_students DESC;

-- 4. Optional department example: run only if students has a department column.
-- SELECT department, COUNT(*) AS total_students
-- FROM students
-- GROUP BY department
-- HAVING COUNT(*) >= 2
-- ORDER BY total_students DESC;
