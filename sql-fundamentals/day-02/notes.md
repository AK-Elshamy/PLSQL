# Day 2 — Relational Model, Keys & Relationships

## Learning goals
- Understand the relational model's basic terms.
- Distinguish superkeys, candidate keys, primary keys, alternate keys, and foreign keys.
- Model one-to-one, one-to-many, and many-to-many relationships.
- Model a student's course enrollment across semesters without losing history.

## Core terms
- **Relation:** a table in the relational model.
- **Tuple:** a row.
- **Attribute:** a column.
- **Domain:** the set of valid values for an attribute.
- **Schema:** the database structure/definition.
- **Instance:** the data stored at a particular time.

SQL tables can contain duplicate rows unless constraints prevent them; this differs from the classical relational model's set-based definition.

## Keys
- **Superkey:** any set of attributes that uniquely identifies a row; it may contain unnecessary attributes.
- **Candidate key:** a minimal superkey. Removing any attribute means it no longer uniquely identifies a row.
- **Primary key (PK):** the candidate key selected as the table's main identifier. It must be unique and not NULL.
- **Alternate key:** a candidate key not selected as the primary key.
- **Foreign key (FK):** attribute(s) that reference a key in another table (or sometimes the same table). An FK can repeat; it may be NULL unless constrained as `NOT NULL`.

## Relationships
- **One-to-one (1:1):** commonly modeled with an FK plus `UNIQUE`.
- **One-to-many (1:N):** put the FK on the many side.
- **Many-to-many (M:N):** use a junction/associative table, such as `enrollments`.

## Enrollment design
Tables:
- `students(student_id, ...)`
- `courses(course_id, ...)`
- `semesters(semester_id, semester_name, start_date, end_date)`
- `enrollments(enrollment_id, student_id, course_id, semester_id)`

Each enrollment row represents one student's registration in one course in one semester.

### Why use `enrollment_id`?
A surrogate key gives each enrollment a simple, stable identifier. It also makes other tables (for example, `payments`) easier to reference. We still need `UNIQUE(student_id, course_id, semester_id)` to prevent duplicate registration in the same course and semester.

A composite primary key of `(student_id, course_id, semester_id)` could also work. The choice depends on how the enrollment will be referenced and the application's requirements. An `enrollment_id` does not automatically make every query faster; indexes and query patterns matter.

## Important design rule
If the same student takes the same course in a different semester, create a **new enrollment row**. Do not overwrite the old row's `semester_id`, because that would erase historical information.

## Constraints used
- `PRIMARY KEY`: uniquely identifies each row.
- `FOREIGN KEY`: keeps references valid.
- `UNIQUE(student_id, course_id, semester_id)`: blocks duplicate enrollment for the same student/course/semester combination.
- `CHECK(end_date > start_date)`: ensures the semester ends after it starts.
- `NOT NULL`: requires a value.

## Practice questions
1. Why does `enrollments` need foreign keys to all three parent tables?
2. Why can the same `student_id` appear in multiple enrollment rows?
3. What does the composite `UNIQUE` constraint prevent?
4. Why should a repeated course in a later semester be a new row?
