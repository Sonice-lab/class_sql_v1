use library;
create table admins(
id int primary key auto_increment,  -- index key 1
admin_id varchar(50) not null unique, -- index key 2
password varchar(255) not null,
name varchar(100) not null

);

-- 실무에서는 비밀번호를 전대 그대로 넣지 않음(암호화 처리를 반드시 해야 함)
insert into admins (admin_id, password, name)
values ('admin_1', 'admin123', '박지훈'),
	   ('admin_2', 'asd123', '이서연');
       
select * from admins;

-- 관리자 ID로 관리자 1명 조회
select id, admin_id, password, name 
from admins
where password = 'asd123';

-- 계정 존재의 유무로 조회
select id, admin_id, password, name 
from admins
where admin_id = 'admin_2';
       
       
