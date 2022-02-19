/*********************************************
************-=Built-in Functions=- ***********
*********************************************/
---=1=- System functions
declare @myint int;
set @myint='ABC';
go
select @@ERROR; -- вывод последней ошибки
go
declare @myint1 int;
set @myint1=3;
go
select @@ERROR; -- вывод последней ошибки (0 - т.к. нет ошибок)

------------------------------------------------------------------
begin try
declare @myint2 int=1;
set @myint2= @myint2/0;
print @myint2
end try
begin catch
select ERROR_NUMBER()    as ERROR__NUMBER
,      ERROR_SEVERITY()  as ERROR__SEVERITY
,      ERROR_STATE()     as ERROR__STATE
,      ERROR_PROCEDURE() as ERROR__PROCEDURE
,      ERROR_LINE()      as ERROR__LINE
,      ERROR_MESSAGE()   as ERROR__MESSAGE
end catch
------------------------------------------------------------------
-- @@IDENTITY -- последний вставленный ID
-- SCOPE_IDENTITY, IDENT_CURRENT
insert into students values( 'MunataKOn','Мутакон','99999999', 'MuaOn5@M8aKOn.by')
GO
select @@IDENTITY,SCOPE_IDENTITY(),IDENT_CURRENT('students')  --18	18	18
declare  @id  int;
set @id=@@IDENTITY;
-- вставим в дочернюю таблицу сгенерированный ID как внешний ключ
insert into StudentPhones
select '','',@@IDENTITY
-- обновим данные по ключу 
update StudentPhones set FName='MunataKOn' , Phone='99999999' where student_id=@id
GO
------------------------------------------------------------------
-- @@ROWCOUNT -- возвращает кол-во строк, затронух последней инструкцией
update StudentPhones set FName='Munata33KOn' , Phone='99999999' where Phone=''
GO 
select @@ROWCOUNT
delete from  StudentPhones where FName='Munata33KOn' 
GO 
select @@ROWCOUNT
GO
------------------------------------------------------------------
-- @@NEWID --уникальное значение для типа uniqueidentfier
declare @ui  uniqueidentifier
set @ui =  NEWID()
PRINT @ui
select NEWID()

-- @@ISNUMERIC-- возвращает TRUE если число
select ISNUMERIC('33') as [33],
        ISNUMERIC(17)  as [17]  ,
        ISNUMERIC('3abc') as [3abc],
        ISNUMERIC(@ui) as [ui],
        ISNUMERIC('+') as [+], -- отдельный символ это число 
        ISNUMERIC('-') as [-], -- отдельный символ это число 
        ISNUMERIC(NULL) as [NULL]

-- @@ISNULL - если NULL второй аргумент
select e.FName                       
,      e.salary              
,      e.Salary+100           as SalaryWithNULL
,      ISNULL(e.Salary,0)+100 as SalaryWitoutNULL
from Employees e