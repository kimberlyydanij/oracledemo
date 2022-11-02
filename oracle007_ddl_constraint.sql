/*
테이블 구조 정의
CREAT TABLE table_name(
    column_name datatype,
    column_name datatype
);

자료형(Datatype)
varchar2 - 가변길이 문자를 저장
char - 고정길이 문자를 저장
number(m) - 정수 저장
number(m,n) - 실수 저장
date - 날짜 저장
datetime -  날짜 시간 저장
*/

CREATE TABLE student(
    name varchar2(20), -- 바이트(영문, 특수문자 - 1byte, 한글 - 3byte)
     age number(3), --자릿수
     avg number(5,2), --5는 전체자릿수, 2는 소숫점이하 값(243.23)
     hire date
);

SELECT * FROM student;

--  정상 삽입
INSERT INTO student(name, age, avg, hire)
VALUES ('홍길동', 30, 97.85, sysdate);

--ORA-12899: value too large for column "HR"."STUDENT"."NAME" (actual: 26, maximum: 20)
--INSERT INTO student(name, age, avg, hire)
--VALUES ('박차고 나온 세상에', 30, 97.85, sysdate);

--3000:크기 초과(3자리 까지 가능)_
--ORA-01438: value larger than specified precision allowed for this column
--INSERT INTO student(name, age, avg, hire)
--VALUES ('홍길동', 3000, 97.85, sysdate);

--2997.85 :크기 초과(소숫점 제외 5자리 까지 가능)_
--ORA-01438: value larger than specified precision allowed for this column
--INSERT INTO student(name, age, avg, hire)
--VALUES ('홍길동', 30, 2997.85, sysdate);

--  정상 삽입(소숫점 이하는 반올림 해서 삽입함)
INSERT INTO student(name, age, avg, hire)
VALUES ('홍길동', 30, 297.8572, sysdate);

/*
ALTER
객체(table)의 구조를 변경해주는 명령어이다.
*/

-- 생성 : CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE INDEX
-- 수정 : ALTER TABLE, ALTER SEQUENCE, ALTER VIEW, ALTER INDEX

-- 테이블에 컬럼을 추가한다.
ALTER TABLE student
ADD loc varchar2(50);

/* 
describe                                          descending
DESC table_name:  테이블 구조 확인,     DESC column_name : 내림차순
*/

DESC student;

SELECT * FROM student;

--데이터가 삽입되어 있는 상태에서 줄일 수는 없다.
--ORA-01441: cannot decrease column length because some value is too big
--ALTER TABLE student
--MODIFY name varchar2(5);

--저장된 데이터의 크기로 줄일수는 있다.
ALTER TABLE student
MODIFY name varchar2(9);

-- 크기를 늘리는 것은 상관 없다.
ALTER TABLE student
MODIFY name varchar2(30);

--테이블의 컬럼명을 수정한다.
ALTER TABLE student
RENAME COLUMN avg to jumsu;
DESC student;

--테이블명을 변경한다
ALTER TABLE student
RENAME TO members;

-- ORA-04043: student 객체가 존재하지 않습니다.
DESC student;

-- 정상수행
DESC members;

/*
DELETE : 테이블에 저장된 데이터를 모두 삭제한다. (오토커밋 발생 안함)
TRUNCATE : 테이블에 저장된 데이터를 모두 삭제한다. (오토 커밋 발생함)
테이블 기본 구조는 모두 가지고 있다.
DROP :  테이블 자체를 삭제한다.
*/

COMMIT;
SELECT * FROM members;

DELETE FROM members;

ROLLBACK;

TRUNCATE  TABLE members; --AUTO COMMIT 발생해서 롤백 안됨

DROP TABLE members; --AUTO COMMIT 발생해서 롤백 안됨

/*
무결성 제약조건
    무결성이 데이터베이스 내에 있는 데이터의 정확성을 유지를 의미한다면
    제약조건은 바람직하지 않는 데이터가 저장되는 것을 방지하는 것을 말한다.
    
    무결성 제약조건 5종류 : not null, unique, primary key, foreign key, check
    1) not null : null을 허용하지 않는다.
    2) unique : 중복된 값을 허용하지 않는다. 항상 유일한 값이다. null 값은 허용한다.
    3) primary key : not null + unique
    4) foreign key :  참조되는 테이블 컬럼의 값이 존재하면 허용된다.
    5) check : 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값 만을 허용한다.
    
    무결성 제약조건 2가지 레벨 : 컬럼레벨, 테이블 레벨
    
    컬럼레벨 설정
    CREATE TABLE emp06(
        id varchar2(10) constraint emp06_id_pk  primary key
        name varchar2(20) constraint emp06_name_nn not null,
        age number(3) constraint emp06_age_ck check(age between 20 and 50), --20~50사이로 제한
        gen char(1) constraint emp06_gen_ck check(gen in('m','w'))
        
        
    테이블레벨 설정
     CREATE TABLE emp07(
        id varchar2(10), 
        name varchar2(20) constraint emp07_name_nn not null,
        age number(3),
        gen char(1),
        constraint emp07_id_pk primary key(id), 
        constraint emp07_age_ck check(age between 20 and 50)
        constraint emp07_gen_ck check(gen in('m','w'))
    );
*/

 CREATE TABLE emp06(
        id varchar2(10) constraint emp06_id_pk  primary key,
        name varchar2(20) constraint emp06_name_nn not null,
        age number(3) constraint emp06_age_ck check(age between 20 and 50), --20~50사이로 제한
        gen char(1) constraint emp06_gen_ck check(gen in('m','w'))
    );


SELECT * FROM user_constraints  --테이블에 이미 설정되어있는 제약조건
WHERE constraint_name LIKE '%EMP06%';

INSERT INTO emp06(id, name, age, gen)
VALUES('kim','김고수',15,'m')


 CREATE TABLE emp06(
        id varchar2(10) constraint emp06_id_pk  primary key,
        name varchar2(20) constraint emp06_name_nn not null,
        age number(3) constraint emp06_age_ck check(age between 20 and 50), --20~50사이로 제한
        gen char(1) constraint emp06_gen_ck check(gen in('m','w'))
    );

--ORA-02290: check constraint (HR.EMP06_AGE_CK) violated  //20~50 사이만 가능
INSERT INTO emp06(id, name, age, gen)
VALUES('kim','김고수',15,'m');

--ORA-02290: check constraint (HR.EMP06_GEN_CK) violated // m/w만 가능
INSERT INTO emp06(id, name, age, gen)
VALUES('kim','김고수',25,'p');

--정상 삽입
INSERT INTO emp06(id, name, age, gen)
VALUES('kim','김고수',25,'m');

--ORA-02290: check constraint (HR.EMP06_GEN_CK) violated
INSERT INTO emp06(id, name, age, gen)
VALUES('kim','김고수',25,'p');

--ORA-02290: check constraint (HR.EMP06_GEN_CK) violated
INSERT INTO emp06(id, name, age, gen)
VALUES('null','김고수',25,'m');


SELECT * FROM emp06;

DROP TABLE dept01;

SELECT * FROM user_constraints
WHERE constraint_name Like '%EMP06%';

--primary key 와 foreign key

CREATE TABLE dept01(
deptno number(2) constraint dept01_deptno_pk primary key,
dname varchar2(20)
);

INSERT INTO dept01(deptno, dname)
VALUES(10, 'accounting');

SELECT * FROM dept01;

INSERT INTO dept01(deptno, dname)
VALUES(20, 'sales');

INSERT INTO dept01(deptno, dname)
VALUES(30, 'research');

CREATE TABLE loc01(
    locno number(2),
    locname varchar2(20),
    constraint loc01_locno_pk primary key(locno)
);

INSERT INTO loc01(locno, locname)
    VALUES(11, 'seoul');
  
 INSERT INTO loc01(locno, locname)
    VALUES(12, 'jeju'); 
    
INSERT INTO loc01(locno, locname)
    VALUES(13, 'busan'); 
    
SELECT * FROM loc01;

CREATE TABLE emp08(
    empno number(2) constraint emp08_empno_pk primary key,
    deptno number(2) constraint emp08_deptno_fk references dept01(deptno),
    locno number(2),
    constraint emp08_locno_pk foreign key(locno) references loc01(locno)
);

SELECT * FROM emp08;

--정상 삽입
INSERT INTO emp08(empno, deptno, locno)
VALUES(1, 10,11);

INSERT INTO emp08(empno, deptno, locno)
VALUES(2, 20,12);

INSERT INTO emp08(empno, deptno, locno)
VALUES(3, null,null);

--ORA-02291: integrity constraint (HR.EMP08_DEPTNO_FK) violated - parent key not found
INSERT INTO emp08(empno, deptno, locno)
VALUES(4, 40, 11);

--ORA-02291: integrity constraint (HR.EMP08_LOCNO_PK) violated - parent key not found
INSERT INTO emp08(empno, deptno, locno)
VALUES(5, 30, 14);

-- emp08 테이블의 deptno컬럼에서 30을 참조하지 않기 때문에 이상없이 삭제가 가능하다.
DELETE FROM dept01
WHERE deptno=30;

SELECT * FROM emp08;

--ORA-02292: integrity constraint (HR.EMP08_DEPTNO_FK) violated - child record found
DELETE FROM dept01
WHERE deptno=20;

/* 다른 테이블에서 현재 테이블을 참조해서 사용하고 있을 때는
    제약조건을 제거한 후 현재 테이블의 데이터를 삭제한다.
*/

SELECT * FROM user_constraints
WHERE constraint_name LIKE '%EMP08%';

ALTER TABLE emp08
DROP CONSTRAINT emp08_deptno_fk;

DELETE FROM dept01
WHERE deptno=20;

SELECT * FROM dept01;

/*
부모키가 삭제가 되면 참조되는 키도 삭제가 되도록 cascade를 설정한다.
*/

-- 삽입
INSERT INTO dept01
VALUES (20,'sales');

--cascade 설정
ALTER TABLE emp08
ADD constraint emp08_deptno_fk foreign key(deptno) references dept01(deptno) ON DELETE CASCADE;

SELECT * FROM dept01;
SELECT * FROM emp08;

DELETE FROM dept01
WHERE deptno=10;

/*
ON UPDATE CASCADE는 오라클에서 제공안됨
해결방법 : TRIGGER
*/

CREATE OR REPLACE TRIGGER dept_tri
    AFTER UPDATE ON dept01 FOR EACH ROW --업데이트 후 dept01에 있는 모든 행을 각각 수정해라
BEGIN --EMP08테이블에서 WHERE일때  SET을 수정하라
    UPDATE emp08
    SET deptno=50
    WHERE deptno=20
END;

UPDATE dept01
SET deptno=50
WHERE deptno=20;
