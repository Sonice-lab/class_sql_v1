-- 실습 준비

-- insert_practice DB가 이미 있으면 통째로 삭제한다.
-- IF EXISTS "있으면" 이라는 조건이다.
-- 만약 insert_practice DB가 없다면 여기서 바로 스크립트가 오류가 나서 멈춤 
DROP DATABASE IF EXISTS insert_practice;

-- 데이터베이스 생성
CREATE DATABASE insert_practice;

-- 앞으로 모든 명령을 insert_practice 데이터베이스 대상으로 한다.
USE insert_practice;

-- student 테이블 생성
CREATE TABLE student(
-- PRIMARY KEY 유일성 보장
	student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL DEFAULT '미정'
);

-- 1. 한 건씩 넣기
INSERT INTO student (student_id, name, grade, major)
VALUE (1, '홍길동', 3, '컴퓨터공학과');

INSERT INTO student (student_id, name, grade, major)
VALUE (2, '김철수', 3, '전자공학과');

INSERT INTO student (student_id, name, grade, major)
VALUE (3, '이영희', 2, '경영학과');



-- 조회하기
SELECT * FROM student;

-- 2. 여러 건 한 번에 넣기

INSERT INTO student (student_id, name, grade, major)
VALUES (4, '박민준', 1, '전자공학과'), 
	  (5, '최지아', 2, '컴퓨터공학과'),
	  (6, '한수연', 3, '경영학과');
      

-- 3. 제약조건 확인: Primary Key
-- 중요! 여러 건을 한 번에 넣을 경우 그 중 하나만 중복이어도 블록 전체가 들어가지 않음
INSERT INTO student (student_id, name, grade, major)
VALUES (1, '티모', 3, '경영학과');

INSERT INTO student (student_id, name, grade, major)
VALUES (7, '야스오', 3, '경영학과'),
       (1, '티모', 3, '경영학과'),
       (8, '애쉬', 3, '경영학과');
       
-- 조회하기
SELECT * FROM student;

-- 4. 제약조건 2: NOT NULL
INSERT INTO student (student_id, name, grade)
VALUES(9, NULL, 1); 

INSERT INTO student (student_id, name, grade)
VALUES(9, 1); 

-- 5. 제약조건 3: DEFAULT
-- 방법 1: (디폴트 값을 넣는 방법)
INSERT INTO student (student_id, name, grade, major)
VALUES (10, '이순신', 1, DEFAULT),
	   (11, '유관순', 3, '전자공학과');
       
-- 방법 2: (디폴트 값을 넣는 방법)
INSERT INTO student (student_id, name, grade)
VALUES (12, '김길동', 1),
	   (13, '박길동', 3);
       
-- DATE 타입에 값 넣기
-- ORDER BY에서 사용하는 예약어를 이름으로 사용하려면 백틱(`)으로 감싸야 한다. 
-- 다만, 예약어를 사용하지 말고 orders라고 하는 것이 좋다.
CREATE TABLE `order` (
	id INT PRIMARY KEY,
    customer_note VARCHAR(50), 
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);       

SELECT * FROM `order`;

-- 날짜를 넣는 두가지 방식

-- 방법 1: 따옴표로 감싸서 문자열로 작성
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(1, '빠른 배송', '신라면', 2, '2026-09-01');

-- 방법 2: 하이픈 없는 숫자로 넣을 수 있음
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(2, '문앞 배송', '신라면', 3, 20260901);

-- 잘못된 날짜는 걸러짐
-- 1년은 12개월인데 만약 22월을 넣으면 어떻게 되는지 확인해보자.
INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(3, '테스트', '신라면', 3, 20262201);

INSERT INTO `order` (id, customer_note, product_name, quantity, order_date)
VALUES(3, '테스트', '신라면', 3, '20262201');

-- AUTO_INCREMENT
-- 새 행을 넣을때마다 자동으로 하나씩 올려주는 기능이다.
-- 주로 PRIMARYT KEY에 많이 사용한다.

CREATE TABLE customer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);

SELECT * FROM customer;
-- id 컬럼을 적지 않아도 문제 없음!
INSERT INTO customer(name, email, address)
VALUES ('김철수', 'a@naver.com', '부산시 진구'),
	   ('박영희', 'b@naver.com', '부산시 동구'),
	   ('김철수', 'a@naver.com', '부산시 진구');
       
-- AUTO_CREMENT에 알아주면 좋은 두가지
-- 직접 값으로 지정하면 그 다음 번호가 이어짐
INSERT INTO customer(id, name, email, address)
VALUES (13, '홍아랑', 'a@naver.com', '부산시 진구');

INSERT INTO customer(name, email, address)
VALUES ('김아랑', 'a@naver.com', '부산시 진구');

-- 이 이아랑은 15번이 된다.
INSERT INTO customer(name, email, address)
VALUES ('이아랑', 'a@naver.com', '부산시 진구');

-- 삭제해도 번호는 돌아오지 않는다.
DELETE FROM customer WHERE id = 14;

-- 아래 요구사항에 맞는 CREATE TABLE 작성하기
-- 데이터베이스 생성
CREATE DATABASE post;

-- 앞으로 모든 명령을 post 데이터베이스 대상으로 한다.
USE post;

-- post 테이블 생성
CREATE TABLE post(
-- PRIMARY KEY 유일성 보장, 자동으로 증가 어떻게 하는 걸까?
	id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
-- 내용 길이 예측 불가?
    content TEXT,
	writer VARCHAR(20) NOT NULL,
    view_count INT NOT NULL DEFAULT 0,
    email VARCHAR(20),  
    create_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- INSERT INTO post (id, title, content, writer,view_count, create_at)
-- VALUES(1, 't', 'cc', 'ww', 10, DEFAULT), ();

ALTER TABLE customer ADD CONSTRAINT uq_customer_email UNIQUE (email);

SELECT * FROM post;

 
