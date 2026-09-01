-- 데이터 베이스 생성(이름)
CREATE DATABASE db_henya_market;
-- 사용 명령어
USE db_henya_market;
-- 테이블 생성, 컬럼 수정, 데이터 조회, 삽입 실습하기
-- 1. 테이블 설계하기
CREATE TABLE userTBL (
userName VARCHAR(20) NOT NULL PRIMARY KEY,
birthYear INT NOT NULL,
addr CHAR(2) NOT NULL,
mobile VARCHAR(13)
);

SHOW TABLES;
DESC userTBL;
SELECT * FROM userTBL;

-- 2. 컬럼 수정 
ALTER TABLE userTBL MODIFY COLUMN mobile VARCHAR(16);

-- 3. 고객 테이블에 데이터 삽입(등록, 저장)
INSERT INTO userTBL VALUES ('김핸야', 1996, '통영', '82+010-1234-1234')
