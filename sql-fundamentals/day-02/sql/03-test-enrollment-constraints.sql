-- Inspect the IDs before testing; replace sample IDs with existing IDs.
USE university_db;

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM semesters;
SELECT * FROM enrollments;

-- Uncomment and adapt these examples after checking the IDs:
--
-- 1) Valid enrollment: expected to succeed.
-- INSERT INTO enrollments (student_id, course_id, semester_id) VALUES (1, 1, 1);
--
-- 2) Same student + course + semester again: expected to FAIL (UNIQUE).
-- INSERT INTO enrollments (student_id, course_id, semester_id) VALUES (1, 1, 1);
--
-- 3) Same student + course, different semester: expected to succeed if this
--    semester exists and this combination has not already been enrolled.
-- INSERT INTO enrollments (student_id, course_id, semester_id) VALUES (1, 1, 2);
--
-- 4) Nonexistent foreign key ID: expected to FAIL (FOREIGN KEY).
-- INSERT INTO enrollments (student_id, course_id, semester_id) VALUES (999999, 1, 1);
--
-- SELECT * FROM enrollments;
