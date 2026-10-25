-- Week 1, Day 1
-- Run the successful statement first.
-- The invalid examples are intentionally commented out:
-- uncomment and run them one at a time to observe the expected errors.

USE university_db;

INSERT INTO students (student_name, email, age)
VALUES ('Ahmed', 'ahmed@example.com', 21);

SELECT * FROM students;

-- Expected to fail: age violates CHECK (age >= 16).
-- INSERT INTO students (student_name, email, age)
-- VALUES ('Test User', 'test@example.com', 15);

-- Expected to fail: email already exists if the first insert succeeded.
-- INSERT INTO students (student_name, email, age)
-- VALUES ('Another User', 'ahmed@example.com', 22);

-- Expected to fail: student_name is NOT NULL.
-- INSERT INTO students (email, age)
-- VALUES ('missing-name@example.com', 20);

-- Optional: inspect the table after your tests.
-- SELECT * FROM students;
