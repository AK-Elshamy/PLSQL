-- Day 3: INSERT, UPDATE, DELETE
USE university_db;

-- INSERT example (commented out to avoid accidental duplicate inserts):
-- INSERT INTO students (student_name, email, age, phone)
-- VALUES ('Example Student', 'example.student.001@example.com', 22, '01012345678');

-- Preview the target row before UPDATE:
SELECT student_id, student_name, age
FROM students
WHERE student_id = 10;

-- Uncomment only when intentionally changing practice data:
-- UPDATE students SET age = 23 WHERE student_id = 10;

-- Preview the target row before DELETE:
SELECT student_id, student_name, age
FROM students
WHERE student_id = 10;

-- Do not run unless you intentionally want to delete this row:
-- DELETE FROM students WHERE student_id = 10;

-- UPDATE without WHERE changes every row.
-- DELETE without WHERE deletes every row.
-- DROP TABLE removes the table definition and its data.
