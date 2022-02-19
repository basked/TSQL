/*********************************************
**************-=SELECT=- *********************
*********************************************/
--DISTINCT
-- какие есть подразделения
SELECT DISTINCT e.department as dep
FROM employees e
order by dep

-- только 5 первых строк а отсортированном множестве
SELECT DISTINCT TOP 5 e.department as dep
FROM employees e
order by dep

-- только 10% от всей выборки
SELECT DISTINCT TOP 10 PERCENT e.*
FROM employees e
ORDER BY e.LName
,        e.FName

-- сортировка поФамилии и  ДР
SELECT e.*
FROM employees e
ORDER BY e.LName ASC
,        e.BirthDate DESC


-- WITH TIES Добавляет записи к концу окраниченного набора
-- у которого заканчивается Salary(указана в ORDER BY ) на 5000
SELECT TOP 30 WITH TIES e.LName
,                       e.FName
,                       e.salary
FROM employees e
ORDER BY e.salary

-- Данные вставим в другую таблицу
-- которая будет создана на основании набора выборки
SELECT TOP 30 WITH TIES e.LName
,                       e.FName
,                       e.salary
	into employee_salaries
FROM employees e
ORDER BY e.salary
GO
SELECT e.*
FROM employee_salaries e