# Week 1 --- Day 1: Introduction to Database Systems

## Learning objectives

-   Distinguish data, a database, a DBMS, SQL, and MySQL Workbench.
-   Explain why database systems are useful compared with ad hoc
    file-based storage.
-   Understand the basic client--DBMS--storage flow.
-   Distinguish schema from data.
-   Create a table with appropriate data types and constraints.

## 1. Core concepts

-   **Data:** raw facts or values.
-   **Database:** an organized collection of related data.
-   **DBMS (Database Management System):** software that manages
    databases, processes database requests, and helps enforce rules,
    security, concurrency control, and recovery.
-   **SQL:** a language used to define, query, and manipulate data in
    relational database systems.
-   **MySQL:** the DBMS used for this practice.
-   **MySQL Workbench:** a graphical client used to connect to MySQL
    Server and run SQL; it is not the DBMS itself.

## 2. Why use a DBMS?

File-based approaches can become difficult to manage as systems grow.

-   **Data redundancy:** the same fact is stored in multiple places.
-   **Data inconsistency:** duplicated copies disagree after an
    incomplete update.
-   **Concurrent access:** multiple users or transactions read and
    modify data at the same time; the system must coordinate these
    operations to avoid conflicts and lost updates.
-   **Integrity:** rules are needed to prevent invalid data.
-   **Security and recovery:** access control, backups, and recovery
    mechanisms are important for reliable systems.

A DBMS provides mechanisms to address these problems. It does not
automatically make every design correct; the schema, constraints,
permissions, and transactions still matter.

## 3. Basic architecture

Typical flow:

1.  A client, such as MySQL Workbench or a Java application, sends a
    request.
2.  MySQL Server parses and processes the SQL statement.
3.  The server accesses or modifies the required database structures.
4.  The server returns a result or status to the client.

## 4. Schema vs. data

-   **Schema:** the structure---tables, columns, data types,
    relationships, and constraints.
-   **Data:** the actual records stored in those structures.

For example, adding a column changes the schema; inserting a student
adds data.

## 5. Table vocabulary

-   **Table:** a collection of related records.
-   **Column / attribute:** a property, such as `student_name`.
-   **Row / record / tuple:** one record in a table.
-   **Value:** a single item, such as `Ahmed`.

## 6. Data types used in the students table

-   `INT`: integer values.
-   `VARCHAR(n)`: variable-length text with a declared maximum length.
-   `TIMESTAMP`: date-and-time value.
-   `CURRENT_TIMESTAMP`: current timestamp used as a default when a
    value is not supplied.

Choose types based on the meaning and valid range of the data. For
example, storing a date of birth is often more useful than storing an
age, because age changes over time.

## 7. Constraints

-   `PRIMARY KEY`: uniquely identifies each row; it cannot contain
    `NULL`.
-   `NOT NULL`: requires a value other than `NULL`.
-   `UNIQUE`: prevents duplicate non-`NULL` values under the column's
    comparison rules. In MySQL, a `UNIQUE` column can generally contain
    multiple `NULL` values unless it is also `NOT NULL`.
-   `CHECK`: requires a condition to evaluate to true or unknown; pair
    it with `NOT NULL` when missing values must also be rejected. MySQL
    enforces `CHECK` constraints in MySQL 8.0.16 and later.
-   `DEFAULT`: supplies a value when an insert omits the column or uses
    `DEFAULT`.
-   `FOREIGN KEY`: enforces a relationship to a referenced key in
    another table; this will be covered later.

## 8. First table: `students`

The table created in MySQL Workbench:

``` sql
CREATE TABLE students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    age INT NOT NULL CHECK(age >= 16),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Design review

-   `student_id` is generated automatically and identifies each row.
-   `student_name` is required. `NOT NULL` does not reject an empty
    string by itself.
-   `email` is required and unique.
-   `age` is required and must be at least 16.
-   `created_at` receives the current timestamp when the insert does not
    provide a value.

The age rule is a business rule for this exercise, not a universal rule
for student databases.

## 9. Practice performed

-   Created `university_db`.
-   Selected it with `USE university_db`.
-   Verified the current database with `SELECT DATABASE()`.
-   Created the `students` table.
-   Inserted a valid student record.
-   Verified the data using `SELECT`.
-   Tested the age `CHECK` and duplicate-email `UNIQUE` constraints.

## 10. Self-check

Try answering these without looking at the notes:

1.  What is the difference between a database and a DBMS?
2.  What is the difference between schema and data?
3.  Why can duplicated data lead to inconsistency?
4.  How is concurrent access different from data redundancy?
5.  What is the difference between `PRIMARY KEY` and `UNIQUE` in MySQL?
6.  Why is `age INT NOT NULL CHECK (age >= 16)` stronger than the
    `CHECK` alone?
7.  Why does `NOT NULL` not necessarily reject an empty string?

## Review log

-   **What I understood well:** Fill this in after reviewing from
    memory.
-   **What I need to revisit:** Fill this in honestly.
-   **One question I can now answer without help:** Add one example.
