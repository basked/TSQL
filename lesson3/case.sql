/*********************************************
*************** -=CASE=- *********************
*********************************************/

-- -=1=- Простой CASE
-- если ЗП Ю= 8000 - это руководитель, если => 5000 - менеджер, остальные - рабочие
select e.FName                                      
,      e.LName                                      
,      e.Salary                                     
,      case when e.salary >=8000  then 'Руководитель' -- если выполянется данное условие - больше ничего не проверяется
            when e.salary >= 5000 then 'Менеджер'
            when e.salary is NULL then 'Unknow'
                                  else 'Рабочий' end SalaryDetail
,      case when e.salary >=8000  then 'Руководитель'
            when e.salary >= 5000 then 'Менеджер'
            when e.salary is NULL then 'Unknow' end  SalaryDetail2
from Employees e
order by SalaryDetail

-- -=2=- Поисковый CASE
select e.id                                                        
,      e.Department                                                
,      e.FName                                                     
,      e.LName                                                     
,      e.Salary                                                    
,      case e.Department when 'PRODUCTION & ENGINEERING' then 100
                         when 'LOGISTICS'                then 25
                         when 'LAW'                      then 15
                                                         else 2 end as [Bonus%]
,      Salary/100*
case e.Department when 'PRODUCTION & ENGINEERING' then 100
                  when 'LOGISTICS'                then 25
                  when 'LAW'                      then 15
                                                  else 2 end           SalaryBonus
,      Salary+ Salary/100*
case e.Department when 'PRODUCTION & ENGINEERING' then 100
                  when 'LOGISTICS'                then 25
                  when 'LAW'                      then 15
                                                  else 2 end           SalaryWithBonus
from Employees e
order by [bonus%]
,        Department
,        Salary

-- -=3=-  IIF
select e.FName                                      
,      e.LName                                      
,      e.Salary  
,  IIF(e.Salary>=6000,'manager', 'worker') as position,
  case  when e.Salary>=6000 then 'manager' else 'worker' end position_case
from Employees e

-- добавим пол в таблицу employee
alter table Employees add gender bit
-- Обновление на основе IIF
update Employees set gender= IIF(id<50,0,1)

-- вывод пола
select e.FName                                      
,      e.LName                                      
,      e.Salary 
, IIF(e.gender=0,'ж','м' )
from Employees e

---=3=- GROUP BY 
select e.Department,IIF(e.gender=0,'ж','м' ) as  gender,count( e.gender) cnt
from Employees e
group by e.Department, e.gender
order by 1,2,3

-- подразделение включающее символ L и с количеством м или ж > 3
select e.Department            
,      IIF(e.gender=0,'ж','м' ) as gender
,      count( e.gender)            cnt
from Employees e
group by e.Department
,        e.gender
having count( e.gender)>3
	and e.Department like '%L%'
order by 1
,        2
,        3


