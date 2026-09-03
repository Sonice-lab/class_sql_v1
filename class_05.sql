-- DCL(Data Control Language) - 권한을 관리한다.

-- 사용자 생성(사람, 시스템에게 줄 수 있음)
-- localhost는 내 컴퓨터 안에서 접근하는 계정을 의미한다.
-- 외부에서 접근하려면 *를 치거나 또는 192.168.4.12 처럼 IP 주소를 명시할 수도 있다.
-- CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 클라이언트 소켓의 개념과 같음
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password123';

-- 새로 생성한 계정 user1에 조회 권한을 부여한다. --> 부여할 권한: student 테이블의 조회 권한만 부여
-- 조회 권한 부여
GRANT SELECT on school.student to 'user1'@'localhost';

-- 권한 확인하기
SHOW GRANTS FOR 'user1'@'localhost';

-- INSERT 권한 부여
GRANT INSERT on school.student to 'user1'@localhost;

-- update, delete 권한 부여
GRANT UPDATE, DELETE on school.student to 'user1'@localhost;

-- 외부에서 접근할 수 있는 계정을 생성하자.
-- CREATE USER 'user1'@'%' IDENTIFIED BY 'password123';

-- 권한 확인하기
-- SHOW GRANTS FOR 'user1'@'%';

-- 조회 권한 부여
-- GRANT SELECT on school.student to 'user1'@'%';

-- INSERT 권한 부여
-- GRANT INSERT on school.student to 'user1'@'%';

-- update, delete 권한 부여
-- GRANT UPDATE, DELETE on school.student to 'user1'@'%';

-- 권한 회수
-- REVOKE INSERT, UPDATE, DELETE on school.student FROM 'user1'@'localhost';

-- 계정 삭제
-- DROP user 'user1'@'localhost';

-- 계정 확인(잘 삭제되었는지 확인 가능)
-- SELECT user ();

-- 현재 USER 목록 확인
-- SELECT CURRENT_USER();

-- 도전 과제 1. (외부에서 접근할 수 있는 계정 생성 후 권한 관리하여 테스트 해보기)
-- 팀장 및 팀원 확인
-- 팀원 계정 생성
CREATE USER 'user1'@'%' IDENTIFIED BY 'password123';

-- 권한 확인하기
SHOW GRANTS FOR 'user1'@'%';

-- 조회 권한 부여
GRANT SELECT on test_db.test_table to 'user1'@'%';

-- INSERT 권한 부여
GRANT INSERT on test_db.test_table to 'user1'@'%';

-- update, delete 권한 부여
GRANT UPDATE, DELETE on test_db.test_table to 'user1'@'%';

-- 최종 권한 확인
SHOW GRANTS FOR 'user1'@'%';

-- 권한 회수
-- REVOKE INSERT, UPDATE, DELETE on school.student FROM 'user1'@'localhost';

-- 계정 삭제
-- DROP user 'user1'@'localhost';

-- 계정 확인(잘 삭제되었는지 확인 가능)
-- SELECT user ();

-- 현재 USER 목록 확인
-- SELECT CURRENT_USER();