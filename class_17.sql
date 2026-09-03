-- 앞 차시에서 만든 shop 이 남아있으면 지우고 시작
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

-- 회원 테이블 생성 (PRIMARY KEY, UNIQUE KEY 사용)
CREATE TABLE member (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(100) UNIQUE,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20),
  join_date DATE NOT NULL
);

-- 상품 테이블 생성 (PRIMARY KEY 사용)
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  stock INT NOT NULL
);

-- 주문 테이블 생성 (FOREIGN KEY 사용)
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  member_id INT,
  product_id INT,
  quantity INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (member_id) REFERENCES member(id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- 회원 데이터 삽입
INSERT INTO member (email, name, phone, join_date) VALUES
('hong@test.com', '홍길동', '010-1234-5678', '2023-01-15'),
('kim@test.com', '김영희', '010-2345-6789', '2023-02-20'),
('lee@test.com', '이철수', '010-3456-7890', '2023-03-10');

-- 상품 데이터 삽입
INSERT INTO product (product_id, name, price, stock) VALUES
(1, '노트북', 1500000, 50),
(2, '스마트폰', 800000, 100),
(3, '헤드폰', 200000, 200);

-- 주문 데이터 삽입
INSERT INTO orders (member_id, product_id, quantity, order_date) VALUES
(1, 1, 1, '2023-03-25'),
(2, 2, 2, '2023-04-02'),
(3, 3, 3, '2023-04-03');

-- WHERE 절 없는 UPDATE 나 DELETE 를 실행할 때 ERROR 1175 가 나오면 아래를 먼저 실행하세요.
-- SET SQL_SAFE_UPDATES = 0;

-- ## user 테이블 설계

-- 다음 조건을 만족하는 user 테이블을 생성하세요.

-- - id: 기본 키, 자동 증가
-- - username: 고유해야 함
-- - email: 고유해야 함
-- - password: 필수 입력
-- - created_at: 현재 시간 기본값 설정

-- user 테이블 생성
CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(100) UNIQUE,
  email VARCHAR(50) UNIQUE,
  password VARCHAR(20) NOT NULL,
  created_at datetime default current_timestamp
);

show tables;
select * 
from user;

-- 정상 데이터
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong@test.com', 'pass123');

-- 중복된 username
INSERT INTO user (username, email, password)
VALUES ('gildong', 'gildong2@test.com', 'pass234');
-- ERROR 1062 (23000): Duplicate entry 'gildong' for key 'username'

-- 중복된 email
INSERT INTO user (username, email, password)
VALUES ('hong', 'gildong@test.com', 'pass345');
-- ERROR 1062 (23000): Duplicate entry 'gildong@test.com' for key 'email'

-- ### 2.1. DDL 연습 (테이블 생성 및 수정)

-- 1. **새로운 테이블 category 생성**
--     - 컬럼: category_id (기본 키), name (필수)

-- category 생성
CREATE TABLE category (
  category_id INT PRIMARY KEY,
  name varchar(50) not null
);

select *
from category;

-- product 테이블에 category_id 컬럼 추가 및 외래 키 설정
-- 1. 검색
select *
from product;

-- 2. 칼럼 추가
alter table product
add category_id int;

-- 3. 외래키 설정
alter table product
add constraint fk_category
foreign key(category_id) references  category(category_id)
on delete cascade on update cascade;

-- **orders 테이블에 인덱스 추가**
-- - order_date 컬럼에 idx_order_date 인덱스 생성
select *
from orders;

alter table orders
add index idx_order_date (order_date);

-- 인덱스 확인 명령어
show index from orders;

-- 2.2. DML 연습 (데이터 조작)

-- INSERT 연습

-- 1. category 테이블에 데이터 삽입
--  - category_id=1, name='전자제품', category_id=2, name='가전제품'

insert into category (category_id, name)
values(1, '전자제품'),
	  (2, '가전제품');
      
select *
from category;    

-- 2. **product 테이블의 category_id 업데이트**
--     - 모든 상품의 category_id를 1로 설정  
select * 
from product;

update product
set category_id = 1
where category_id is null;

-- 3. 새로운 회원 추가
--  - email='park@test.com', name='박민지', phone='010-4567-8901', join_date='2023-04-05'

select *
from member;

insert into member (id, email, name, phone, join_date)
values (4, 'park@test.com','박민지', '010-4567-8901','2023-04-05');

-- ### SELECT 연습

-- 1. **2023년 3월 이후 가입한 회원 조회**
select *
from member
where join_date > '2023-03-31';

-- 가격이 500,000원 이상인 상품 조회

select *
from product;

select *
from product
where price >= 500000;

-- ### UPDATE 연습
-- 1. 이철수의 전화번호를 '010-9999-0000'으로 변경
select *
from member
where name = '이철수';

update member
set phone = '010-9999-0000'
where name = '이철수';

-- 재고가 100개 미만인 상품의 가격을 10% 인상 

select *
from product
where stock < 100;

update product
set price = price*1.1
where stock < 100;

-- ### DELETE 연습
select *
from orders;

-- 1. 2023년 4월 1일 이전 주문 삭제
delete from orders
where order_date < '2023-04-01';

-- 2. 재고가 0인(product_id=1) 상품 삭제
select *
from product;

delete from product
where product_id = 1;

-- 외래키 삭제
alter table orders
drop FOREIGN KEY orders_ibfk_2;

### 2.3. 키 제약 조건 및 인덱스 연습
-- 1. **중복 이메일 삽입 시도**-- 
select *
from member;

insert into member (id, email, name, phone, join_date)
values (5, 'park@test.com','박초롱', '010-4444-6666','2023-04-06');

-- 존재하지 않는 회원의 주문 추가 시도 
select *
from orders;

insert into orders (order_id, member_id, product_id, quantity, order_date)
values(7, 7, 2, 3, '2023-04-08');

-- orders 테이블에서 member_id와 order_date로 복합 인덱스 생성 
select *
from orders;

create index idx_member_id_order_date on orders (member_id, order_date);

-- 4. 인덱스 활용 확인
explain select * from orders
where member_id = 1 and order_date = '2023-04-01';

-- 1. key 컬럼에 어떤 인덱스가 표시되는지 확인하세요. -> idx_order_date














