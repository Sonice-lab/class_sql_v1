DROP DATABASE IF EXISTS type_practice;
CREATE DATABASE type_practice;
USE type_practice;

CREATE TABLE student (
  id INT PRIMARY KEY,
  grade tinyint not null,
  name VARCHAR(50) NOT NULL,
  major VARCHAR(50) NOT NULL,
  notes text,
  admission_date DATE NOT NULL
);

create table subject (
subject_id int primary key,
subject_code char(4) not null,
subject_name varchar(50) not null,
credit int not null,
department_code char(2) not null, 
professor varchar(50) not null, 
created_at datetime default current_timestamp
);


INSERT INTO subject (subject_id, subject_code, subject_name, credit, department_code, professor, created_at)
VALUES
    (1, 'CS01', '데이터베이스 시스템', 3, 'CS', '김영희', '2026-03-02 10:00:00'),
    (2, 'MA01', '미적분학', 4, 'MA', '이철수', '2026-03-02 09:00:00'),
    (3, 'PH01', '양자물리학', 3, 'PH', '박민준', '2026-03-02 11:00:00');
    
    
SELECT * FROM subject;

create table enrollment (
enrollment_id int primary key,
student_id int not null,
subject_id int not null,
score decimal(4,2),
enrolled_at datetime not null
);

INSERT INTO enrollment (enrollment_id, student_id, subject_id, score, enrolled_at)
VALUES
    (1, 1001, 1, 85.50, '2026-03-02 12:00:00'),
    (2, 1002, 2, 92.00, '2026-03-02 12:30:00'),
    (3, 1003, 3, 78.75, '2026-03-02 13:00:00');

SELECT * FROM enrollment;

