DROP DATABASE IF EXISTS `School_Timetable`;
CREATE DATABASE `School_Timetable`;
USE `School_Timetable`;

-- =========================
-- SCHOOL TIMETABLE DATASET
-- =========================
-- Goal for students:
-- Use this dataset to create a timetable for classes using SQL.
-- Students should avoid teacher clashes, room clashes, and duplicate periods.

CREATE TABLE classes (
  class_id INT NOT NULL,
  class_name VARCHAR(20) NOT NULL,
  section VARCHAR(5) NOT NULL,
  class_teacher_id INT,
  room_id INT,
  PRIMARY KEY (class_id)
);

CREATE TABLE teachers (
  teacher_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  gender VARCHAR(10),
  experience_years INT,
  PRIMARY KEY (teacher_id)
);

CREATE TABLE subjects (
  subject_id INT NOT NULL,
  subject_name VARCHAR(50) NOT NULL,
  subject_code VARCHAR(20) NOT NULL,
  weekly_periods INT NOT NULL,
  PRIMARY KEY (subject_id)
);

CREATE TABLE students (
  student_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  class_id INT NOT NULL,
  roll_no INT NOT NULL,
  gender VARCHAR(10),
  PRIMARY KEY (student_id)
);

CREATE TABLE rooms (
  room_id INT NOT NULL,
  room_name VARCHAR(30) NOT NULL,
  room_type VARCHAR(30),
  capacity INT,
  PRIMARY KEY (room_id)
);

CREATE TABLE school_days (
  day_id INT NOT NULL,
  day_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (day_id)
);

CREATE TABLE periods (
  period_id INT NOT NULL,
  period_number INT NOT NULL,
  start_time TIME NOT NULL,
  end_time TIME NOT NULL,
  period_type VARCHAR(20) DEFAULT 'Teaching',
  PRIMARY KEY (period_id)
);

CREATE TABLE teacher_subject_class (
  mapping_id INT NOT NULL,
  teacher_id INT NOT NULL,
  subject_id INT NOT NULL,
  class_id INT NOT NULL,
  PRIMARY KEY (mapping_id)
);

-- Students can fill this table by writing INSERT queries
-- after deciding the timetable.
CREATE TABLE timetable (
  timetable_id INT NOT NULL AUTO_INCREMENT,
  class_id INT NOT NULL,
  teacher_id INT NOT NULL,
  subject_id INT NOT NULL,
  room_id INT NOT NULL,
  day_id INT NOT NULL,
  period_id INT NOT NULL,
  PRIMARY KEY (timetable_id)
);

INSERT INTO teachers (teacher_id, first_name, last_name, gender, experience_years)
VALUES
(1, 'Arjun', 'Reddy', 'Male', 8),
(2, 'Priya', 'Sharma', 'Female', 6),
(3, 'Rahul', 'Verma', 'Male', 10),
(4, 'Sneha', 'Iyer', 'Female', 5),
(5, 'Kiran', 'Kumar', 'Male', 7),
(6, 'Anjali', 'Mehta', 'Female', 9),
(7, 'Vikram', 'Singh', 'Male', 4),
(8, 'Meera', 'Nair', 'Female', 11),
(9, 'Suresh', 'Patel', 'Male', 12),
(10, 'Divya', 'Rao', 'Female', 3);

INSERT INTO rooms (room_id, room_name, room_type, capacity)
VALUES
(1, 'Room 101', 'Classroom', 40),
(2, 'Room 102', 'Classroom', 40),
(3, 'Room 103', 'Classroom', 40),
(4, 'Science Lab', 'Lab', 30),
(5, 'Computer Lab', 'Lab', 35),
(6, 'Library', 'Activity Room', 50),
(7, 'Sports Ground', 'Outdoor', 100);

INSERT INTO classes (class_id, class_name, section, class_teacher_id, room_id)
VALUES
(1, 'Grade 6', 'A', 2, 1),
(2, 'Grade 6', 'B', 4, 2),
(3, 'Grade 7', 'A', 1, 3),
(4, 'Grade 8', 'A', 6, 1),
(5, 'Grade 9', 'A', 3, 2);

INSERT INTO subjects (subject_id, subject_name, subject_code, weekly_periods)
VALUES
(1, 'Mathematics', 'MATH', 5),
(2, 'English', 'ENG', 5),
(3, 'Science', 'SCI', 4),
(4, 'Social Studies', 'SST', 4),
(5, 'Computer Science', 'CS', 3),
(6, 'Hindi', 'HIN', 3),
(7, 'Physical Education', 'PE', 2),
(8, 'Library', 'LIB', 1);

INSERT INTO school_days (day_id, day_name)
VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday');

INSERT INTO periods (period_id, period_number, start_time, end_time, period_type)
VALUES
(1, 1, '09:00:00', '09:45:00', 'Teaching'),
(2, 2, '09:45:00', '10:30:00', 'Teaching'),
(3, 3, '10:30:00', '11:15:00', 'Teaching'),
(4, 4, '11:15:00', '12:00:00', 'Teaching'),
(5, 5, '12:00:00', '12:30:00', 'Lunch'),
(6, 6, '12:30:00', '01:15:00', 'Teaching'),
(7, 7, '01:15:00', '02:00:00', 'Teaching'),
(8, 8, '02:00:00', '02:45:00', 'Teaching');

INSERT INTO teacher_subject_class (mapping_id, teacher_id, subject_id, class_id)
VALUES
-- Grade 6 A
(1, 2, 1, 1),
(2, 4, 2, 1),
(3, 8, 3, 1),
(4, 5, 4, 1),
(5, 10, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 9, 8, 1),

-- Grade 6 B
(9, 4, 1, 2),
(10, 2, 2, 2),
(11, 8, 3, 2),
(12, 5, 4, 2),
(13, 10, 5, 2),
(14, 6, 6, 2),
(15, 7, 7, 2),
(16, 9, 8, 2),

-- Grade 7 A
(17, 1, 1, 3),
(18, 4, 2, 3),
(19, 3, 3, 3),
(20, 5, 4, 3),
(21, 10, 5, 3),
(22, 6, 6, 3),
(23, 7, 7, 3),
(24, 9, 8, 3),

-- Grade 8 A
(25, 3, 1, 4),
(26, 2, 2, 4),
(27, 8, 3, 4),
(28, 5, 4, 4),
(29, 10, 5, 4),
(30, 6, 6, 4),
(31, 7, 7, 4),
(32, 9, 8, 4),

-- Grade 9 A
(33, 3, 1, 5),
(34, 2, 2, 5),
(35, 8, 3, 5),
(36, 1, 4, 5),
(37, 10, 5, 5),
(38, 6, 6, 5),
(39, 7, 7, 5),
(40, 9, 8, 5);

INSERT INTO students (student_id, first_name, last_name, class_id, roll_no, gender)
VALUES
(1, 'Aarav', 'Kumar', 1, 1, 'Male'),
(2, 'Ishita', 'Rao', 1, 2, 'Female'),
(3, 'Rohan', 'Mehta', 1, 3, 'Male'),
(4, 'Saanvi', 'Sharma', 1, 4, 'Female'),
(5, 'Kabir', 'Patel', 1, 5, 'Male'),

(6, 'Anaya', 'Reddy', 2, 1, 'Female'),
(7, 'Vihaan', 'Singh', 2, 2, 'Male'),
(8, 'Myra', 'Nair', 2, 3, 'Female'),
(9, 'Aditya', 'Verma', 2, 4, 'Male'),
(10, 'Diya', 'Iyer', 2, 5, 'Female'),

(11, 'Krish', 'Rao', 3, 1, 'Male'),
(12, 'Avni', 'Patel', 3, 2, 'Female'),
(13, 'Yash', 'Kumar', 3, 3, 'Male'),
(14, 'Nisha', 'Mehta', 3, 4, 'Female'),
(15, 'Aryan', 'Sharma', 3, 5, 'Male'),

(16, 'Tanvi', 'Reddy', 4, 1, 'Female'),
(17, 'Dev', 'Singh', 4, 2, 'Male'),
(18, 'Kiara', 'Nair', 4, 3, 'Female'),
(19, 'Manav', 'Verma', 4, 4, 'Male'),
(20, 'Riya', 'Iyer', 4, 5, 'Female'),

(21, 'Harsh', 'Rao', 5, 1, 'Male'),
(22, 'Aditi', 'Patel', 5, 2, 'Female'),
(23, 'Neil', 'Kumar', 5, 3, 'Male'),
(24, 'Sara', 'Mehta', 5, 4, 'Female'),
(25, 'Om', 'Sharma', 5, 5, 'Male');

-- =========================
-- OPTIONAL SAMPLE TIMETABLE
-- =========================
-- This is a partial sample only.
-- Students can delete this and create their own complete timetable.

INSERT INTO timetable (class_id, teacher_id, subject_id, room_id, day_id, period_id)
VALUES
(1, 2, 1, 1, 1, 1),
(1, 4, 2, 1, 1, 2),
(1, 8, 3, 4, 1, 3),
(1, 5, 4, 1, 1, 4),
(1, 10, 5, 5, 1, 6),
(1, 6, 6, 1, 1, 7),
(1, 7, 7, 7, 1, 8),

(2, 4, 1, 2, 1, 1),
(2, 2, 2, 2, 1, 2),
(2, 8, 3, 4, 1, 4),
(2, 5, 4, 2, 1, 6),
(2, 10, 5, 5, 1, 7),
(2, 6, 6, 2, 1, 8),

(3, 1, 1, 3, 1, 1),
(3, 4, 2, 3, 1, 3),
(3, 3, 3, 4, 1, 4),
(3, 5, 4, 3, 1, 6),
(3, 10, 5, 5, 1, 8);


-- =========================
-- USEFUL STUDENT TASK QUERIES
-- =========================
-- 1. View Timetable in Readable Format 
SELECT
    c.class_name,
    c.section,
    d.day_name,
    p.period_number,
    p.start_time,
    p.end_time,
    s.subject_name,
    CONCAT(t.first_name, ' ', t.last_name) AS teacher_name,
    r.room_name
FROM timetable tt
JOIN classes c
    ON tt.class_id = c.class_id
JOIN school_days d
    ON tt.day_id = d.day_id
JOIN periods p
    ON tt.period_id = p.period_id
JOIN subjects s
    ON tt.subject_id = s.subject_id
JOIN teachers t
    ON tt.teacher_id = t.teacher_id
JOIN rooms r
    ON tt.room_id = r.room_id
ORDER BY c.class_id, d.day_id, p.period_number;

-- 2. Find Teacher Clashes
SELECT
    teacher_id,
    day_id,
    period_id,
    COUNT(*) AS clash_count
FROM timetable
GROUP BY teacher_id, day_id, period_id
HAVING COUNT(*) > 1;

-- 3. Find Room Clashes
SELECT
    room_id,
    day_id,
    period_id,
    COUNT(*) AS room_clash_count
FROM timetable
GROUP BY room_id, day_id, period_id
HAVING COUNT(*) > 1;

-- 4. Check Subject Weekly Period Count by Class
SELECT
    c.class_name,
    c.section,
    s.subject_name,
    s.weekly_periods AS required_periods,
    COUNT(tt.timetable_id) AS assigned_periods
FROM classes c
JOIN subjects s
LEFT JOIN timetable tt
    ON c.class_id = tt.class_id
    AND s.subject_id = tt.subject_id
GROUP BY c.class_id, s.subject_id
ORDER BY c.class_id, s.subject_id;

-- 5. Check Invalid Teacher-Subject-Class Assignments
SELECT tt.*
FROM timetable tt
LEFT JOIN teacher_subject_class tsc
    ON tt.teacher_id = tsc.teacher_id
    AND tt.subject_id = tsc.subject_id
    AND tt.class_id = tsc.class_id
WHERE tsc.mapping_id IS NULL;