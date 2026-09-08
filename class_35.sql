
DROP DATABASE IF EXISTS group_practice;
CREATE DATABASE group_practice;
USE group_practice;

DROP TABLE IF EXISTS tb_employees;

CREATE TABLE tb_employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO tb_employees (name, department, salary) VALUES
('김도현', '영업',   48000000),
('이소영', '영업',   55000000),
('박지영', '마케팅', 50000000),
('최민재', '마케팅', 45000000),
('강민호', '인사',   35000000),
('오수진', '인사',   40000000),
('정우성', '개발',   75000000),
('한지은', '개발',   65000000),
('윤서현', '개발',   72000000),
('문태준', '개발',   68000000),
('신동엽', '영업',   52000000),
('장미란', '영업',   51000000),
('황아영', '마케팅', 47000000),
('류현진', '인사',   43000000),
('김나영', '인사',   39000000);

select * from tb_employees;


-- 1. 위 데이터에서 부서별 평균 급여 구하기
select department, round(avg(salary), 0) as AverageSalary
from tb_employees
group by department;

-- 2. 부서별 평균 급여가 5,000만원 이상인 부서만 결과 집합으로 출력
select department, round(avg(salary), 0) as AverageSalary
from tb_employees
group by department
having avg(salary) >= 50000000;

-- 3. 부서별 최고 급여 출력
select department, max(salary) as 부서별최고급여
from tb_employees
group by department;

-- 4. 직원이 4명 이상인 부서만 출력
select department, count(*) as 부서인원
from tb_employees
group by department
having count(*) >= 4;

-- 5. 부서별 평균 급여와 직원 수를 출력하기
select department, round(avg(salary), 0) as AverageSalary,
       count(*) as employeeCount
from tb_employees
group by department
having count(*);

-- where절과 having 절의 차이
-- where: 묶기 전에 걸러낸다.
select round(avg(salary)) as 부서별평균
from tb_employees
where salary >= 50000000 
group by department;
-- 5000만원 미만인 직원을 먼저 제외한 뒤 그룹을 묶어 부서별 평균을 구했다.
-- 먼저 필터링이 이루어진 후에 group by 가 실행된다.

-- HAVING: 묶는 뒤에 그룹을 걸러낸다.
select department, round(avg(salary)) as 부서별평균
from tb_employees
group by department
having avg(salary) >= 50000000;

-- 6. 각 부서의 급여 격차가 큰 곳을 찾으려고 합니다. 
-- 최고 급여와 최저 급여의 차이가 1000만원 이상인 부서의 부서명, 최고 급여, 최저 급여, 급여 차이를 조회하세요.
--  (단 여기는 그룹바이가 필요 없음)

select department, 
	   max(salary) as 최고급여, 
       min(salary) as 최저급여,
       max(salary) - min(salary) as 급여차이
from tb_employees
group by department
having max(salary)-min(salary) >= 10000000;








