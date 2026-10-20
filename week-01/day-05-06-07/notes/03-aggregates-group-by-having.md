# Aggregate Functions, GROUP BY, and HAVING

## Aggregate functions
- `COUNT(*)`: counts rows, including rows where some columns contain `NULL`.
- `COUNT(column_name)`: counts non-`NULL` values in that column.
- `SUM(column_name)`: adds non-`NULL` numeric values.
- `AVG(column_name)`: averages non-`NULL` numeric values.
- `MIN(column_name)` / `MAX(column_name)`: smallest/largest non-`NULL` value.

## GROUP BY
`GROUP BY` combines rows sharing grouping values so aggregate functions can be calculated per group.

```sql
SELECT course_id, COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY course_id;
```

## WHERE vs HAVING
- `WHERE` filters individual rows before grouping.
- `HAVING` filters groups after grouping/aggregation.

```sql
SELECT course_id, COUNT(*) AS enrollment_count
FROM enrollments
WHERE semester_id = 9001
GROUP BY course_id
HAVING COUNT(*) > 1;
```

## LEFT JOIN and counts
To include students with no enrollments:
```sql
SELECT s.student_id, s.student_name, COUNT(e.course_id) AS total_courses
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;
```
Use `COUNT(e.course_id)`, not `COUNT(*)`, to get `0` for students with no match: the outer join still creates a row, but `e.course_id` is `NULL`.
