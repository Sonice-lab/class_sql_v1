DROP DATABASE IF EXISTS relation_practice;
CREATE DATABASE relation_practice;
USE relation_practice;

-- 실습 1: 코드로 1:1 관계 만들어보기
-- 코드 컨벤션?
create table tb_person (
	person_id int auto_increment, 
    name varchar(50) not null,
    primary key (person_id)
); 

create table tb_passport (
	passport_id int auto_increment,
    passport_number varchar(20) not null,
    person_id int unique, -- 이 UNIQUE가 1:1 관계를 만들어준다. UNIQUE 없으면 1:N 관계가 되는 것이다.
    primary key(passport_id),
    foreign key(person_id) references tb_person(person_id)
    );
    
    insert into tb_person (name) values
    ('홍길동'),
    ('김영희'),
    ('이철수');
    
    insert into tb_passport (passport_number, person_id) values
    ('p123', 1),
    ('p456', 2),
    ('p789', 3);
    
    select * from tb_person;
    select * from tb_passport;
    
    -- Error Code: 1062. Duplicate entry '1' for key 'tb_passport.person_id'
	-- FK 외래키 유니크 키 설정이 되어있어 1:1 관계를 보장한다.
    insert into tb_passport (passport_number, person_id) values
    ('p100', 1);
    
    -- ★ 여권 테이블 데이터 비우기 및 auto_increment 초기화 -> 여러 명령어가 꼬여 auto_cretment의 영향으로 정보가 순번이 123부터 들어오지 않을 때
	TRUNCATE TABLE tb_passport;
    
    -- 1:N 구조를 코드로 만들어보기
    create table tb_customer (
    customer_id int auto_increment,
    name varchar(50) not null,
    primary key(customer_id)
    );
    
    select * from tb_customer;
    
    create table tb_order (
    order_id int auto_increment,
    product_name varchar(50) not null,
    customer_id int, -- UNIQUE가 없음 -> 1:N 구조 형성
    primary key(order_id),
    foreign key(customer_id) references tb_customer(customer_id)
    );

	select * from tb_order;
    
    insert into tb_customer (customer_id, name) values 
    (1, '박민지'),
    (2, '최재영');
    
    insert into tb_order (order_id, product_name, customer_id) values 
    (201, '노트북', 1),
    (202, '마우스', 1),
    (203, '키보드', 2);
    
    -- 실습 3. N:M 관계를 코드로 만들어보기
    create table tb_student (
    student_id int auto_increment,
    name varchar(50) not null,
    primary key(student_id)
    );
    
     create table tb_course (
    course_id int auto_increment,
    title varchar(50) not null,
    primary key(course_id)
    );
    
    -- 교차 테이블 생성
    -- 기본키는 튜플의 중복을 방지
    create table tb_student_course (
    student_id int,
    course_id int,
    primary key(student_id, course_id),
    foreign key (student_id) references tb_student(student_id),
    foreign key (course_id) references tb_course(course_id)
    );
    
    -- tb_student
    insert into tb_student(name) values
    ('홍길동'),
    ('김영희'),
    ('박민지');
    
    -- tb_course
    insert into tb_course(course_id, title) values
    (101, '자바 프로그래밍'),
    (102, '데이터베이스'),
    (103, '웹개발 입문');
    
     -- tb_student_course
    insert into tb_student_course(student_id, course_id) values
    (1, 101),
    (1, 102),
    (2, 102),
    (2, 103),
    (3, 101);
    
    -- 잘못된 데이터 입력해보기
    -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`relation_practice`.`tb_student_course`, CONSTRAINT `tb_student_course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tb_student` (`student_id`))
    -- 7번이란 사람은 없어!
    insert into tb_student_course(student_id, course_id) values
    (7, 101);
    
    -- 701번이라는 사람은 없어!
    insert into tb_student_course(student_id, course_id) values
    (3, 701);
    
    -- Error Code: 1062. Duplicate entry '3-101' for key 'tb_student_course.PRIMARY'
	-- 중복된 행을 입력했어, 이 사람은 이미 이 것을 듣고 있단다.
    insert into tb_student_course(student_id, course_id) values
    (3, 101);
    
    -- 도전 과제 : 1 : 1 관계 직접 테이블 설계, 1 : N 관계 테이블 설계, N:M 관계 테이블 설계  
    -- 1. 1 : 1 관계 직접 테이블 설계
    -- 사람과 항공권 정보의 관계
    -- 1. passenger 테이블 생성
    create table tb_passenger (
    passenger_id int auto_increment,
    name varchar(50) not null,
    primary key(passenger_id)
    );
    
    -- 2. pnr 테이블 생성
    create table tb_pnr (
    pnr_id int auto_increment,
    pnr varchar(6) not null,
    passenger_id int unique, -- unique가 1:1의 관계로 만들어줌
    primary key (pnr_id),
    foreign key (passenger_id) references tb_passenger(passenger_id)
    );
    
    -- 테이블 조회
    select * from tb_passenger;
    select * from tb_pnr;
    
    insert into tb_passenger (name) values
    ('김다인'),
    ('이아름'),
    ('이다니');
    
    insert into tb_pnr (pnr, passenger_id ) values
    ('A35#68', 1),
    ('A48%25', 2),
    ('A47#15', 3);
    
     -- ★pnr 테이블 데이터 비우기 및 auto_increment 초기화 -> 여러 명령어가 꼬여 auto_cretment의 영향으로 정보가 순번이 123부터 들어오지 않을 때
	TRUNCATE TABLE tb_pnr;
    
    -- 2. 1 : N 관계 테이블 설계
    
    -- 3. N:M 관계 테이블 설계
    
    

    
    


    
    
    