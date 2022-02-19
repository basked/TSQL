/*********************************************
************-=Built-in Functions=- ***********
*********************************************/
---=1=- System functions
declare @myint int;
set @myint='ABC';
go
select @@ERROR; -- ����� ��������� ������
go
declare @myint1 int;
set @myint1=3;
go
select @@ERROR; -- ����� ��������� ������ (0 - �.�. ��� ������)

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
-- @@IDENTITY -- ��������� ����������� ID
-- SCOPE_IDENTITY, IDENT_CURRENT
insert into students values( 'MunataKOn','�������','99999999', 'MuaOn5@M8aKOn.by')
GO
select @@IDENTITY,SCOPE_IDENTITY(),IDENT_CURRENT('students')  --18	18	18
declare  @id  int;
set @id=@@IDENTITY;
-- ������� � �������� ������� ��������������� ID ��� ������� ����
insert into StudentPhones
select '','',@@IDENTITY
-- ������� ������ �� ����� 
update StudentPhones set FName='MunataKOn' , Phone='99999999' where student_id=@id
GO
------------------------------------------------------------------
-- @@ROWCOUNT -- ���������� ���-�� �����, �������� ��������� �����������
update StudentPhones set FName='Munata33KOn' , Phone='99999999' where Phone=''
GO 
select @@ROWCOUNT
delete from  StudentPhones where FName='Munata33KOn' 
GO 
select @@ROWCOUNT
GO
------------------------------------------------------------------
-- @@NEWID --���������� �������� ��� ���� uniqueidentfier
declare @ui  uniqueidentifier
set @ui =  NEWID()
PRINT @ui
select NEWID()

-- @@ISNUMERIC-- ���������� TRUE ���� �����
select ISNUMERIC('33') as [33],
        ISNUMERIC(17)  as [17]  ,
        ISNUMERIC('3abc') as [3abc],
        ISNUMERIC(@ui) as [ui],
        ISNUMERIC('+') as [+], -- ��������� ������ ��� ����� 
        ISNUMERIC('-') as [-], -- ��������� ������ ��� ����� 
        ISNUMERIC(NULL) as [NULL]

-- @@ISNULL - ���� NULL ������ ��������
select e.FName                       
,      e.salary              
,      e.Salary+100           as SalaryWithNULL
,      ISNULL(e.Salary,0)+100 as SalaryWitoutNULL
from Employees e