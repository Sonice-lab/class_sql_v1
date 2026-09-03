-- DML 사용해보기

-- SELECT * FROM student;

-- 데이터 추가 (1건)
INSERT INTO student (student_id, name, grade, major, phone)
				VALUES(1001, '김철수', 2, '컴퓨터공학', '010-1234-1234');
                
-- 데이터 추가(여러 건)                
INSERT INTO student (student_id, name, grade, major, phone)
				VALUES(1002, '이영희', 1, '경영학', '010-1234-1234'),
					(1003, '강민준', 2, '전자공학', '010-1234-1234'),	
                    (1004, '홍길동', 4, '생명공학', '010-1234-1234');
                    
-- 데이터 조회(DML) - SELECT
SELECT * FROM student;
SELECT name, major FROM student;
SELECT name, major, grade FROM student WHERE grade = 2;

-- 데이터 수정(DML) - UPDATE                    
-- 수정 질의어에서 WHERE절이 없으면 전체 행(row)을 수정하라는 명령어이기 때문에 
-- 가능한 절대 WHERE 절 없이 사용하면 안된다.
UPDATE student SET major = '컴공'; -- WHERE 절 없는 UPDATE 구문은 가능한한 아용하지 않는 것을 권장    
UPDATE student SET grade = 4 WHERE student_id = '1001'; 

-- 데이터 삭제 (DML) - DELETE
-- 사용에 주의 삭제 질의어 또한 반드시 WHERE 절을 두번, 세번 확인하자!
DELETE FROM student;

-- 특이사항. 삭제 쿼리는 없는 데이터 삭제 요청을 하더라도 오류가 아님
DELETE FROM student WHERE student_id = 1004;
DELETE FROM student WHERE grade = 2;

