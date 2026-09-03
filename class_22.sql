use employees;

show tables;

select *
from employees;

select *
from departments;

select *
from dept_emp;

select *
from dept_manager;

select *
from product;

select *
from salaries;

select *
from titles;



-- **문제 1: employees db를 활용하여 INNER JOIN - from_date가 '1985-02-03' 또는 '1985-02-05'인 사원의 emp_no와 dept_no 조회**

-- - **설명**: INNER JOIN 을 활용.

select dept_emp.emp_no, departments.dept_no
from departments
inner join dept_emp
on departments.dept_no = dept_emp.dept_no
where dept_emp.from_date in ('1985-02-03','1985-02-05');

-- outer join
-- **문제 2: LEFT JOIN**

-- - **설명**: departments 정보와 LEFT JOIN 을 사용하여 from_date가 '1985-02-03' 또는 '1985-02-05'인 사원의 정보를 조회하기.
-- 조건 1. 사원의 정보는 dept_no, dept_name, emp_no, from_date, to_date가 줄력되어야 합니다.
-- 조건 2. 중복된 컬럼없이 출력하세요.

select departments.dept_no, departments.dept_name, dept_emp.emp_no, dept_emp.from_date, dept_emp.to_date 
from departments
left join dept_emp
on departments.dept_no = dept_emp.dept_no
where dept_emp.from_date in ('1985-02-03','1985-02-05');

-- outer join
-- **문제 2: LEFT JOIN**

-- - **설명**: employees db과 LEFT JOIN 을 사용하여 hire_date가 1993-02-14 성별이 F인 사람의 정보 조회하기.



-- 1. employees 데이터 베이스에서 dept_manager 테이블와 titles 테이블 inner join를 구하세요

-- 2.직원 번호가 10100 이하이고, 입사일이 '1985-10-14'이며, 
-- 현재 퇴사하지 않은(재직 중인) 직원의 정보와 해당 직원의 부서 정보를 함께 조회하는 쿼리를 작성하세요.

-- 3. 테이블이 자신 테이블과 관계 차수를 형성할 수도 있습니다.

-- (자기참조 N:M 관계 구현) 간단한 SNS의 사용자 팔로우 기능을 만들어 보세요. 사용자 한 명은 여러 사람을 팔로우할 수 있고, 여러 사람에게 팔로우를 받을 수도 있습니다.

-- 사용자 테이블
--  
-- 각 사용자는 다음 정보를 가집니다.
-- user_id: 사용자를 구분하는 번호입니다. BIGINT를 사용하며, 기본 키로 지정하고 자동으로 번호가 증가하게 만드세요.
-- email: 로그인에 사용하는 이메일입니다. 최대 100자까지 저장할 수 있으며, 반드시 입력해야 합니다. 같은 이메일은 중복해서 사용할 수 없습니다.
-- nickname: 사용자의 닉네임입니다. 최대 20자까지 저장할 수 있으며, 반드시 입력해야 합니다.

-- 팔로우 테이블 (중간 테이블)
--  
-- 누가 누구를 팔로우했는지 다음과 같이 저장하세요.
-- following_id: 팔로우를 누른 사용자의 user_id입니다. BIGINT를 사용하며, 반드시 입력해야 합니다.
-- follower_id: 팔로우를 받은 사용자의 user_id입니다. BIGINT를 사용하며, 반드시 입력해야 합니다.
-- created_at: 팔로우한 날짜와 시간입니다. 값을 직접 입력하지 않으면 현재 날짜와 시간이 자동으로 저장되게 만드세요.
-- following_id는 사용자 테이블의 user_id를 참조해야 합니다.
-- follower_id는 사용자 테이블의 user_id를 참조해야 합니다.
-- 또한 같은 사용자가 같은 상대방을 두 번 팔로우한 것으로 저장되지 않도록, following_id와 follower_id를 묶어서 기본 키로 지정하세요.
