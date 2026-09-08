
DROP DATABASE IF EXISTS alias_practice;
CREATE DATABASE alias_practice;
USE alias_practice;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);

INSERT INTO students VALUES (1, '홍길동', 75), (2, '김철수', 55);

SELECT * FROM students;


-- 1. 별칭
select 100 as student_id, '반장' as title;

-- 2. 테이블에 별칭 주기
select  s.name
from students as s;

-- 3. 사용자 변수란?
-- MySQL에서 @기호를 사용하여 사용자 정의 변수를 선언하고 사용할 수 있다.
-- 이 변수는 세션 단위로 유지되며, 간단한 데이터 저장과 조건 확인에 유용함.

-- 변수에 값 저장
set @score = 85;

-- 변수 출력
select @score as 점수;

-- 주의점!
-- 1. 선언하지 않은 변수를 출력하면 NULL이다.
select @never_set;
-- 2. 오류가 발생하지 않기 때문에 변수명을 선언할 때는 오타를 조심해야 함.

-- 3. 변수에 쿼리 결과 저장하기
-- 문법 (SELECT 컬럼 INTO 변수 FROM 테이블 WHERE 조건; )
-- SELECT..INTO 이 문법은 쿼리 결과를 변수에 저장할 수 있음.

-- students 테이블에서 점수를 가져와서 변수에 저장 가능
select score into @student_score 
from students 
where id = 1;

-- 확인
select @student_score;
-- 단, 컬럼과 변수의 개수가 일치하여야 하며, 앞에서부터 순서대로 짝지어진다.

select name, score into @n, @s from students where id = 2;
-- 조회된 값이 담긴다. select .. into..

select @n as name, @s as score;
 
-- 에러 확인: 여러 행  →  에러가 나서 바로 오류를 인지할 수 있음
-- Error Code: 1172. Result consisted of more than one row
-- 하나의 row보다 훨씬 더 많이 생성 
-- 다만 0행일때는 에러가 나지 않는다.
SELECT score INTO @s2 FROM students;

-- 주의!: 0행일 때
-- 0 row(s) affected, 1 warning(s): 1329 No data - zero rows fetched, selected, or processed

set @zero = null;
select score into @zero from students
where id = 99;

select @zero;

-- 4. if 함수 사용하기
select name, score,
	if(score >= 60, 'PASS', 'FAIL') as result
    from students;



