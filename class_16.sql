use employees;

select * 
from employees_copy3;

desc employees_copy3;

show index from employees_copy3; 

-- 인덱스 생성 후 다시 검색 
select * 
from employees_copy3
where gender = 'M';

-- gender에 인덱스 추가
alter table employees_copy3
add index idx_gender (gender);

select * 
from employees_copy3
where first_name = 'Georgi';

select * 
from employees_copy3
where emp_no = '15689';

-- 실습) 인덱스 키 직접 만들어서 실행 계획 확인해서 결과 비교하기

-- 인덱스 생성 후 검색
select * 
from employees_copy3
where first_name = 'Syozo';

-- first_name과 last_name에 인덱스 추가
alter table employees_copy3
add index idx_first_name (first_name);

-- 참고: 쿼리 앞에 EXPLAIN을 사용하면 쿼리 실행 계획을 바로 확인할 수 있음
-- 예시)
explain select * 
from employees_copy3
where first_name = 'Syozo';


