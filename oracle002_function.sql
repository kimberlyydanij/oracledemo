/*===============================================
SQL(Stuctured query langague)함수

1. 단일행함수 : 행 하나당 하나의 결과를 출력한다.
                    (문자함수, 숫자함수, 날짜함수, 볗놘함수, 일반함수)
2. 복수행함수 : 행 여러개당 하나의 결과를 출력한다.
                    (합계, 평균, 최대, 최소, 갯수)
================================================
--SELECT문에서는 반드시 테이블명을 명시해야 한다.
--그래서 SELECT 절에 식이나 특정함수를 이용해서 결과값을 가져올때
--사용할 수 있는 DUAL이라는 테이블을 제공하고 있다. */
SELECT 3+1
FROM dual;

SELECT sysdate
FROM dual;

/*------------------
문자함수------------*/

--단어의 첫글자만 대문자로 변경해주는 함수이다.
SELECT initcap('korea hello')
FROM dual;

--모든 문자를 대문자로 변경해주는 함수이다./*toUpperCase()*/
SELECT upper('korea')
FROM dual;

SELECT first_name, upper(first_name), last_name, upper(last_name)
FROM employees;

--모든 문자를 소문자로 변경해주는 함수이다
SELECT lower('KOREA')
FROM dual;

SELECT first_name, lower(first_name), last_name, lower(last_name)
FROM employees;

--employees테이블 first_name에서 대소문자 구분없이
--'Ja'가 포함이 된 first_name, salary을 출력하라.
SELECT first_name, salary
FROM employees
WHERE upper(first_name) LIKE upper('%Ja%');

-- 문자의 길이를 리턴해주는 함수이다
SELECT length('korea')
FROM dual;

SELECT length('한글')
FROM dual;

--테이블 생성
CREATE TABLE user1(
    data varchar2(5)
); 

DESC user1;

SELECT * FROM user1;

----------- 테이블명(컬럼)
INSERT INTO user1(data)
VALUES('korea');

SELECT * FROM user1;
--ORA-12899: value too large for column "HR"."USER1"."DATA" (actual:11, maximum :5)
INSERT INTO user1(data);
VALUES('south korea');

--ORA-00984: column not allowed here 00984. 00000 -  "column not allowed here" INSERT INTO user1(data)
INSERT INTO user1(data);
VALUES("한글");

--특정범위의 문자를 추출해 주는 함수이다.
--substr('문자', 시작위치, 갯수) /*(substring,start,end)*/
SELECT substr('oracle test', 1, 4)  --orac
FROM dual;

SELECT substr('oracle test', -3, 4) --est
FROM dual;

SELECT substr('오라클테스트', 3, 4) --클테스트
FROM dual;

SELECT substr('오라클테스트', -3, 4) --테스트
FROM dual;

--특정문자의 인덱스를 추출해주는 함수이다.
SELECT instr('korea', 'or')  --2
FROM dual;

SELECT instr('한국자바', '자바') --3
FROM dual;

--주어진 문자열에서 왼쪽으로 특정문자를 채우는 함수이다.
--                '문자', 자릿수, 채울문자
SELECT lpad('korea',8,'*') --***korea
FROM dual;

SELECT rpad('korea',8,'*') --korea***
FROM dual;

-- 주어진 문자열에서 왼쪽의 특정문자를 삭제하는 함수이다.
SELECT ltrim('***korea', '*') --korea
FROM dual;

-- 주어진 문자열에서 왼쪽의 특정문자를 삭제하는 함수이다.
SELECT rtrim('korea***', '*') --korea
FROM dual;

-- 주어진 문자열에서 양쪽의 특정문자를 삭제하는 함수이다.
SELECT trim('*' from '***korea***') --korea
FROM dual;

--주어진 문자열에서 왼쪽의 공백 제거
SELECT '         korea', length('     korea'),  ltrim('      korea'), length(ltrim('     korea'))
FROM dual;

--주어진 문자열에서 오른쪽의 공백 제거
SELECT trim ('    ' from '       korea    '), length(trim('   ' from '       korea   '))
FROM dual;

--주어진 문자의 아스키 코드값을 구하는 함수이다.
SELECT ascii('A')  --65
FROM dual;

--주어진 아스키 코드값의 문자를 구하는 함수이다.
SELECT chr(65)  --A 
FROM dual;

--주어진 문자를 연결하는 함수이다.
SELECT concat('java','jsp') --javajsp
FROM dual;

SELECT 'java' || 'jsp' --javajsp
FROM dual;

/*----------------------------
숫자함수
----------------------------*/

--3.55를 소수점 1의 자리까지 구하시오(반올림)
SELECT round(3.55,1) --3.6
FROM dual;

--42523.55를 10의 자리까지 구하시오(반올림)
SELECT round(42523.55, -1)  --42520
FROM dual;

--42523.55를 1의 자리까지 구하시오(반올림)
SELECT round(42523.55, 0)  --42524
FROM dual;

SELECT round(42523.55) --42524
FROM dual;

--256.78을 무조건 올림한다.(올림)
SELECT ceil(256.78) --257
FROM dual;

--256.78에서 소수이하는 무조건 버린다. (버림)
SELECT floor(256.78) --256
FROM dual;

--2의 3승(거듭제곱)
SELECT power(2,3)  --8
FROM dual;

--25의 제곱근
SELECT sqrt(25)
FROM dual;

--나머지
SELECT 10%3 --ORA-00911: invalid character
FROM dual;

SELECT mod(10,3) --1
FROM dual;

/*-----------------------
날짜함수
-----------------------*/

--현재 시스템에서 제공해주는 오늘의 날짜 구하는 함수
SELECT sysdate
FROM dual;

SELECT sysdate + 1  -- 내일
FROM dual;

SELECT sysdate - 1  -- 어제
FROM dual;

-- 오늘을 기준으로 10개월 후의 날짜
SELECT add_months(sysdate,10)
FROM dual;


/*----------------------------------
변환형 함수
숫자                       문자                날짜
to_number() <-> to _char()  <->  to_date()
----------------------------------*/

--숫자 -> 문자
SELECT to_char(2532, '9,999.99') --2,532.00
FROM dual;

SELECT to_char(2532, '999,999.99') --  2,532.00
FROM dual;

SELECT to_char(2532, '000,000.00') --2,532.00
FROM dual;

--각 나라의 통화를 표현할 때는 L기호를 사용한다.
SELECT to_char(2532, 'L999,999.99')--          ￦2,532.00
FROM dual;

-- 날짜 -> 문자
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day') --2022-10-31 11:18:13 monday   
FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy') --2022-10-31 11:20:05 mon
FROM dual;

SELECT to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day') --2022-10-31 11:20:23 monday   
FROM dual;

/*
java
// HH : 24시간 hh : 12시간
   String pattern = "yyyy-MM-dd HH:mm:ss a EEEE";
*/

/*-----------------------------
to_number()
문자 -> 숫자
-----------------------------*/
SELECT '253' || '12' --25312
FROM dual;

SELECT concat('253','12') --25312
FROM dual;

SELECT '253' + '12' --265
FROM dual;

SELECT to_number('253') + to_number('12') --265
FROM dual;

/*--------------------------------
to_date()
문자 -> 날짜
--------------------------------*/
SELECT to_date('2022-10-14') --22/10/14
FROM dual;

------------------------------------------
SELECT first_name, hire_date
FROM employees;

--hire_date(입사일)을 이용해서 '홍길동님은 2003년 1월 3일에 입사했습니다.' 로 출력하는 query를 작성하시오.
--Steven님은 2003년 06월 17일에 입사했습니다.
SELECT first_name || '님은 ' || to_char(hire_date,'yyyy') || '년 ' || to_char(hire_date,'mm')
             || '월 ' || to_char(hire_date, 'dd') || '일에 입사했습니다.'
FROM employees;

/*------------------------------------
일반함수(NULL)
1. nvl(컬럼, 대체값) : 첫번째 인자값이 null 이면 0으로 대체해서 출력한다.
    - 대체할 값이 숫자이면 두번째 인자값에 숫자를 지정한다.
    - 대체할 값이 문자이면 두번째 인자값에 문자를 지정한다.
    - 대체할 값이 날짜이면 두번째 인자값에 날짜를 지정한다.
------------------------------------*/

SELECT commission_pct, nvl(commission_pct,0)
FROM employees;

SELECT first_name, manager_id, nvl(to_char(manager_id), 'CEO')
FROM employees;

/*------------------------------------
일반함수(NULL)
2. nvl2(컬럼, 대체값1, 대체값2) : 컬럼의 값이 null아니면 대체값1, null이면 대체값2로 출력한다.
------------------------------------*/
SELECT commission_pct, nvl2(commission_pct,1,0)
FROM employees;

SELECT count(*), sum(nvl2(commission_pct,1,0))
FROM employees;

SELECT count(*) AS 전체사원수,
          sum(nvl2(commission_pct, 1,0)) AS "커미션지급 사원수",
          count(*)-sum(nvl2(commission_pct,1,0)) AS "커미션 미지급 사원수"
FROM employees;

/*---------------------------------------------------------
일반함수(NULL)
3. NULLIF(컬럼, 대체값(정확히 일티된 값만 넣을 수 있음. >0.4 안됨)
commision_pct가 0.4면 널로, 아니면 기존 값 리턴
컬럼값과 비교값이 같으면 Null로 리턴하고 같지 않으면 컬럼의값으로 리턴한다.
---------------------------------------------------------*/
SELECT commission_pct, NULLIF(commission_pct,  0.4)
FROM employees;

/*----------------------------------------------------------------
일반함수(NULL)
4. coalesce(컬럼1, 컬럼2)
2개 값을 비교해서 널이 아닌 값으로 처리함(둘다 널이 아니면 앞의 값,  2개다 널이면 널로 처리함, 
----------------------------------------------------------------*/
SELECT first_name,commission_pct, salary, coalesce(commission_pct, salary)
FROM employees;

SELECT first_name,commission_pct, commission_pct, coalesce(commission_pct, commission_pct)
FROM employees;

/*-------------------------------------------------------
decode(컬럼, 식, 값1, 처리1, 값2, 처리2, 그 밖의 처리)
java의 switch-case 문과 비슷
-------------------------------------------------------*/
--department_id이 10이면, 'ACCOUNTING', 20이면 'RESEARCH',
--                         30이면, 'SALES', 40이면 'OPERATIONS', 'OTHERS'
SELECT first_name, department_id,
             decode(department_id, 10, 'ACCOUNT',
                                                 20, 'RESEARCH',
                                                 30, 'SALES',
                                                 40, 'OPERATIONS', 'OTHERS') AS department_name
FROM employees;
                                                       
-- 직급이 'PR_REP'인 사원은 5%, 'SA_MAN'인 사원은 10%, 'AC_MAN'인 사원은 15%, 'PU_CLERK'인 사원은 20% 인상
SELECT job_id, salary, 
            decode(job_id, 'PR_REP', salary*1.05,
                                    'SA_MAN', salary*1.1,
                                    'AC_MAN', salary*1.15,
                                    'PU_CLERK', salary*1.2, salary) AS newsal
FROM employees;

/*-----------------------------------------------------------
case when 조건식1 then 처리1
        when 조건식2 then 처리2
        when 조건식3 then 처리3
        else 처리n
end AS alias;

java에서 다중 if-else문과 비슷
-----------------------------------------------------------*/
-- 입사일(hire_date)  1-3이면 '1사분기', 4-6이면 '2사분기', 
--                           6-9이면 '3사분기', 10-12이면 '4사분기'
-- 로 처리하고 사원명(first_name), 입사일(hire_date), 분기로 출력하시오.

SELECT first_name, hire_date,
             case when to_char(hire_date,'mm')<=3 then '1사분기'
                      when to_char(hire_date,'mm')<=6 then '2사분기'
                      when to_char(hire_date,'mm')<=9 then '3사분기'
                      when to_char(hire_date,'mm')<=12 then '4사분기'
             end AS "분기"
FROM employees;

-- salary의 값이 10000미만이면 '하', 10000이상 20000 미만이면 '중', 20000이상이면 '상'
-- 으로 출력하도롯 query문을 작성하시오.

SELECT first_name, salary,
             case when salary > 10000 then '하'
                      when salary > 20000 then '중'
                      else '상'
             end AS "구분"
             FROM employees;
             
/*-----------------------------------------------------
집계함수(Aggregate Function), 그룹함수(Group Funcion)
max([DISTINCT|ALL] 컬럼) : 최대값
min([DISTINCT|ALL] 컬럼) : 최소값
count([DISTINCT|ALL] 컬럼) : 갯수
sum([DISTINCT|ALL] 컬럼) : 합계
avg([DISTINCT|ALL] 컬럼) : 평균
stddev([DISTINCT|ALL] 컬럼) : 표준편차
variance([DISTINCT|ALL] 컬럼) : 분산
------------------------------------------------------*/
SELECT max(salary), min(salary), count(salary), sum(salary), avg(salary), stddev(salary), variance(salary)
FROM employees;

--NULL 값이 아닌 컬럼수를 리턴
SELECT count(commission_pct)
FROM employees;  

SELECT count(employee_id)
FROM employees;

SELECT count(*)
FROM employees;


SELECT DISTINCT count(commission_pct) --35 
FROM employees;

SELECT count(ALL commission_pct) --35 
FROM employees;

SELECT count(DISTINCT commission_pct) --7
FROM employees;

