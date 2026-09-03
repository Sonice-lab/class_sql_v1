DROP DATABASE IF EXISTS green_school;
CREATE DATABASE green_school;
USE green_school;

CREATE TABLE tb_grade (
    grade CHAR(1) PRIMARY KEY,
    score INT
);

CREATE TABLE tb_student (
    no INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    gender ENUM('F', 'M') NOT NULL,
    age INT,
    grade CHAR(1),
    FOREIGN KEY (grade) REFERENCES tb_grade(grade)
);

-- tb_grade 데이터 삽입
INSERT INTO tb_grade (grade, score) VALUES
    ('A', 100),
    ('B', 80),
    ('C', 60),
    ('D', 40),
    ('E', 20),
    ('F', 0);

-- tb_student 데이터 삽입
INSERT INTO tb_student (no, name, gender, age, grade) VALUES
    (20170001, '조이',   'F', 25, 'B'),
    (20170020, '앤드류', 'M', 26, 'B'),
    (20180800, '데이지', 'F', 24, 'A'),
    (20190123, '다나',   'F', 23, 'A'),
    (20201000, '스카이', 'M', 22, 'D'),
    (20210001, '제임스', 'M', 21, NULL);
    
    select * from tb_grade;
    select * from tb_student;