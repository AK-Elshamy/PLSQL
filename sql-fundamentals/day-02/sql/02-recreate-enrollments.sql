-- WARNING: DROP TABLE permanently removes all data in the existing enrollments table.
-- Run ONLY if it contains disposable practice data. Back up/migrate needed data first.
USE university_db;

DROP TABLE IF EXISTS enrollments;

CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,

    CONSTRAINT uq_student_course_semester
        UNIQUE (student_id, course_id, semester_id),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id) REFERENCES students(student_id),

    CONSTRAINT fk_enrollment_course
        FOREIGN KEY (course_id) REFERENCES courses(course_id),

    CONSTRAINT fk_enrollment_semester
        FOREIGN KEY (semester_id) REFERENCES semesters(semester_id)
);

DESCRIBE enrollments;
