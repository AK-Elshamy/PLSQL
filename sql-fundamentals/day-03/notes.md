# Day 3 — SQL Fundamentals & Data Manipulation

## SQL command categories
- **DDL** defines/changes objects: `CREATE`, `ALTER`, `DROP`.
- **DML** manipulates data: `INSERT`, `UPDATE`, `DELETE`.
- **DQL** is a common label for `SELECT`; some references include SELECT under DML.
- **DCL** controls permissions: `GRANT`, `REVOKE`.
- **TCL** controls transactions: `COMMIT`, `ROLLBACK`.

## SELECT
```sql
SELECT student_name, email
FROM students;
```
Use explicit columns when possible; `*` selects all columns.

## WHERE and comparisons
Operators: `=`, `<>`, `>`, `<`, `>=`, `<=`.
```sql
SELECT student_name, age
FROM students
WHERE age > 20;
```
`AND` requires all conditions to be true; `OR` requires at least one. `AND` has higher precedence than `OR`, so parentheses clarify mixed conditions.

## BETWEEN
Includes both endpoints:
```sql
WHERE age BETWEEN 18 AND 22
```

## IN
Matches one of the exact listed values:
```sql
WHERE student_name IN ('Ahmed', 'Omar', 'Mariam')
```

## LIKE
- `%`: any sequence of characters, including zero characters.
- `_`: exactly one character.
```sql
WHERE student_name LIKE 'M%'
```
Matches names beginning with M. Case sensitivity depends on collation.

## NULL
Use `IS NULL` and `IS NOT NULL`, never `= NULL`. `NULL`, empty string (`''`), and spaces are different.

## ORDER BY and LIMIT
```sql
SELECT student_name, age
FROM students
ORDER BY age DESC, student_name ASC
LIMIT 5;
```
`ASC` is ascending (default), `DESC` is descending. Use `ORDER BY` with `LIMIT` for predictable results.

## INSERT, UPDATE, DELETE
```sql
INSERT INTO students (student_name, email, age, phone)
VALUES ('Example Student', 'example.student@example.com', 22, '01012345678');
```
```sql
UPDATE students SET age = 23 WHERE student_id = 10;
```
```sql
DELETE FROM students WHERE student_id = 10;
```

## Safety rules
- `UPDATE` without `WHERE` updates every row.
- `DELETE` without `WHERE` deletes every row but leaves the table definition.
- `DROP TABLE` removes the table definition and its data.
- Preview rows using `SELECT` with the same `WHERE` before an UPDATE or DELETE.

## Practice
1. Find students older than 22.
2. Find students aged 20–25 inclusive.
3. Find names beginning with M.
4. Find students named Ahmed, Omar, or Mariam.
5. Show the five oldest students.
6. Insert a practice student with a unique email.
7. Explain `DELETE` vs `DROP TABLE`.
