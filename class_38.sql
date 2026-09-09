drop database library;
create database library;
use library;

-- 학생 테이블
create table students(
	id int auto_increment primary key,
    name varchar(100) not null,
    student_id varchar(20) not null unique    
    );
    
desc students;

-- isbn : 도서에 대한 PK
-- 도서테이블
create table books (
	id int auto_increment primary key,
    title varchar(255) not null,
    author varchar(255) not null,
    publisher varchar(255) not null,
    publication_year int, 
    isbn varchar(13),
    available boolean default true
);

-- 대출 테이블
-- 언제 빌렸는가?
-- 언제 반납했는가?
-- 몇 권을 빌렸는가?
-- 1:N의 관계
create table borrows (
	id int auto_increment primary key,
    book_id int,  -- 외래키 참조용
    student_id int,
    borrow_date date not null,
    return_date date,
    foreign key(book_id) references books(id),
    foreign key(student_id) references students(id)
);

desc books;
desc borrows;

-- 샘플 데이터 입력
INSERT INTO books (title, author, publisher, publication_year, isbn, available) VALUES
('자바 프로그래밍 입문', '김영훈', '한빛미디어', 2023, '9788968481234', TRUE),
('데이터베이스 기초',   '이수진', '길벗',       2022, '9788968485678', TRUE),
('알고리즘 문제 해결', '박민수', '인사이트',    2021, '9788968489012', FALSE),
('웹 개발 입문',       '최지영', '한빛아카데미', 2024, '9788968483456', TRUE),
('소프트웨어 공학',    '정현우', '생능출판사',   2020, '9788970507890', FALSE);

INSERT INTO students (name, student_id) VALUES
('홍길동', '20230001'),
('김민서', '20230002'),
('이준호', '20230003');

INSERT INTO borrows (book_id, student_id, borrow_date, return_date) VALUES
(3, 1, '2025-05-01', NULL),  -- 홍길동 → 알고리즘 문제 해결 대출 중
(5, 2, '2025-05-03', NULL);  -- 김민서 → 소프트웨어 공학 대출 중

select * from borrows;
select * from books;

select * from students order by id;

-- 학번으로 학생 조회하기(결과 집합 단일 행으로 나오겠구나)
select * from students
where student_id = 20230001;

-- 실패한 케이스
select * from students
where student_id = 9920230001;

-- 제목으로 도서 검색 기능
select * 
from books
where title like '%입문%';

-- 도서 전체 검색 기능
select *
from books
order by id;

-- 도서 등록 기능
INSERT INTO books (title, author, publisher, publication_year, isbn, available) VALUES
('테스트책', '저자', '한빛미디어', 2026, '9788968481239', TRUE);

select * 
from borrows
;

select * 
from books
;

-- join하여 도서 이름까지 출력
select k.title, b.*, k.available 
from borrows b
inner join books k
on b.id = k.id;







