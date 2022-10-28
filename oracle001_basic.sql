select first_name
from employees;

-- �ּ�ó��
-- CTRL + Enter : ����
-- ���� > ȯ�漳�� > �ڵ������� > �۲� > ũ�� ����
-- SELECT ��ȸ

SELECT * FROM employees;
SELECT * FROM tab;

-- �÷���, ���̺�� ��Ī(alias)�� ������ �� �ִ�.
-- ��Ī(alias)�� ������ ���� ���� ""�� ���δ�.

SELECT salary, salary*10 AS bonus
FROM employees;

SELECT salary, salary*10 AS ���ʽ�
FROM employees;

SELECT salary, salary*10 AS "b o n u s"
FROM employees;

-- King���� �޿��� 24000�Դϴ�.
SELECT last_name || '���� �޿��� ' || salary || '�Դϴ�.' AS name
FROM employees;

-- DISTINCT�� �ߺ����Ÿ� �� �Ŀ� ������ִ� ��ɾ� �̴�.
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
-- SELECT �Է¼���
SELECT column_name1, column_name2
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
ORDER BY column_name ASC, column_name DESC;

---
�ؼ�����
FROM table_name
WHERE column_name='value'
GROUP BY column_name
HAVING column_name='value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- employees���̺��� salary�� 3000�̸� �϶���
-- first_name, salary�� ����ض�

SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees���̺��� first_name�÷��� ���� 'David' �϶���
-- first_name, salary�� ����ض�

SELECT first_name, salary
FROM employees
WHERE first_name='David';

-- employees���̺��� first_name�÷��� ���� 'David' �ƴҶ���
-- first_name, salary�� ����ض�

SELECT first_name, salary
FROM employees
WHERE first_name !='David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

--%%(and), ||(or)
--employees ���̺��� salary�� 3000,9000,17000 �϶�
--first_name, hire_date, salary�� ����϶�

SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 or salary = 9000 or salary=17000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN (3000,9000,17000);

--employees ���̺��� salary�� 3000�̻�, 5000�̻� �϶�
--first_name, hire_date, salary�� ����϶�

SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <=5000;

SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

--employees ���̺��� job_id�� 'IT_PROG'�� �ƴ� ��
--first_name, email, job_id�� ����϶�

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
--employees ���̺��� salary�� 3000,9000,17000�� �ƴҶ�
--first_name, hire_date, salary�� ����϶�

SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary = 3000 or salary = 9000 or salary=17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN (3000,9000,17000);


--employees ���̺��� salary�� 3000�̻�, 5000���ϰ� �ƴҶ�
--first_name, hire_date, salary�� ����϶�

SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary >= 3000 AND salary <=5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;

--employees ���̺��� commission_pct�� null�϶�
--first_name, salary, commission_pct�� ����϶�.

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

--employees ���̺��� commission_pct�� null�� �ƴҶ�
--first_name, salary, commission_pct�� ����϶�.

SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees ���̺��� first_name�� 'der' �����̵�
--first_name, salary, email

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE  '%der%' ;

--employees ���̺��� first_name�� �� �� 'A'�� �����ϰ�
--�ι�° ���ڴ� ������ �����̸鼭 'exander'�� ������
--first_name, salary, email�� ����϶�

SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

/*
WHERE������ ���� �������� 3���� ����
1. �񱳿����� : = > >= < <= != <> ^=
2. SQL������ : BETWEEN A And B, IN. LIKE, IS NULL
3. �������� : AND, OR. NOT

�켱����
1. ��ȣ()
2. NOT ������
3. �񱳿�����, SQL ������
4. AND
5. OR
*/

--employees ���̺��� job_id�� ������������
--first_name, email, job_id�� ����Ͻÿ�. (�������� ASC ��������)

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;

--employees ���̺��� department_id�� ������������
--first_name�� ������������
--department_id, first_name, salary�� ����Ͻÿ�. (�������� ASC ��������)

SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

--employees ���̺��� ���� �ֱ� �Ի� ������
--����� first_name, salary, hire_date�� ����Ͻÿ�.
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

--employees���̺��� ����(job_iod)�� 'FI_ACCOUNT'�� �������
--�޿�(salary)�� ���� ������ first_name, job_id, salary�� ����Ͻÿ�.

SELECT first_name, job_id, salary
FROM employees
WHERE job_id LIKE 'FI_ACCOUNT'
ORDER BY salary DESC;

