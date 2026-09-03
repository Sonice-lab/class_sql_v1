-- inner join의 특수한 형태(cross join)
select * from tb_student
join tb_grade; -- join(inner join을 의미)
-- + on 조건식 -- 현재 join 구문이 on 조건절이 없는 상태 -> 크로스 조인

select count(*) from tb_grade;
select * from tb_grade;

select count(*) from tb_student;
select * from tb_student;

-- 6 * 6 총 36개의 튜플이 생성된다.(36가지의 경우의 수, 조합)

-- 위 내용은 의미없는 조합니다. 가능한 on 절을 사용하여 의미있는 조합을 도출해야 한다.

select tb_student.no, tb_student.name, tb_student.grade, 
	   tb_grade.grade, tb_grade.score
from tb_student 
inner join tb_grade
on tb_grade.grade = tb_student.grade;

select s.no, s.name, s.grade, 
	   g.grade, g.score
from tb_student s 
inner join tb_grade g
on g.grade = s.grade;

-- 실습 2: outer Join 방향 먼저 개념 잡기
SELECT s.name, g.score 
FROM tb_student s 
LEFT JOIN tb_grade g 
ON s.grade = g.grade;

SELECT g.score, s.name 
FROM tb_student s 
LEFT JOIN tb_grade g 
ON s.grade = g.grade;

-- 추가 테이블 생성 및 데이터 수정

CREATE TABLE tb_club (
    club_id   INT PRIMARY KEY,
    club_name VARCHAR(20)
);

INSERT INTO tb_club VALUES (1, '축구부'), (2, '밴드부');

ALTER TABLE tb_student ADD COLUMN club_id INT;
ALTER TABLE tb_student ADD FOREIGN KEY (club_id) REFERENCES tb_club(club_id);

UPDATE tb_student SET club_id = 1 WHERE no = 20170001;  -- 조이
UPDATE tb_student SET club_id = 2 WHERE no = 20170020;  -- 앤드류
UPDATE tb_student SET club_id = 1 WHERE no = 20180800;  -- 데이지
-- 다나, 스카이, 제임스는 동아리 없음 (club_id 가 NULL)

SELECT * FROM tb_club;
SELECT * FROM tb_student;

-- 학생 정보 + 등급 점수 + 동아리 이름

select s.*, g.score, c.club_name 
from tb_student s 
left join tb_grade g
on s.grade = g.grade
left join tb_club c
on s.club_id = c.club_id;

-- left join 연습
-- 상황1. 학생 명단이 모두 검색되어야 함
select * 
from tb_student s
left join tb_grade g
on s.grade = g.grade;

-- right join 연습
-- 상황 1. 모든 등급이 나와야 함
select  *
from tb_student s
right join tb_grade g
on s.grade = g.grade;

-- **문제 1: INNER JOIN - 등급이 'A' 또는 'B'인 학생 조회**

-- - **설명**: INNER JOIN 을 사용하여 성적 등급이 'A' 또는 'B'인 학생의 이름, 나이, 등급, 점수를 조회하세요.
-- - **힌트**
--     - tb_student 와 tb_grade 를 INNER JOIN 으로 결합
--     - ON 조건으로 등급(grade) 매핑
--     - WHERE 절에서 등급 조건 추가

select  s.name, s.age, s.grade, g.score
from tb_student s
inner join tb_grade g
on s.grade = g.grade
where g.grade = 'A' or  g.grade ='B';

-- **문제 2: LEFT JOIN - 모든 남학생 조회**

-- - **설명**: LEFT JOIN 을 사용하여 모든 남학생(gender = 'M')의 이름, 등급, 점수를 조회하세요. 등급이 없는 학생도 표시되어야 합니다.
-- - **힌트**
--     - tb_student 를 기준 테이블로 설정
--     - WHERE 절에서 성별 조건 추가

select *
from tb_student;

select *
from tb_grade;

select s.name, g.grade, g.score
from tb_student s
left join tb_grade g
on s.grade = g.grade
where gender = 'M';
