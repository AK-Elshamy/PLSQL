-- Practice schema for MySQL Workbench. Use a disposable practice database.
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    age INT NOT NULL CHECK (age >= 16),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS semesters (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    CONSTRAINT fk_enrollments_student FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT fk_enrollments_course FOREIGN KEY (course_id) REFERENCES courses(course_id),
    CONSTRAINT fk_enrollments_semester FOREIGN KEY (semester_id) REFERENCES semesters(semester_id),
    CONSTRAINT uq_student_course_semester UNIQUE (student_id, course_id, semester_id)
);
