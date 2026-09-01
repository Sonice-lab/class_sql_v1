
-- 데이터 집합 생성(db 생성)
CREATE DATABASE db_tenco_market;
-- 어떤 데이터베이스를 사용할 지 선택
USE db_tenco_market;

-- 데이터 집합 삭제
-- DROP DATABASE db_tenco_market;

-- 대소문자 주의!
-- 키워드 (SELECT, CREATE 등) 컬럼명은 대소문자를 구분하지 않는다.
-- 다만 주의! -> 데이터베이스명과 테이블명은 운영체제에 따라 다를 수 있다.
-- 즉, 대소문자를 구분할 수도 있음
-- windows(대소문자를 구별하지 않음)
-- linux(대소문자를 구별함)
-- 그렇기에 생성 시 작성한 이름 그래도 작성하는 습관을 들여야 한다.

-- 도전과제! 다른 이름으로 DB 생성 및 삭제해보기
-- CREATE DATABASE getting_job;
-- USE getting_job;
-- DROP DATABASE getting_job;

-- 실습 코드 1(테이블 설계하기)
CREATE TABLE userTBL(
	userName VARCHAR(10) NOT NULL PRIMARY KEY, 
    birthYear INT NOT NULL, 
    addr CHAR(2) NOT NULL,
    mobile VARCHAR(12)
);



CREATE TABLE buyTBL (
	userName VARCHAR(10) NOT NULL,
    prodName VARCHAR(10) NOT NULL,
    price INT NOT NULL, 
    amount INT NOT NULL,
    FOREIGN KEY (userName) REFERENCES userTBL(userName)
);

SHOW TABLES;
DESC userTBL;
DESC buyTBL;

-- ----------------------------------
-- 테이블 정보 조회
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

-- 고객테이블에 데이터 삽입(등록, 저장)
INSERT INTO userTBL VALUES ('김철수', 1995,'서울', '010-1234-1234' );

-- 컬럼에 대한 제약사항을 수정해보자.
ALTER TABLE userTBL MODIFY COLUMN mobile VARCHAR(13); 

-- 수정 수 다시 도전! 고객테이블에 데이터 삽입(등록, 저장)
INSERT INTO userTBL VALUES ('김철수', 1995,'서울', '010-1234-1234' );

-- 다시 테이블 조회
SELECT * FROM userTBL;

-- 추가 고객 등록하기(컬럼명을 직접 명시하여 삽입해보기)
INSERT INTO userTBL (userName, birthYear, addr) VALUES('이영희', 1998,'부산' ); 

-- 중복된 이름 저장해보기 (현재 userName PK 임) alter --> 오류
INSERT INTO userTBL (userName, birthYear, addr) VALUES('이영희', 1998,'부산' ); 

-- 구매 테이블 조회
SELECT * FROM buyTBL;
SELECT userName, prodName FROM buyTBL;  -- 2개만 조회하고 싶을 때

-- 구매 테이블 데이터 삽입
INSERT INTO buyTBL VALUES ('김철수', '운동화', 30000, 1);

-- 고객 테이블과 구매테이블은 현재 (FK)foreign key로 제약 설정이 되어있다. (userName) <-- 구매테이블 컬럼 이름
INSERT INTO buyTBL VALUES ('홍길동', '컴퓨터', 1300000, 1); 
-- 저장 안됨, 사유: 외래키 제약으로 존재하지 않는 userName이기 때문, 의미없는 데이터
-- 즉, 고객 테이블에 없는 사람은 구매 기록을 남길 수 없다.(사유: 현재 foreign key로 제약이 걸려있기 때문!)

INSERT INTO buyTBL (userName, prodName, price, amount)
VALUES ('이영희', '컴퓨터', 1500000, 1);







