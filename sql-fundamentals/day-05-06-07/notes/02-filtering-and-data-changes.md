# Filtering and Data Changes

## Filtering
- Comparisons: `=`, `<>`, `!=`, `<`, `<=`, `>`, `>=`
- Combine conditions with `AND`, `OR`, `NOT`; use parentheses when useful.
- `BETWEEN a AND b` includes both endpoints.
- `IN (...)` matches any listed value.
- `LIKE`: `%` means zero or more characters; `_` means exactly one character.
- Use `IS NULL` / `IS NOT NULL`; do not use `= NULL`.

## Sorting and limiting
```sql
SELECT student_name, age
FROM students
WHERE age >= 18
ORDER BY age DESC, student_name ASC
LIMIT 10;
```
`LIMIT` is MySQL syntax. Oracle commonly supports:
```sql
SELECT student_name, age
FROM students
WHERE age >= 18
ORDER BY age DESC, student_name ASC
FETCH FIRST 10 ROWS ONLY;
```

## Data changes
```sql
INSERT INTO students (student_name, email, age)
VALUES ('Sample Student', 'sample@example.com', 20);

UPDATE students
SET age = 21
WHERE email = 'sample@example.com';

DELETE FROM students
WHERE email = 'sample@example.com';
```
Inspect target rows before destructive `UPDATE` or `DELETE`.
