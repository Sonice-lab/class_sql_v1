-- 1. [DB 및 사용자 생성]

--   가. 새로운 데이터베이스(스키마) 생성
create database shop_db default character set utf8mb4 collate utf8mb4_general_ci;

--   나. shop_db를 관리할 전담 사용자 계정 생성(비밀번호는 임의로 'Admin123!'으로 설정)
create user 'shop_admin'@'localhost' identified by 'Admin123!';

--   다. 생성된 사용자에게 shop_db의 모든 권한 부여 및 적용
grant all privileges on shop_db.* to 'shop_admin'@'localhost';

--   라. 방금 부여한 권한 정보가 데이터베이스 시스템에 즉시 반영되도록 확정 짓기
flush privileges;

-- -------------------------------------------
-- 2. [테이블 및 제약 조건 생성]

--   가. 생성한 데이터베이스 사용
use shop_db;

--   나. 회원(Member) 테이블 생성
--     1) 기본키 설정
--     2) 이름(필수값)
-- 	   3) 이메일(고유값)
-- 	   4) 가입일
create table member (
		member_id varchar(50) primary key,
		name varchar(100) not null,
        email varchar(200) unique not null,
        join_date datetime default current_timestamp
);

--   다. 상품(Product) 테이블 생성
--     1) 기본키 설정 (자동 증가)
--     2) 상품명 (필수값)
--     3) 가격 (필수값)
--     4) 재고량
--     5) 가격이 0 이상 이어야 한다는 제약 조건
create table product (
	product_id int auto_increment primary key,
    product_name varchar(200) not null,
    price int not null,
    stock int default 0,
    constraint chk_product_price check (price >= 0)
);

-- ---------------------------------------
-- 3. [인덱스 생성] 검색 성능 향상
-- 회원 테이블의 '이름(name)' 컬럼에 대한 인덱스 생성
create index idx_member_name on member(name);




 