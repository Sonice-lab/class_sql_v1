-- 260907 1일 1쿼리
use employees;
show tables;
select * from employees;

-- dept_emp의 테이블을 활용하여 직원 전체(퇴사자 포함)의 아래의 정보를 추출하세요.:)
  -- 1. 사원번호
  -- 2. 입사년도
  -- 3. 입사월
  -- 4. 입사일
     
-- 1. 입사일을 추출해보자.
select * from dept_emp;

select emp_no,
	  extract(year from from_date) as 입사연도,
	  extract(month from from_date) as 입사월,
	  extract(day from from_date) as 입사일
from dept_emp;


