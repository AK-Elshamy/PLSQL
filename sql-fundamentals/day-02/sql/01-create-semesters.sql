-- Day 2: Create the semesters table.
USE university_db;

CREATE TABLE IF NOT EXISTS semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CONSTRAINT chk_semester_dates CHECK (end_date > start_date)
);

-- Run this INSERT only once; semester_name must be unique.
INSERT INTO semesters (semester_name, start_date, end_date)
VALUES
    ('Fall 2026', '2026-09-01', '2027-01-15'),
    ('Spring 2027', '2027-02-01', '2027-06-15');

SELECT * FROM semesters;
