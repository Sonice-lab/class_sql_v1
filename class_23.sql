
-- 쇼핑몰을 구현할 때 어떤 흐름으로 자료가 검색되는지에 대한 구조를 확인할 수 있다.

DROP DATABASE IF EXISTS self_join;
CREATE DATABASE self_join;
USE self_join;

CREATE TABLE employees (
    employee_id   INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department    VARCHAR(20) NOT NULL,
    salary        INT NOT NULL,        -- 연봉, 만원 단위
    manager_id    INT                  -- 상급자의 employee_id. 없으면 NULL
);

INSERT INTO employees VALUES
(1, '김민수', '경영', 9000, NULL),
(2, '박지훈', '개발', 7000, 1),
(3, '이서연', '영업', 6500, 1),
(4, '최준호', '개발', 5000, 2),
(5, '정하윤', '개발', 5500, 2),
(6, '강도현', '영업', 4800, 3);

SELECT * FROM employees;


-- 1. 계층 구조를 join해보자.(셀프 조인 활용)
-- 즉, 각 직원에 상급자 이름을 조회(결과 집합)

select e.*, m.*
from employees e
left join employees m  -- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;

select e.*, m.employee_name as 상급자
from employees e
left join employees m  -- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;

-- 셀프 조인을  inner join으로 변경해보기
-- 김민수가 탈락됨 -> 매칭되지 않을 경우 그 튜플은 검색되지 않음
select e.*, m.employee_name as 상급자
from employees e
inner join employees m  -- 매니저 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;

-- 상급자의 차상급자까지 찾기
select e.*, 
	   m.employee_name as 상급자,
       mm.employee_name as 차상급자
from employees e
left join employees m
on e.manager_id = m.employee_id
left join employees mm
on m.manager_id = mm.employee_id;

-- 용도 2. 같은 테이블 안에서 서로 다른 행을 비교할 수 있다.
-- 매칭되는 것만 검색하겠다. inner join의 inner 생략 가능
-- 1. 같은 부서에서, 나보다 연봉이 높은 사람 
-- 같은 행 안의 내용을 비교할 수 있음
select e.employee_name as 직원,
       e.salary as 내연봉,
       h.employee_name as 더높은사람,
       h.salary as 그사람연봉
from employees e
join employees h
 on e.department = h.department and e.salary < h.salary
 -- 쉼표의 의미: 동일한 우선순위일 때 순차적으로 조건을 설정할 때 활용
 order by e.employee_name, e.salary;
 
 -- on 조건을 두 개 써야하는 이유
 -- 1. 만약 join 연산에서 on 절이 없으면 '크로스 조인'이 된다.
 select * 
 from employees e
 join employees m;
 -- on <-- 사용 안함
 -- 6*6 = 36행
 
 -- count
 select count(*) as row수 
 from employees e
 join employees m;
 
 -- 2. on 조건에서 부서만 있는 경우 확인
 select e.*
from employees e
join employees h
 on e.department = h.department -- 같은 부서만 조합하는 조건
 -- 쉼표의 의미: 동일한 우선순위일 때 순차적으로 조건을 설정할 때 활용
 where e.department = '개발'
 order by e.employee_name, e.salary;
 
 -- 3. on 조건에서 나보다 연봉이 높은 사람 있는 경우 확인
 select e.*
from employees e
join employees h
 on e.salary < h.salary --  부서 상관없이 나보다 연봉이 높은 사람 조합
 -- 쉼표의 의미: 동일한 우선순위일 때 순차적으로 조건을 설정할 때 활용
 where e.employee_name = '강도현'
 order by e.employee_name, e.salary;
 
 -- on과 where에서 어디에 조건으 걸어야 타당한가?
 -- ON      아직 결과를 만드는 중이다.
--         두 테이블에서 어떤 행끼리 이을지 정한다.
--         짝을 못 찾아도 LEFT JOIN 은 NULL 을 채워 행을 만들어낸다.

-- WHERE   결과가 다 만들어진 뒤다.
--         만들어진 행 중에서 조건에 안 맞는 것을 통째로 버린다. 
 
select e.employee_name as 직원,
       e.salary as 내연봉,
       h.employee_name as 더높은사람,
       h.salary as 그사람연봉
from employees e
left join employees h
 on e.department = h.department and e.salary < h.salary
 -- where e.salary < h.salary  - left join을 적용할 경우 null값이 있는 경우 튜플을 출력하지 않음
 -- 쉼표의 의미: 동일한 우선순위일 때 순차적으로 조건을 설정할 때 활용
 order by e.employee_name, e.salary;
 
 -- ## 9. 스스로 해보기

-- ### 문제 1

-- 각 직원의 (이름, 부서, 상급자 이름, 상급자의 부서)를 조회하세요. 상급자가 없는 직원도 결과에 나와야 합니다.
-- 힌트
--   4절 쿼리에 컬럼을 하나 더 추가하면 된다
--   상급자의 부서는 m 쪽에서 가져온다

select *
from employees;

select e.employee_name, e.department, m.employee_name as 상급자,
	   m.department as 상급자의부서
from employees e
left join employees m  -- 상급자 이름을 찾기 위한 사본 테이블
on e.manager_id = m.employee_id;


-- ### 문제 2 (중요!)

-- 각 직원의 이름과 **그 직원의 직속 부하 직원 이름**을 조회하세요. 부하 직원이 없는 직원도 결과에 나와야 합니다.
-- 힌트
--   4절 쿼리와 조인 조건의 방향이 반대다
--   4절은 "내 상급자가 누구인가", 이번에는 "나를 상급자로 지목한 사람이 누구인가"
--   부하가 없어도 나와야 하므로 LEFT JOIN

select m.employee_name, e.employee_name as 부하직원
from employees m
left join employees e  -- 상급자 이름을 찾기 위한 사본 테이블
on m.employee_id = e.manager_id;
 
 
 

 
 
 
 
 









 