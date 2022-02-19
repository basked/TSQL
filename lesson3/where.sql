/*********************************************
**************-=WHERE=- *********************
*********************************************/
Use BasDB;
-- ЗП =10000
SELECT   e.*
FROM  employees e
WHERE e.Salary=10000
GO
-- все сотрудники sales
SELECT  e.*
FROM  employees e
WHERE e.Department='sales'

-- дата  рождения не больше  10.09.1986
select *
from Employees e
where e.BirthDate !> '19860910'

-- подразделение sail и ЗП не менее 10000
select *
from Employees e 
where e.Department='sales' and e.Salary!<10000

-- подразделение sail или supply c ЗП>6000
select *
from Employees e
where (e.Department ='sales' or e.Department='supply') and (e.Salary>6000 or e.Salary is NULL)
order by e.Department, e.Salary
 -- все сотрудники подразделеий 'sales','supply','law', 'logistic'
select *
from Employees e
where (e.Department in ('sales','supply','law', 'logistic')) and (e.Salary>6000 or e.Salary is NULL)
order by e.Department, e.Salary
-- сотрудники не больше моего дня рождения но не больше 1986.01.01
select *
from Employees e
--where e.BirthDate!<'19860101' and e.BirthDate !> '19860910' 
--or 
where e.BirthDate between '19860101'and  '19860910' 

--=7=- LIKE 
-- сотрудники с номером телефона на 063
select *
from Employees e
where e.Phone like '063%'

-- вторая цифра в ID =2 
select *
from Employees e
where e.id like '_2'
--первая цифра 2 или 4 вторая цифра в ID=3 c учетом 3
select *
from Employees e
where e.Id=3 or  e.id like '[2,4]3'
--первая цифра с 2 по 5 вторая цифра в ID=3 c учетом 3
select *
from Employees e
where e.Id=3 or  e.id like '[2-5]3'
 --  первая цифра не должны быть с 2 по 5 вторая цифра в ID=3  
select *
from Employees e 
where   e.id like '[^2-5]3'
 

 --8-- NULL
 --все зп с NULL
select *
from Employees e
where e.Salary is null
-- значение с NULL не попадут в выборку
select *
from Employees e
where e.Salary in (4000,7000,null)

-- значение с NULL попадут в выборку
select *
from Employees e
where e.Salary in (4000,7000) or e.Salary is null
