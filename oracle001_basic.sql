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


