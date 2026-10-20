# Database Fundamentals

- **Data:** individual facts, such as a student's name.
- **Database:** an organized collection of related data.
- **DBMS:** software used to define, store, query, update, and manage databases.
- **SQL:** language used to work with relational databases.
- **MySQL Workbench:** a GUI tool for working with MySQL; it is not itself the DBMS.
- **Table:** data organized into rows and columns. A row is one record; a column is an attribute.

## Common data types and constraints
Common types: `INT`, `VARCHAR(n)`, `DATE`, `DECIMAL(p,s)`, `TIMESTAMP`.
- `PRIMARY KEY`: uniquely identifies each row; cannot be `NULL`.
- `FOREIGN KEY`: references a key in another table (or the same table).
- `UNIQUE`: prevents duplicate values for the constrained key/column combination.
- `NOT NULL`: requires a value.
- `CHECK`: enforces a condition when supported/enforced by the DBMS version.

## Keys and relationships
- A **primary key** identifies each row in its table.
- A **foreign key** links related records and helps maintain referential integrity.
- **One-to-many:** commonly represented by a foreign key on the “many” side.
- **One-to-one:** often uses a foreign key with a `UNIQUE` constraint.
- **Many-to-many:** represented by a junction table containing foreign keys to both tables.

## SQL command categories
- **DDL:** defines/changes structures: `CREATE`, `ALTER`, `DROP`.
- **DML:** changes data: `INSERT`, `UPDATE`, `DELETE`.
- **DQL:** retrieves data, commonly `SELECT`.
- **DCL:** privileges: `GRANT`, `REVOKE`.
- **TCL:** transactions: `COMMIT`, `ROLLBACK`, `SAVEPOINT`.

```sql
SELECT column_name
FROM table_name
WHERE condition
ORDER BY column_name;
```

`WHERE` filters rows before grouping; `HAVING` filters groups after aggregation.
