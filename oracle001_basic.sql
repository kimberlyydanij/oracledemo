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

-- DISTINCT는 중복제거를 한 후에 출력해주는 명령어 이다.
SELECT DISTINCT first_name 
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;

/*
first_name     last_name
Sundar        Abel
Sundar        Abel
Sundar        Ande
*/ 

/*
-- SELECT 입력순서
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

---
해석순서
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- employees테이블에서 salary이 3000미만 일때의
-- first_name, salary을 출력해라

SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees테이블에서 first_name컬럼의 값이 'David' 일때의
-- first_name, salary을 출력해라

SELECT first_name, salary
FROM employees
WHERE first_name='David';

-- employees테이블에서 first_name컬럼의 값이 'David' 아닐때의
-- first_name, salary을 출력해라

SELECT first_name, salary
FROM employees
WHERE first_name !='David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

--%%(and), ||(or)
--employees 테이블에서 salary가 3000,9000,17000 일때
--first_name, hire_date, salary를 출력하라

SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 or salary = 9000 or salary=17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN (3000,9000,17000);

--employees 테이블에서 salary가 3000이상, 5000이상 일때
--first_name, hire_date, salary를 출력하라

SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <=5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

--employees 테이블에서 job_id가 'IT_PROG'가 아닐 때
--first_name, email, job_id를 출력하라

SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT (job_id = 'IT_PROG');

--%%(and), ||(or)
--employees 테이블에서 salary가 3000,9000,17000가 아닐때
--first_name, hire_date, salary를 출력하라

SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary = 3000 or salary = 9000 or salary=17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN (3000,9000,17000);


--employees 테이블에서 salary가 3000이상, 5000이하가 아닐때
--first_name, hire_date, salary를 출력하라

SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary >= 3000 AND salary <=5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;

--employees 테이블에서 commission_pct가 null일때
--first_name, salary, commission_pct를 출력하라.

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

--employees 테이블에서 commission_pct가 null이 아닐때
--first_name, salary, commission_pct를 출력하라.

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees 테이블에서 first_name에 'der' 포함이된
--first_name, salary, email

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE  '%der%' ;

--employees 테이블에서 first_name의 값 중 'A'로 시작하고
--두번째 문자는 임의의 문자이면서 'exander'로 끝나는
--first_name, salary, email을 출력하라

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

/*
WHERE절에서 사용된 연산자의 3가지 종류
1. 비교연산자 : = > >= < <= != <> ^=
2. SQL연산자 : BETWEEN A And B, IN. LIKE, IS NULL
3. 논리연산자 : AND, OR. NOT

우선순위
1. 괄호()
2. NOT 연산자
3. 비교연산자, SQL 연산자
4. AND
5. OR
*/

--employees 테이블에서 job_id를 오름차순으로
--first_name, email, job_id를 출력하시오. (오름차순 ASC 생략가능)

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;

--employees 테이블에서 department_id를 오름차순으로
--first_name을 내림차순으로
--department_id, first_name, salary를 출력하시오. (오름차순 ASC 생략가능)

SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

--employees 테이블에서 가장 최근 입사 순으로
--사원의 first_name, salary, hire_date를 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

--employees테이블에서 업무(job_iod)이 'FI_ACCOUNT'인 사원들의
--급여(salary)가 높은 순으로 first_name, job_id, salary를 출력하시오.

SELECT first_name, job_id, salary
FROM employees
WHERE job_id LIKE 'FI_ACCOUNT'
ORDER BY salary DESC;

