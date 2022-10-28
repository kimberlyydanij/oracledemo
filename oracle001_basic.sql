select first_name
from employees;

-- 주석처리
-- CTRL + Enter : 실행
-- 도구 > 환경설정 > 코드편집기 > 글꼴 > 크기 조정
-- SELECT 조회

SELECT * FROM employees;
SELECT * FROM tab;

-- 컬럼명, 테이블명에 별칭(alias)을 지정할 수 있다.
-- 별칭(alias)에 공백이 있을 때는 ""를 붙인다.

SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS 보너스
FROM employees;

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

-- King님의 급여는 24000입니다.
SELECT last_name || '님의 급여는 ' || salary || '입니다.' AS name
FROM employees;


