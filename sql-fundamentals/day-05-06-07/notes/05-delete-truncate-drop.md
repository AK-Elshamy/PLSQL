# DELETE vs TRUNCATE vs DROP

- **DELETE:** removes selected rows; `WHERE` may be used. Without `WHERE`, all rows may be deleted.
- **TRUNCATE:** removes all rows while keeping the table structure; no `WHERE` clause.
- **DROP:** removes the table object/structure and its data.

```sql
DELETE FROM students WHERE student_id = 10;
TRUNCATE TABLE students;
DROP TABLE students;
```
These examples are destructive; do not run them against important data. Rollback, identity-reset, and locking behavior varies by DBMS.
