-- Week 1, Day 1
-- Create the practice database and the first table.
-- Run this in MySQL Workbench.

CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    age INT NOT NULL CHECK (age >= 16),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inspect the table structure.
DESCRIBE students;

-- Inspect the currently selected database.
SELECT DATABASE();
