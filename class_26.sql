DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
USE bank;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT NOT NULL
);

INSERT INTO accounts VALUES
    (1, 'Alice', 100000),
    (2, 'Bob', 50000);

SELECT * FROM accounts;

-- 실습 예제 1.

-- 수동으로 트랜잭션 시작
start transaction;

update accounts set balance = balance - 30000 where account_id = 1;
-- update accounts set balance = balance + 30000 where account_id = 2;
update accounts set balance = null where account_id = 2;

-- 성공할 경우: commit;
-- 실패할 경우: rollback;

-- 마치 변경된 것처럼 보이는 시점
select '롤백 전' as 시점, account_id, balance from accounts where account_id = 1;
-- 오류가 발생하더라도 자동 취소를 되지 않음. 직접 rollback 처리를 해야 함.
rollback;
select '롤백 후' as 시점, account_id, balance from accounts where account_id = 1;

-- 잔액 부족 시 처리 방법
start transaction;

update accounts
set balance = balance - 200000
-- 복합 조건 걸기
where account_id = 1 and balance >= 200000;

-- 적용된 row count 확인하는 명령어
select row_count() as 변경된행수;

-- 이 시점에서 commit을 하더라도 어차피 반영된 것이 없기 때문에 문제는 없음!
select *
from accounts; 





