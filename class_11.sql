-- 앞 차시에서 만든 product 테이블이 남아있으면 지우고 시작
DROP TABLE IF EXISTS product;

CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  description VARCHAR(200)
);

show tables;

INSERT INTO product (id, name, price, description) VALUES
(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
(5, '아이패드', 800000, 'Apple의 태블릿'),
(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

-- 전체 조회하기
select * from product;

-- 단일 조건 삭제
-- 1. ID가 2인 상품 삭데
delete from product
where id = 2;

-- 2. 가격이 100만원 이상인 상품 삭제하기

select * 
from product
where price >= 1000000;
 
delete from product
where price >= 1000000;

-- 3. 상품 설명에 'Apple'이 포함된 상품 삭제
select * 
from product
where description like '%Apple%';

delete from product
where description like '%Apple%';

-- 복합 조건 삭제
-- 1. 가격이 50만원 이하이며, 상품 설명에 '스마트'가 포함된 상품 삭제
select * 
from product
where price <= 500000 and description like '%스마트%';

delete from product
where price <= 500000 and description like '%스마트%';

-- 2. 상품명이 '갤럭시'로 시작하며, 가격이 100만원 이상인 상품 삭제
select *
from product
where name like '갤럭시%' and price >= 1000000;

delete from product
where name like '갤럭시%' and price >= 1000000;

-- 도전 과제 

-- ID가 5~8인 상품 삭제
select *
from product
where id between 5 and 8;

delete from product
where id between 5 and 8;

-- 상품 설명에 '태블릿'이 포함된 상품 삭제
select *
from product
where description like '%태블릿%';

delete from product
where description like '%태블릿%';

-- 가격이 300,000원 이하인 상품 삭제
select *
from product
where price <= 300000;

delete from product
where price <= 300000;

-- 상품명이 '아이폰' 또는 '아이패드'로 시작하는 상품 삭제
select *
from product
where name like '아이폰%' or name like '아이패드%';

delete from product
where name like '아이폰%' or name like '아이패드%';

-- 가격이 1,000,000원 미만이고 설명에 '삼성'이 포함된 상품 삭제
select *
from product
where price < 1000000 and description like '%삼성%';

delete from product
where price < 1000000 and description like '%삼성%';

select * from dept_emp;
 -- (번호). employees의 dept_emp를 활용하여 emp_no가 10604이고 dept-no가 d005인 사원의 from_date를 1990-04-07에서 1990-04-08으로 수정하기 
select *
from dept_emp
where emp_no = 10604 and dept_no = 'd005';

update dept_emp 
set from_date = '1990-04-08'
where emp_no = 10604 and dept_no = 'd005';

-- 1. dept_emp 테이블에서 from_date가 2000년도 이상 이면서 to_date가 '9999-01-01'가 아닌 값을 출력하세요 (employees 데이터베이스 기준입니다)
select *
from dept_emp
where from_date >= '2000-01-01' and to_date != '9999-01-01';

-- 2. select_practice DB의 student테이블에 age컬럼을 추가하고 grade가 1학년인 학생의 age를 20으로 설정하세요.
select *
from student;

alter table student
add age int;

update student
set age = 20
where grade = 1;

-- 3. employees 데이터베이스의 employees_copy 테이블에 데이터를 실제로 삭제하지 않고 삭제 여부만 표시하는 기능(Soft Delete)을 추가하려고 합니다.
-- 예시) 탈퇴한 회원의 정보를 2년간 보관 후 폐기시 활용

-- 가. 삭제 여부를 저장할 is_deleted 컬럼을 추가하세요.
-- 1) 카피 테이블 생성
use employees;
drop table employees_copy; 
create table employees_copy as select * from employees;
insert into employees_copy select * from employees;
select * from employees_copy;
-- 2) is_deleted 컬럼 추가
select *
from employees_copy;

-- 나. 데이터 타입은 BOOLEAN입니다.
-- 다. 기본값은 FALSE입니다.
-- ALTER TABLE employees_copy
-- ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;

alter table employees_copy
add column is_deleted boolean default false;

-- 라. hire_date가 1985-01-31 이하인 행의 is_deleted 값을 TRUE로 변경하세요.
update employees_copy
set is_deleted = true
where hire_date <= '1985-01-31';

-- 4. 1996-01-03일에 매니저가 된 사람의 사원번호를 10998로 변경한뒤 변경된 사원번호에  매니저이름만 찾아주세요.
use employees;

select emp_no, first_name, last_name
from employees
where emp_no = 10998;

select *
from dept_manager
where from_date = '1996-01-03';

update dept_manager
set emp_no = 10998
where from_date = '1996-01-03';
 
-- 5. employees_copy DB에 email을 추가해주세요. (길이 50)
-- email이 null인 사원은 '이메일이 등록되지 않았습니다.'를 채워주세요.


-- 6. employees에서 hire_date가 1990-01-01 이전인 사원 중 gender가 'F' 인 사원들의  hire_date를 1990-10-31로 변경해주세요.

-- 7. employees DB에 있는 titles 테이블을 복사하고, to_date가 9999로 시작하는 값 삭제하세요.(titles에서 삭제 하지 않게 주의!)

-- 8. employees_copy 테이블에 fired_date 추가하고 디폴트값 null 넣어주세요.

-- 9. employees에서 emp_no 10001~10012이면서  first_name이 P로 시작하는 사원의 gender를 F로 수정해주세요

-- 10. employees에서 first_name이 Aleksandar인 1950년대 출생인 사람을 조회해주세요

-- 11. employees DB의 salaries 테이블에 bonus 컬럼을 추가하고
-- 근무기간이 2000-01-01 ~ 9999-01-01 인 직원들의 보너스를 각 직원 월급의 40%로 수정하시오
-- ( + bonus 컬럼의 DEFAULT 값은 '해당 없음' 입니다.)
















