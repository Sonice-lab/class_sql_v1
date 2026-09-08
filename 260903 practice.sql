-- 1. employees 데이터 베이스에서 dept_manager 테이블와 titles 테이블 inner join를 구하세요.


-- 2. 직원 번호가 10100 이하이고, 입사일이 '1985-10-14'이며, 현재 퇴사하지 않은(재직 중인) 직원의 정보와 해당 직원의 부서 정보를 함께 조회하는 쿼리를 작성하세요.

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

-- 4. [inner join] employees db와 inner join을 활용하여 아래의 결과가 출력되도록 해주세요.🪴
-- 요청사항)
--   
-- from_date가 '1985-02-03' 또는 '1985-02-05'인 사원의 emp_no와 dept_no 조회


-- [outer join] employees db와 outer join을 활용하여 아래의 결과가 출력되도록 해주세요.🪴

-- 요청사항)
--   
-- departments 정보와 LEFT JOIN 을 사용하여 from_date가 '1985-02-03' 또는 '1985-02-05'인 사원의 정보를 조회해주세요.

--     조건 1. 사원의 정보는 dept_no, dept_name, emp_no, from_date, to_date가 줄력되어야 합니다.
--     조건 2. 중복된 컬럼없이 출력하세요.

-- 5. 여러 테이블을 연결할 때 LEFT JOIN과 RIGHT JOIN을 섞어 쓰면, 어느 테이블의 데이터가 모두 남는지 계속 방향을 바꿔 가며 생각해야 합니다. 가독성과 유지 보수를 위해 RIGHT JOIN 사용을 제한하는 규칙을 실무에서 적용하기도 합니다.

-- 이 SQL을 다음 조건에 맞게 다시 작성하세요. 

-- 조회 결과는 원래 SQL과 같아야 합니다.
-- RIGHT JOIN은 하나도 사용하지 마세요.
-- 모든 테이블을 LEFT JOIN으로 연결하세요.

-- 데이터베이스: employees

-- SELECT
--       e.emp_no          -- 직원 번호
--     , e.first_name      -- 직원 이름
--     , e.last_name       -- 직원 성
--     , de.dept_no        -- 부서 번호
--     , d.dept_name       -- 부서명
--     , de.from_date      -- 부서 시작일
-- FROM
--     departments d       -- 부서 테이블
-- RIGHT JOIN
--     dept_emp de         -- 직원과 부서 중간 테이블
--         ON d.dept_no = de.dept_no
-- RIGHT JOIN
--     employees e         -- 직원 테이블
--         ON de.emp_no = e.emp_no
-- WHERE
--     e.emp_no BETWEEN 10001 AND 10100;


-- 6. 
-- inner join을 사용해서 employees와 salaries 테이블을 결합하고 salary가 70000 이상인 직원의 emp_no, first_name, last_name, salary를 조회하세요.

-- left outer join을 사용해서 모든 직원의 emp_no, first_name, last_name, salary를 조회하세요.
-- (employees 테이블을 왼쪽 테이블로 사용하고, emp_no를 기준으로 salaries와 연결하세요.)

-- 1.
-- employees 와 salaries을 이용하여 outer 조인 후
-- emp_no와 salary의 sum()값을 구하시오

-- select sum(합계 할 값)
-- on절 밑에 group by를 이용하면 구할 수 있습니다
-- 예) group by 합계의 기준이 될 조건

-- 7. [INNER JOIN 문제]
-- employees DB에 있는 departments 테이블과 dept_manager 테이블을 이용해서 
-- dept_no가 d006인 dept_no, dept_name, from_date, to_date를 조회하세요.

-- [LEFT JOIN 문제]
-- employees DB의 dept_emp 테이블과 dept_manager 테이블에서 dept_no를 기준으로 dept_emp의 from_date가 1985년이고 
-- dept_manager의 from_date가 1991년인 데이터의 e.dept_no, e.from_date, m.from_date를 조회하세요.
-- (e는 dept_emp의 별칭, m은 dept_manager의 별칭입니다.)

-- 8. [OUTER JOIN 문제]
-- employees(DB) 기준
-- employees(직원테이블) 왼쪽기준 , deptemp(부서사원테이블)오른쪽 기준일떄 on 조건절은 직원 번호로 조인할경우 (where절 없을떄) 정답인것은?
-- INNER JOIN 행의 수가 많이 나온다
-- LEFT JOIN 행의 수가 많이 나온다
-- RIGHT JOIN 행의 수가 많이 나온다
-- 차이가 없다

-- 9. INNER JOIN 문제
-- departments와 dept_manager를 inner join을 사용해서 dept_name과 emp_no를 조회하세요.

--  OUTER JOIN 문제
--  employees와 dept_emp를 left join을 사용해서 last_name이 'Aamodt'인 직원들의 dept_no 를 조회하세요.

-- 10. .INNER JOIN
-- employee_copy3의 emp_no , hire_date 와 dept_manager의 from_date를 조회하세요.
--  (조건 - hire_date가 1990년 이후인 직원 추출.  ON절에 어떤 조건으로 결합시킬지 직접 테이블을 조회해서 확인.)


-- OUTER JOIN
-- dept_manager의 dept_no , emp_no와 employee_copy3의 first_name , last_nam 조회하세요.
-- (조건 - dept_manager를 기준으로 left join , 
-- dept_manager와 employee_copy3를 어떤 조건으로 결합시킬지 테이블을 조회해서 확인.) 

-- 11. employees, dept_manager, departments 테이블을 
-- inner join으로 emp_no, hire_date, gender, dept_name, dept_no, from_date 조회해주세요
-- 2.employess, dept_manager,  dept_emp, departments 테이블을 left join해서 
-- dept_emp의 form_date가 1990-01-01 이전이고  dept_manager의 from_date가 1990-01-01 이후인 직원의 emp_no, first_name, last_name, gender 조회해주세요

-- 12. 쇼핑몰 주문 테이블 수정 및 조회
-- 다음은 쇼핑몰의 회원, 상품, 주문 정보를 저장하기 위한 테이블이다.

-- CREATE TABLE members (
  --   member_id INT PRIMARY KEY,
--     member_name VARCHAR(20) NOT NULL
-- );

-- CREATE TABLE products (
--     product_id INT PRIMARY KEY,
--     product_name VARCHAR(100) NOT NULL,
--     price INT NOT NULL
-- );

-- CREATE TABLE orders (
--     order_id INT PRIMARY KEY,
--     member_id INT,
--     product_id INT,
--     quantity INT,
--     order_status VARCHAR(5),
--     order_date DATETIME
-- );

-- 1차 — ALTER TABLE
-- 현재 orders 테이블에는 주문 데이터의 무결성을 유지하기 위한 조건이 부족하다.

-- 다음 조건을 만족하도록 테이블을 새로 생성하지 않고 ALTER TABLE을 사용하여 orders 테이블을 수정하세요.

-- member_id, product_id, quantity는 반드시 값을 입력해야 한다.
-- order_status는 최대 20자까지 저장할 수 있도록 변경한다.
-- order_status를 입력하지 않으면 기본값으로 *'ORDERED'가 저장되어야 한다.
-- member_id는 members 테이블의 member_id를 참조하는 외래키로 설정한다.
-- product_id는 products 테이블의 product_id를 참조하는 외래키로 설정한다.

-- 수정 후 다음 데이터를 저장
-- INSERT INTO members
-- VALUES
--     (1, '김철수'),
--     (2, '이영희'),
--     (3, '박민수');

-- INSERT INTO products
-- VALUES
--     (101, '키보드', 50000),
--     (102, '마우스', 30000),
--     (103, '모니터', 250000),
--     (104, '노트북', 1200000);

-- INSERT INTO orders VALUES
--     (1001, 1, 101, 2, 'DELIVERING', NOW()),
--     (1003, 1, 103, 1, 'ORDERED', NOW()),
--     (1004, 3, 102, 3, 'ORDERED', NOW());

-- 2차 — INNER JOIN
-- 저장된 데이터를 이용하여 실제로 주문이 발생한 주문 내역을 조회하세요.

-- orders, members, products 세 테이블을 INNER JOIN으로 연결하고 다음 정보를 출력하세요.

-- 주문 번호
-- 회원 이름
-- 상품 이름
-- 상품 가격
-- 주문 수량
-- 주문 상태
-- 주문 날짜

-- 13. 
-- employees 테이블과 dept_emp 테이블을 emp_no를 기준으로 INNER JOIN 사용하여 사원의 모든 정보를 조회하세요

-- dept_manager 테이블과 departments 테이블을 dept_no를 기준으로 LEFT JOIN사용하여 dept_no, from_date, dept_name을 조회하세요







