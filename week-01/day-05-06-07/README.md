# Oracle & SQL Learning — Week 1

Practice-first notes for Database Fundamentals and SQL. Exercises primarily use MySQL syntax; Oracle differences are noted.

## Topics
- Database, DBMS, SQL, schemas, tables, rows, columns, types, constraints
- Relational tables, primary/foreign keys, relationships
- DDL, DML, DQL, DCL, TCL
- SELECT, WHERE, ORDER BY, LIMIT, INSERT, UPDATE, DELETE
- Aggregate functions, GROUP BY, HAVING, JOIN
- Simple English SQL interview answers

## Folders
- `notes/` topic summaries
- `sql/` practice scripts
- `interview/` questions and sample answers
- `progress.md` checklist

## How to use
1. Open SQL scripts in MySQL Workbench.
2. Run them in a disposable practice database.
3. Answer interview questions aloud before reading sample answers.
4. Commit the completed week to GitHub.

## Safety
- Use `WHERE` with `UPDATE` and `DELETE` unless you intentionally want to affect all rows.
- `DROP TABLE` removes the table object and its data.
- `TRUNCATE TABLE` removes all rows while keeping the table structure.
- SQL dialects differ: MySQL uses `LIMIT`; Oracle commonly uses `FETCH FIRST n ROWS ONLY`.
