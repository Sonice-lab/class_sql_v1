
-- 3. 주요 함수 사용해보기

-- 3.1. 집계 함수
-- 문제1) 전체 직원 수와 부서가 정해진 직원 수
select *  from employees;

select count(*) as 전체, count(department) as 부서있음
from employees;

-- count(컬럼) 그 컬럼이 NULL이 아닌 행만 셉니다.

-- 문제2) 평균 급여, 최고 급여, 최저 급여, 합계
-- 주의
select round(avg(salary), 2) as 평균,
	   max(salary) as 최고,
       min(salary) as 최저,
       sum(salary) as 합계,
       name -- 오류로 인식 -> 집계 결과는 1행인데 name은 6행이기에 어느 것을 보여줄 지 사실 정할 수 없음
            -- 현재 버전에서는 아마 제일 위의 값이 나온다.
			-- 하지만 논리적 모순이므로 오류로 취급해야 한다.
from employees;

-- 문자열 함수
-- 문제3) 이름 뒤에 '님'자를 붙이고 성씨만 뽑기
select name,
	   concat(name, ' 님') as 호칭,
       -- 자바와 다르게 1은 첫번째 글자를 의미한다.
       substring(name, 1, 1) as 성씨
from employees;

-- 도전 과제 김**으로 나올 수 있도록 구문 추가하기
select name,
	   concat(name, ' 님') as 호칭,
       -- 자바와 다르게 1은 첫번째 글자를 의미한다.
       substring(name, 1, 1) as 성씨,
       -- 성씨 한 글자만 남기고 나머지는 *로 가린다.
       concat(substring(name, 1, 1), '**') as 마스킹
from employees;

-- 문제4) 이메일을 대문자로 바꾸고, 앞 4글자만 뽑아보기
select email,
	   upper(email) as 대문자,
       lower(email) as 소문자,
	   substring(email, 1, 4) as 앞4글자
from employees;

-- 단, 한글에는 대소문자 개념이 없기 때문에 실행 시 아무런 변화가 없음

-- 3. 논리 및 조건 함수
-- 문제5) 급여에 따라서 등급 나누기(CASE)
select name, salary,
	   case
        when salary >= 3500000 then '상'
        when salary >= 3000000 then '중'
        else '하'
       end as 등급
from employees 
order by 등급 asc;

-- 주의) 조건에 끈 컬럼의 값(salary)이 null이라면 바로 when에 걸리지 않고 else로 바로 떨어진다.

-- 도전 과제 5.1) 만약 부서가 없을 경우 '미배정'으로 출력하기
select name, department,
	   case
       when department is null then '미배정'
       else department
       end as department
from employees;

-- 문제 6) 부서가 없으면 '미배정'으로 표시 (COALESCE)
select name, department,
	   coalesce(department, '미배정') as 표시부서
       -- 첫번째 인자 값이 null 이면 두번째 값을 반환
from employees;

-- 4. 날짜 및 시간 함수
-- 문제 7. 오늘 날짜와 현재 시각을 표시
select current_date() as 오늘,
	   current_time() as 현재시각,
       current_timestamp() as 현재일시;
       
-- 문제 8) 입사년도와 월 추출 또는 입사일 추출 해보기
-- extract(단위 from 날짜) 단위에는 YEAR, MONTH, DAY, HOUR 등이 들어갈 수 있다.
select name, hire_date,
	  extract(year from hire_date) as 입사연도,
	  extract(month from hire_date) as 입사월,
	  extract(day from hire_date) as 입사일
from employees
limit 3;      

-- 문제9) 근속 연수 계산(datediff)
select name, hire_date,
	   datediff(current_date, hire_date) as 근무일수
       -- 두 날짜의 일수 차이를 돌려줌
from employees;

-- 근속년수
select name, hire_date,
	   datediff(current_date, hire_date) as 근무일수,
	   datediff(current_date, hire_date) / 365.0 as 근무년수
from employees;

-- 소수점을 버리는 함수
select name, hire_date,
	   datediff(current_date, hire_date) as 근무일수,
	   floor(datediff(current_date, hire_date) / 365.0) as 근무년수
from employees;

-- datediff 함수는 MySQL 전용 함수!

-- 5. 형변환 함수
-- signed: 부호가 있는 정수, 즉 음수를 담을 수 있음.
-- unsigned: 부호가 없는 정수, 0 이상만 담을 수 있음.
select cast('123' as signed ) as 숫자변환; 
select cast('-123' as signed ) as 숫자변환; 

select cast('123' as unsigned ) as 숫자변환; 
-- 알 수 없는 숫자의 나열로 변환함
select cast('-123' as unsigned ) as 숫자변환; 

-- MySQL에서는 문자열 + 숫자는 숫자로 계산된다.(자바와 다름) > 결과값: 126
select '123' + 3 as 문자열덧셈;
-- 만약 위 결과를 1233으로 표시하고 싶다면?
-- MySQL에서는 문자열을 이으려면 반드시 concat을 사용해야 함
select concat('123', 3) as 문자열더하기;

-- 오류  --> char를 사용해야 함
select cast(123 as varchar(3)) as 확인;

-- 문자열 형변환 시 varchar 대신 반드시 char를 사용해야 한다.
select cast(123 as char(3)) as 확인;




       




