DROP DATABASE IF EXISTS select_practice;
CREATE DATABASE select_practice;
USE select_practice;

CREATE TABLE customer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  email VARCHAR(50),
  address VARCHAR(100)
);

INSERT INTO customer (name, email, address) VALUES
('김철수', 'kim@example.com', '서울시 강남구'),
('박영희', 'park@example.com', '서울시 서초구'),
('이민수', NULL, '경기도 성남시'),
('최영진', 'choi@example.com', '서울시 송파구'),
('한미영', 'han@example.com', '경기도 수원시'),
('강종현', 'kang@example.com', '서울시 강서구');

SELECT * FROM customer;

-- ---------------------------
-- SELECT 구문, WHERE 절 연습 
-- ---------------------------

-- 1. 서울시 강남구에 사는 고객 조회 (컬럼은 id와 name만 조회 + address)
-- 문자열을 비교할 때는 공백까지 일치하여야 한다.
SELECT id, name, address FROM customer WHERE address = '서울시 강남구';

-- 2. email이 NULL인 고객 조회
SELECT * FROM customer WHERE email = NULL; -- 조회 불가
-- 이민수의 email이 NULL입니다. NULL은 값이 없다가 아닌, 값을 모른다에 가까움.
-- 그렇기에 email = NULL은 탐색할 수 없음
-- 즉, NULL은 등호로 비교할 수 없음
-- 이런 경우 IS NULL이라는 값을 사용해야 함

-- 조회할 경우 아래로 조회를 하면 탐색된다.
SELECT * FROM customer WHERE email IS NULL;

-- 이름이 '박영희'인 고객 조회 
SELECT * FROM customer WHERE name = '박영희';

-- 복합 조건 --
-- 4. 서울시에 사는 ID 3 이하 고객 조회
SELECT * FROM customer WHERE  address LIKE '서울시%' AND id <= 3;
-- 전체 조회 
SELECT * FROM customer;

-- 5. 서울시에 사는 고객이 아닌 사람들만 조회(NOT - 조건을 부정)
SELECT * FROM customer WHERE address NOT LIKE '서울시%';

-- 6. 서울시 또는 경기도에 거주하는 고객 조회
SELECT * FROM customer WHERE address LIKE '서울시%' OR address LIKE '경기도%';

-- 샘플데이터 추가
INSERT INTO customer (name, email, address) VALUES
('홍길동', 'kim@example.com', '부산시 진구');

-- 특수 연산자
-- ID가 2~5인 고객 조회
-- BETWEEN은 양쪽 끝을 포함한다.
SELECT * FROM customer WHERE id BETWEEN 2 AND 5;
 
-- 서울시 강남구, 서초구, 송파구에 사는 고객만 조회
SELECT * FROM customer WHERE address IN('서울시 강남구', '서울시 서초구', '서울시 송파구');

-- 샘플 데이터 2
CREATE TABLE student (
-- comment는 주석을 의미한다.
    student_id INT PRIMARY KEY COMMENT '학번',
    name VARCHAR(50) NOT NULL COMMENT '이름',
    grade INT NOT NULL COMMENT '학년',
    major VARCHAR(100) NOT NULL COMMENT '학과'
) comment = '학생 정보 테이블';

SELECT * FROM student;
SHOW FULL COLUMNS FROM student;
-- COMMENT는 컬럼과 테이블에 설명을 달아두는 기능.
-- 동작에는 영향을 주지 않지만, 나중에 다른 사람이 테이블을 볼 때 도움이 됩니다.
-- 즉, SHOW FULL COLUMNS FROM student; 명령어로 확인 가능

-- student 샘플 데이터
INSERT INTO student (student_id, name, grade, major)
VALUES
  (1,  '김철수', 1, '컴퓨터공학과'),
  (2,  '박영희', 2, '경영학과'),
  (3,  '이민수', 4, '전자공학과'),
  (4,  '홍길동', 1, '디자인학과'),
  (5,  '임성민', 3, '컴퓨터공학과'),
  (6,  '한지원', 2, '경영학과'),
  (7,  '박준형', 4, '전자공학과'),
  (8,  '김민지', 1, '디자인학과'),
  (9,  '이현수', 3, '컴퓨터공학과'),
  (10, '정미경', 2, '경영학과'),
  (11, '김성진', 4, '전자공학과'),
  (12, '임승환', 1, '디자인학과'),
  (13, '최수빈', 2, '컴퓨터공학과'),
  (14, '오지훈', 3, '경영학과'),
  (15, '윤서아', 2, '전자공학과'),
  (16, '장도윤', 4, '디자인학과');

SELECT * FROM student;

-- student 테이블에서 학과가 '컴퓨터공학과'인 학생들의 이름과 학번을 조회하기
SELECT name, student_id 
FROM student
WHERE major = '컴퓨터공학과';

-- 1. grade가 3인 학생들 조회하기 (컬럼을 지정하지 않으면 전부 출력)
select *
from student
WHERE grade = 3;

-- 2. 이름이 홍길동인 학생 조회하기
select *
from student
WHERE name = '홍길동';

-- 3. 학번이 1부터 10까지인 학생들 조회하기 (BETWEEN)
select *
from student
WHERE student_id between 1 and 10;

-- 4. 학과가 컴퓨터공학과이면서 학년이 2학년인 학생들만 조회하기
select *
from student
where major = '컴퓨터공학과' and grade = 2;

-- 5. 학과가 컴퓨터공학과이거나 학년이 2학년인 학생들 조회하기
select *
from student
where major = '컴퓨터공학과' or grade = 2;
-- and는 조건을 좁히고 or은 조건을 넓힌다. 

-- 6. 학생 이름이 홍길동이 아닌 학생들 조회하기
-- != 와 <>는 같은 의미, 어느 쪽을 사용해도 결과는 같음
select *
from student
where name != '홍길동';

select *
from student
where name <> '홍길동';

-- 7. 학년이 2학년 이상인 학생들 조회하기
select *
from student
where grade >= 2;

-- 8. 학년이 2학년 미만인 학생들 조회하기
select *
from student
where grade < 2;

-- 9. 학년이 1학년, 3학년, 4학년인 학생들 조회하기 (IN 사용)
select *
from student
where grade in(1,3,4);

select *
from student
where grade != 2;

-- 10. 이름이 김씨인 학생들 조회하기 (LIKE 사용)
select *
from student
where name like '김%';

select *
from student
where name like '김__';

-- 11. 컴퓨터공학과이거나 경영학과이면서, 2학년인 학생들 조회하기 (괄호 주의)
select *
from student
where (major = '컴퓨터공학과' or major = '경영학과') and grade = 2 ;

 
