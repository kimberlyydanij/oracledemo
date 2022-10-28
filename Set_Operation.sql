/*=========================================
집합연산자(Set Operations)
===========================================

-둘 이상의 query결과를 하나의 결과로 조합한다.
-select의 인자 갯수가 같아야 한다.
  첫번째 select가 2개이면 두번째 select도 2개여야 한다.
-타입이 일치해야 한다.  
 예를 들어 character이면 character이여야 한다.

집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
 
--================================================================== 
*/

--union(합집합)

SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;


SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;

---intersect(교집합)

SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;

--minus(=except 차집합)

SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;
