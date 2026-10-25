USE university_db;

-- 1. Show each enrollment with student, course, and semester names.
SELECT s.student_name, c.course_name, sem.semester_name
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id
INNER JOIN semesters sem ON e.semester_id = sem.semester_id;

-- 2. Count enrollment records per course, including courses with zero enrollments.
SELECT c.course_name, COUNT(e.student_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY enrollment_count DESC, c.course_name ASC;

-- 3. Show all students, including students with zero enrollments.
SELECT s.student_id, s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name
ORDER BY total_courses DESC, s.student_name ASC;

-- 4. Keep every student, but count only enrollments in semester 9001.
-- Change 9001 if your practice data uses a different semester ID.
SELECT s.student_id, s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e
  ON s.student_id = e.student_id
 AND e.semester_id = 9001
GROUP BY s.student_id, s.student_name
HAVING COUNT(e.course_id) > 1
ORDER BY total_courses DESC, s.student_name ASC;
