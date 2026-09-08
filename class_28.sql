-- 직접　트랜잭션　구문을　사용하고 commit, rollback 확인해보기
-- 프로시저를 활용하지 않아도 됨

DROP DATABASE IF EXISTS bank;
CREATE DATABASE bank;
USE bank;

show tables;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT NOT NULL
);

INSERT INTO accounts VALUES
    (1, 'Alice', 100000),
    (2, 'Bob', 50000);

SELECT * FROM accounts;

-- 1. 성공 케이스(commit)
-- 시나리오 1. alice가 bob 에게 50,000원 송금
start transaction;

update accounts 
set balance = balance - 50000 
where account_id = 1;

update accounts 
set balance = balance + 50000 
where account_id = 2;

commit;

-- 2. 취소 케이스(rollback)
-- 시나리오 2. 송금했다가 취소하기.
start transaction;

update accounts
set balance = balance - 10000 
where account_id = 1;

-- commit하지 않은 상태에서 조회
-- 10만원에서 9만원으로 이미 바뀐 것 처럼 조회됨
select '롤백 전' as 시점, account_id, balance 
from accounts
where account_id = 1;

rollback;

-- 원래대로 복귀되어 9만원에서 10만원으로 보임
select '롤백 후' as 시점, account_id, balance
from accounts
where account_id = 1;

-- 3. 오류가 나도 자동으로 취소되지 않는다.
-- 시나리오 3. 송금 도중 두번째 UPDATE 에서 오류 발생

START TRANSACTION;

UPDATE accounts SET balance = balance - 30000 WHERE account_id = 1;
-- 오류 발생! id 2의 balance가 not null이기 때문!
-- Error Code: 1048. Column 'balance' cannot be null
UPDATE accounts SET balance = NULL WHERE account_id = 2;

-- 예제 4. commit 후에는 되돌릴 수 없음

start transaction;
update accounts
set balance = balance - 30000
where account_id = 1;

-- 이미 commit한 상황
commit;

-- commit 이후이므로 아무 효과가 없음(되돌아가지 않음)
rollback;

select * from accounts;

-- 5. 잔액 부족일 때 막는 방법
-- 시나리오 5. Alice가 Bob에게 20만원 송금(잔액 부족)
start transaction;

update accounts
set balance = balance - 200000
where account_id = 1 and balance >= 200000;

select row_count() as 변경된행수; -- 결과값은 0이다.

-- 지금 단계에서는 row수를 확인하고 직접 rollback; 이나 commit;을 결정해서 입력하기

-- 변경된 행수가 0인 것이 의미라는 것 -> 송금 실패 -> rollback 진행
rollback;

select * from accounts;

-- 6. 프로시저 작성해보기





 









