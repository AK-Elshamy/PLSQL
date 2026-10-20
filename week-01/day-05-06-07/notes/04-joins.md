# SQL JOINs

A `JOIN` combines related data from tables using a matching condition.

## Main types
- **INNER JOIN:** only rows with matches in both tables.
- **LEFT JOIN:** every left-table row, plus matching right-side data; unmatched right columns are `NULL`.
- **RIGHT JOIN:** every right-table row, plus matching left-side data.
- **FULL OUTER JOIN:** all matched and unmatched rows from both sides. MySQL does not directly support it; it can be emulated with a `LEFT JOIN` and unmatched rows from the other side.

## ON vs WHERE with LEFT JOIN
- `ON` defines how rows match. A right-table condition in `ON` can limit matches while preserving all left-side rows.
- `WHERE` filters the joined result. Filtering on a right-side column in `WHERE` can remove unmatched left-side rows.

## Join multiple tables
```sql
SELECT s.student_name, c.course_name, sem.semester_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN semesters sem ON e.semester_id = sem.semester_id;
```

## Count enrollment records per course
```sql
SELECT c.course_name, COUNT(e.student_id) AS enrollment_count
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
```
This counts enrollment records. To count distinct students across semesters, use `COUNT(DISTINCT e.student_id)`.

## Interview answers
**INNER JOIN vs LEFT JOIN**
- “INNER JOIN returns only rows that have matching records in both tables.”
- “LEFT JOIN returns all rows from the left table, including rows without a match in the right table.”

**Primary key vs Foreign key**
- “A primary key uniquely identifies each row in a table.”
- “A foreign key links tables by referencing a key in another table.”
