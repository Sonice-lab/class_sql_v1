use employees;

-- 어떠한 db인지 파악하기
-- 1. 어떤 테이블이 존재하는가?
-- 2. 어떤 의미를 가지고 있는가?

-- 3. 1일 1쿼리 진행하기(하루에 스스로 만드는 것이 핵심, 문제를 만들어서 sql 연습 문제 디스코드 채널에 올리기)
-- 단, employee db 안에서 문제를 만들어야 하며 난이도는 상관없음
-- SELECT 구문과 WHERE 문제 만들기


SHOW TABLES;

-- 데이터베이스에 있는 employees라는 테이블의 구조(설계도)를 보여달라는 명령어 
describe employees;
describe departments;

select * from departments;
select * from employees;
select * from salaries;

-- 내가 낸 문제! employees의 departments 테이블을 활용하여 부서번호 d001에서 d009까지만 조회하세요.
select * 
from departments
where dept_no between 'd001' and 'd009';

-- (선생님)1. employees 테이블에서 홍길동이란 사람을 검색하시오. 
select *
from employees
where first_name = '길동';

-- 2. titles 테이블에서 title이 'Senior'로 시작하고, from_date가 1990-01-01 이전인 레코드를 출력하시오.
select *
from titles
where title like 'Senior%'
and from_date < '1990-01-01';

-- 3. employees 테이블에서 emp_no가 10010인 사람을 검색하세요.
select *
from employees
where emp_no = 10010;

-- 4. salaries 테이블에서 salary가 100000 이상인 사람 조회
select *
from salaries
where salary >= 100000;

-- 5. dept_emp 테이블에서 to_date가 9999-01-01이 아닌 값을 출력하세요.
select *
from dept_emp
where to_date != 9999-01-01;

-- 6. EMPLOYEES 테이블에서 남자 직원들을 조회하세요,
select *
from employees
where gender = 'M';

-- 7. employees 테이블에서 birth_date 가 9월인 사람을 출력하시오.
select *
from employees
where MONTH(birth_date) = 9;

-- 8. employees 테이블에서 gender가 M인 first_name과 last_name만 출력하시오.
select first_name, last_name
from employees
where gender = 'M';

-- 9.  employees 테이블에서 emp_n가 10111인 사람을 검색하시오.
select *
from employees
where emp_no = 10111;

-- 10. salaries 테이블에서 from_date가 2000-01-01 이전이고 to_date가 2000-01-01 이후인 salary만 출력해주세요.
select salary
from salaries
where from_date < '2000-01-01'and to_date > '2000-01-01';

-- 11. titles 테이블에서 from_date가  2001-10-11 일부터  2001-10-15 일 까지인  titles  조회하기
select *
from titles
where from_date between '2001-10-11' and '2001-10-15';

-- 12. employees 테이블에서 여자 직원들중 birth_date가 3월인 사람을 조회하시오.
select *
from employees
where month(birth_date) = 3;

-- 13. employees 테이블에서 emp_no가 10000~10050인것중에 성별이 M인것을 조회하시오.
select *
from employees
where emp_no between 10000 and 10050
and gender = 'M';




