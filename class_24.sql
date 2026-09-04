use employees;

show tables;

select *
from employees;

select *
from titles;

select *
from dept_manager;

select *
from departments;

select *
from dept_emp;

select *
from e;

select *
from employees;

-- self join을 활용해서 무엇을 알 수 있는지 파악하기

-- dept_manager와 employees 테이블을 활용하여 아직 퇴사하지 않은자(to_date: 9999-01-01로 표시된 자)의 아래의 정보를 출력해주세요.:)
-- 단, join을 활용해주세요. 

-- 1. 해당 직원에 대한
-- 가. 입사일(from_date)
-- 나. 사번(emp_no)
-- 다. 이름(first_name) 
-- 라. 성(last_name)

select d.from_date, 
	   d.emp_no,
	   e.first_name, 
       e.last_name
from dept_manager d
join employees e  -- first_name과 last_name을 찾기 위한 사본 테이블
on d.emp_no = e.emp_no
where to_date = '9999-01-01';