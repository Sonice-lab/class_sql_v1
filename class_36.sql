
select distinct department 
from tb_employees
order by department asc;

-- 컬럼이 여러개일 경우 조합 기준이 됨
-- 즉 두 컬럼은 한 개로 간주
select distinct department, salary 
from tb_employees
order by department asc;

-- 
select *
from tb_employees
-- 1번을 제외하고 3개까지 출력
limit 3 offset 1;

-- row 15개
-- 한페이지에 5개를 출력한다면 위
select *
from tb_employees
limit 5 offset 0;

-- 2페이지
select *
from tb_employees
limit 5 offset 5;

-- 3페이지
select *
from tb_employees
limit 5 offset 10;

-- 총 15개의 row 중 5개씩 한 화면에 출력한다면 페이지 블록 3개가 나온다.
-- 이 것을 페이징 처리라고 한다.

-- 총 15개의 row 중 4개씩 한 화면에 출력한다면 페이지 블록 4개가 나온다.
-- [1][2][3][4]
--  4  4  4  3

-- 총 21개에서 한 페이지에 4개씩 보여진다면?
-- [1][2][3][4][5][6]
--  4  4  4  4  4  1 





