-- 1. [DDL] 부서(Department) 및 사원(Employee) 테이블 생성
-- 가. 부서 테이블 생성
create table department (
-- 1) 부서 ID(기본키)
dept_id INT PRIMARY KEY,
-- 2) 부서명
dept_name varchar(100) not null 
); 

-- 부서 테이블 조회
select * from department;

-- 나. 사원 테이블 생성
create table employee (
-- 1) 사원ID(기본키)
emp_id int primary key,
-- 2) 사원 이름
emp_name varchar(100) not null,
-- 3) 소속 부서 ID(외래키)
dept_id INT,
foreign key (dept_id) references department(dept_id)  
);

-- 사원 테이블 조회
select * from Employee;

-- 2. [DML] 테스트 데이터 입력 및 조인 조회
--   가. Department 테이블에 테스트 데이터 삽입
insert into department (dept_id, dept_name)
values
	(10, '인사팀'),
	(20, '개발팀'),
	(30, '영업팀');
    
--   나. Employee 테이블에 테스트 데이터 삽입
insert into employee (emp_id, emp_name, dept_id)
values
	 (1001, '김철수', 10),	
	 (1002, '이영희', 20),	
	 (1003, '박민수', 20),	
	 (1004, '정수진', 30);	
     
-- 다. 사원 이름과 해당 사원이 소속된 부서명을 함께 출력하는 JOIN 쿼리
select
	e.emp_name as 사원이름,
    d.dept_name as 부서명
from employee e
inner join department d on e.dept_id = d.dept_id;

-- 3. [DCL] 특정 사용자(dev_user)에게 테이블 조회 권한 부여
-- dev_user 사용자에게 Employee 테이블에 대한 SELECT 권한 부여
-- 가. 내부(로컬)에서만 접속하는 경우
create user 'dev_user'@'localhost' identified by 'password123';
-- 나. 권한 부여
grant select on employee to 'dev_user'@'localhost';
     

