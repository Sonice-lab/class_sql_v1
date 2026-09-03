-- 복사할 테이블 선택
use employees;

-- 테이블 복사 방법 (테이블 + 데이터까지)

-- 1. 테이블과 데이터만 복사
CREATE TABLE employees_copy AS SELECT * FROM employees;
select * from employees_copy;
-- 데이터는 그대로 들어옵니다. 하지만 제약 조건과 인덱스는 따라오지 않습니다.

-- 2. 구조만 복사: 위와 반대(제약 조건과 인덱스를 그대로 가져오지만 데이터는 0 건)
CREATE TABLE employees_copy2 LIKE employees;

-- 3. 구조 + 데이터 완전 복사(실무에서 사용하는 방법)
CREATE TABLE employees_copy3 LIKE employees;
INSERT INTO employees_copy3 SELECT * FROM employees;
select * from employees_copy3;