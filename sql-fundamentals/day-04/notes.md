# Day 4 Notes — Aggregate Functions & Grouping

## 1. Aggregate functions

| Function | Purpose |
|---|---|
| `COUNT(*)` | Counts all rows in the current result set |
| `COUNT(column)` | Counts non-`NULL` values in that column |
| `SUM(column)` | Adds non-`NULL` numeric values |
| `AVG(column)` | Calculates the average of non-`NULL` numeric values |
| `MIN(column)` | Returns the smallest non-`NULL` value |
| `MAX(column)` | Returns the largest non-`NULL` value |

Example:

```sql
SELECT
    COUNT(*) AS total_students,
    COUNT(phone) AS students_with_phone,
    AVG(age) AS average_age,
    MIN(age) AS youngest_age,
    MAX(age) AS oldest_age
FROM students;
```

`COUNT(*)` counts rows even if some columns contain `NULL`. `COUNT(phone)` counts only rows where `phone` is not `NULL`. `SUM`, `AVG`, `MIN`, and `MAX` ignore `NULL` values. If there are no non-`NULL` values to aggregate, these functions return `NULL` (except `COUNT`, which returns `0`).

For ages `18, 20, 22, NULL`:
- `SUM(age) = 60`
- `AVG(age) = 20`

## 2. GROUP BY

`GROUP BY` groups rows that share the same value in one or more columns. Aggregate functions calculate a result for each group.

```sql
SELECT age, COUNT(*) AS total_students
FROM students
GROUP BY age
ORDER BY age;
```

This returns one row per distinct age, with the number of students in that age group.

If your table has a `department` column, you can group by it:

```sql
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;
```

## 3. WHERE vs HAVING

- `WHERE` filters individual rows **before** grouping and aggregation.
- `HAVING` filters groups **after** grouping and aggregation.

Example: count students aged 20 or older in each age group, then keep only groups with at least 3 students:

```sql
SELECT age, COUNT(*) AS total_students
FROM students
WHERE age >= 20
GROUP BY age
HAVING COUNT(*) >= 3
ORDER BY total_students DESC;
```

`COUNT(*)` here counts only rows that passed `WHERE age >= 20`.

## 4. Logical query processing order

A simplified logical order is:

1. `FROM`
2. `WHERE`
3. `GROUP BY`
4. `HAVING`
5. `SELECT`
6. `ORDER BY`
7. `LIMIT` (where supported)

This is a logical model for understanding SQL, not a guarantee of physical execution order.

## 5. Common mistakes

- Writing `GRUP BY` instead of `GROUP BY`.
- Using `HAVING` for a condition on individual rows; use `WHERE`.
- Grouping by `age` when the question asks for totals by `department`.
- Forgetting that `COUNT(column)` ignores `NULL`, while `COUNT(*)` counts rows.
- Assuming `NULL` is the same as zero. It is not.

## 6. Schema check

```sql
DESCRIBE students;
```

Some queries use `phone`; run them only if that column exists. The department example requires a `department` column, which may not exist in your current table.
