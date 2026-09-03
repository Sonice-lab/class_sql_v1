-- 앞 차시에서 만든 테이블이 남아있으면 지우고 시작
-- orders 가 member 를 참조하므로 자식 테이블을 먼저 지웁니다
use type_practice;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS member;

create table member (
id bigint primary key auto_increment,
email varchar(100) unique,
name varchar(50) not null,
phone varchar(20)
);

INSERT INTO member (email, name, phone) VALUES
(null, '홍길동', '010-1234-5678'),
('hong@test.com', '홍길동', '010-1234-5678'),
('kim@test.com', '김영희', '010-2345-6789'),
('lee@test.com', '이철수', '010-3456-7890');

INSERT INTO member (email, name, phone) VALUES
(null, '홍길동2', '010-1234-5678');

-- null값은 중복해서 들어갈 수 있음
select *
from member;

-- -------------------------------

-- 주문 테이블 만들기
create table orders(
-- 숫자가 21억이 넘어갈 수 있기 때문에 bigint 사용 
	id bigint primary key auto_increment,
    member_id bigint,
    order_date date,
    amount int,
    foreign key(member_id) references member(id)
);

-- 외래키를 설정했다면 제약 사항이 발생한다.(무결성, 일관성)
select * from orders;

-- 아래 구문은 외래키 제약 사항 위반(6번 회원은 member 테이블에 없음) 
insert into orders(member_id, order_date, amount)
values (6, '2026-09-01', 1);

insert into orders(member_id, order_date, amount)
values (1, '2026-09-01', 1);

-- 현재 orders 테이블에 member 1인 사람에 데이터가 저장되어 있는 상태
-- 삭제 실패! orders 테이블에 1 유저의 정보가 남아있다. 
-- 삭제를 하게될 경우 orders 테이블은 쓰레기 데이터가 되어버린다.
-- 삭제를 하려면 관련된 데이터를 모두 지우고 멤버 테이블에 1번을 삭제할 수있다.
-- 외래키가 참조되어있는 orders의 것을 먼저 지우고 기본 테이블 member 삭제를 순차적으로 진행해야 한다.

delete from orders
where member_id = 1;

delete from member
where id =1;

select * from member;
