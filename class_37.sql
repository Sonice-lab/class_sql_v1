-- MySQL Workbench 에서 실행

DROP DATABASE IF EXISTS shop2;
CREATE DATABASE shop2;
CREATE DATABASE IF NOT EXISTS shop2;
USE shop2;

CREATE TABLE IF NOT EXISTS product (
    id    INT          PRIMARY KEY AUTO_INCREMENT,
    name  VARCHAR(100) NOT NULL,
    price INT          NOT NULL,
    stock INT          DEFAULT 0
);

INSERT INTO product (name, price, stock) VALUES
('삼성 갤럭시 S24', 1200000, 50),
('자바 완전정복',     35000, 80),
('요가 매트',         45000, 150);

select * from product;


-- 재고가 60개 이상인 제품만 출력하세요.
-- 단, stock의 경우 컬럼명을 '재고수'로 출력해내주세요.:) 
select name, stock as '재고수' from product where stock >= 60;

-- SQL Injection 공격의 예시
select * from product where price >= 50000 or 1=1;

-- 회원 테이블(가입한 사용자들의 전체 개인 정보가 들어있음)
-- 내 정보 --> id, NAME or 1=1; (예시)

delete from product where name = "애플 에어팟 프로";

select * from product;



