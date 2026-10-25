# Day 01 — Introduction to Oracle PL/SQL

## 1. SQL vs PL/SQL
- **SQL** queries and manipulates database data.
- **PL/SQL** is Oracle's procedural extension to SQL. It combines SQL with variables, conditions, loops, and exception handling.

## 2. Basic PL/SQL block

```sql
DECLARE
    -- Variable declarations (optional)
BEGIN
    -- Executable statements (required)
EXCEPTION
    -- Error handling (optional)
END;
/
```

- `DECLARE`: declare variables; optional if none are needed.
- `BEGIN`: starts executable statements.
- `EXCEPTION`: optional error-handling section.
- `END;`: closes the block.
- `/`: runs the buffered block in SQL*Plus/SQLcl when entered on a new line.

## 3. Printing output

```sql
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL');
    DBMS_OUTPUT.PUT_LINE('I''m learning Oracle');
END;
/
```

Use single quotes for strings. To include an apostrophe inside a string, double it: `I''m`.

`SET SERVEROUTPUT ON` enables `DBMS_OUTPUT` display in SQLcl. In this setup, `Run in SQLcl` displayed the output; VS Code's `Run Statement` completed without displaying it.

## 4. Variables and assignment

```sql
DECLARE
    v_price    NUMBER(8,2) := 232.32;
    v_quantity INTEGER := 12;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Total Price is: ' || (v_price * v_quantity));
END;
/
```

- `NUMBER(8,2)`: up to 8 total digits, with 2 digits after the decimal point.
- `INTEGER`/`INT`: integer numeric type in Oracle.
- `:=`: assignment operator.
- `||`: concatenates text and values for output.

A variable can be reassigned inside the executable section:

```sql
DECLARE
    v_price NUMBER(8,2) := 100;
BEGIN
    v_price := 250;
    DBMS_OUTPUT.PUT_LINE(v_price);
END;
/
```

Output: `250`.

## 5. IF / ELSIF / ELSE

```sql
DECLARE
    v_grade NUMBER(4,2) := 82;
BEGIN
    IF v_grade >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF v_grade >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Very Good');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Keep Practicing');
    END IF;
END;
/
```

Output: `Very Good`. Conditions are checked in order; the first true branch runs.

## 6. FOR LOOP

```sql
BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;
/
```

Prints 1 through 5. The loop counter is managed automatically.

Print even numbers:

```sql
BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
END;
/
```

`MOD(i, 2) = 0` means the number is even.

## 7. WHILE LOOP

```sql
DECLARE
    v_counter NUMBER := 10;
BEGIN
    WHILE v_counter >= 1 LOOP
        DBMS_OUTPUT.PUT_LINE(v_counter);
        v_counter := v_counter - 1;
    END LOOP;
END;
/
```

A `WHILE` loop repeats while its condition is true. Update the loop variable so the condition eventually becomes false; otherwise the loop may continue indefinitely.

## 8. Oracle vs MySQL
Oracle PL/SQL and MySQL stored-program syntax are different. Oracle uses `DBMS_OUTPUT.PUT_LINE` for block output; MySQL commonly uses `SELECT 'message' AS message` to display a result row. An Oracle PL/SQL block does not run unchanged in MySQL.

## Next lesson
SQL statements inside PL/SQL, especially `SELECT ... INTO`, and what happens when a query returns zero or multiple rows.
