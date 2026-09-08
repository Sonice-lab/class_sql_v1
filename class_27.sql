-- delimiter(구분자): "여기까지가 한 문장"이라는 표시를 바꾸는 명령
-- MySQL에서는 세미콜론을 만나면 문장이 끝난 줄 알고 자동 실행해버림.
-- 그러나 프로시저 구문 안에도 세미 콜론이 여러개 나올 수 있기 때문에 다 읽기 전에 구문을 실행해버림
-- 그래서 잠시 구분자를 ; 세미콜론에서 --> // 로 바꿔두는 작업

delimiter //

create procedure 송금하기() -- 아무 이름이나 상관없음. 심지어 송금하기()
begin
	start transaction;
    update accounts set balance = balance - 20000
    where account_id = 1 and balance <= 20000;
    
    if row_count() = 0 then 
    rollback; 
    select '잔액부족' as 결과;
    else 
		update accounts set balance = balance + 20000 
        where account_id = 2;
        commit;
        select '송금완료' as 결과;
    end if;
end //

-- 여기까지가 프로시저의 끝

delimiter ;

-- 다시 구분자를 ;(세미콜론)으로 변경

-- 프로시저를 만들었으면, 프로시저를 호출하여 사용하기
call 송금하기();

select * from accounts;

