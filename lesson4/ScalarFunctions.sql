/*********************************************
************-=SCALAR FUNCTIONS=- ***********
*********************************************/
---=1=- Conversion functions
-------------------------------------------------------------------------------------
--CAST или CONVERT -- преобразует выражение одного типа данных в другой
-- числа
SELECT 10/3
,      10./3
,      10/3.
,      CAST(10 as decimal)/3
,      CONVERT(decimal,10)/3
-- даты
select convert (datetime,'20220101 16:39:55.123')

select GETDATE()                             as Unconv_DT
,      cast (GETDATE() as nvarchar(30))      as UsingCast
,      convert(nvarchar(30) , GETDATE(),126) as UsingConvTo_ISO08601

select TRY_CAST('12-02-25022' as date) -- null
,      TRY_convert(date, '12-02-2022 16:45') --2022-02-12

---=2=- Strings functions
--------------------------------------------------------------------------------------------------
--ASCII и UNICODE - коды первого символа в соотв кодировках
select ASCII('Дмитрий')
,      ASCII(N'Дмитрий')
, -- 196 одинаковое с предыдущим значением
       UNICODE('Дмитрий')
,      UNICODE(N'Дмитрий') --1044  одинаковое с предыдущим значением
GO
--CHAR и NCHAR - обратные  для ASCII и UNICODE - коды первого символа в соотв кодировках
select CHAR(196)
, --Д
       NCHAR(1044) --Д
-------------------------------------------------------------------------------------------------
select LEFT('abcdefg',2)  [LEGT]
,      RIGHT('abcdefg',2) [RIGHT]
,      LOWER('ABCDEFG')   [LOWER]
,      UPPER('abcdefg')   [UPPER]
,      LEN('abcdefg')     [LEN]
,      REVERSE('abcdefg') [REVERSE]

select STUFF('abcdef', 3,2,'!!!!')
,--ab!!!!ef
       SUBSTRING('abcdef', 3,4)--cdef

select LTRIM('    bas')
,      RTRIM('bas     ')
,      TRIM('     bas     ')
,      'hello'+SPACE(5)+'world' /*5 пробелов*/
,      REPLICATE('&',7)
,      REPLICATE('bas ',7)

-- CHARINDEX, PATINDEX  - индекс подстроки в строке
select CHARINDEX('bas', 'yo basker bas') /*4*/
,      CHARINDEX('bas', 'yo basker bas', 5) /*11*/
,      PATINDEX('%s_e%', 'yo basker bas') /*6*/

-- REPLACE
select REPLACE('One Two Three Four Two', 'Two', '2!!!') --One 2 Three Four 2

-- CONCAT = конкатенация
select 'bas'+' '+'ket'
,      'bas'+' '+NULL
,      'bas'+' '+ISNULL(null,'')
,      concat('bas',' ','ket')
,      concat('bas',' ', NULL) -- NULL = ''

-- STRING_AGG, STRING_SPLIT  - Server 2016
select STRING_AGG(s.FName,', ')
from Students s /*Basket, Sony, Ice, Hip, Shake, Scope, MunataKOn, MunataKOn, MunataKOn, MunataKOn, MunataKOn*/
GO
select value Students
from string_split('basket|sony|ice|hip|shake|scope|tarzan', '|')


/*
basket
sony
ice
hip
shake
scope
tarzan
*/

-- -=4=- Mathematicals functions
-----------------------------------------------------------------------------------
select SQRT(9)
,--3
       SQUARE(12)
, --144
       POWER(2,3)
,--8
       FLOOR(123.4)
,--123  до наименьшего значения
       FLOOR(123.6)
,--123  до наименьшего значения
       ROUND(123.4, 0)
,--123.0
       ROUND(123.6, 0)
,--124.0
       ROUND(12.4567, 3 )
,--12.4570
       PI()--3.141592

-- -=5=- Date and Times  functions
-----------------------------------------------------------------------------------
SElect GETDATE()
,      CURRENT_TIMESTAMP -- аналоги , вернут текущее время

-- найти сотрудников которые родились в сентябре 1986 года
select *
from Employees e
where DATEPART(MONTH, e.BirthDate )=9
	and DATEPART(year, e.BirthDate)=1986
GO

DECLARE @today date = GETDATE()
SELECT DATENAME(yy, @today)     
 --2022,
       DATENAME(MONTH, @today)  
, --Февраль
       DATENAME(DAY , @today)   
, --Февраль

       DATEPART(MONTH, @today)  
, --2
       DATEPART(QUARTER, @today)
, --1
       DAY(@today)               [DAY]
, --19
       MONTH(@today)             [MONTH]
, --2
       YEAR(@today)              [YEAR] --2022

-- разница между датами
SELECT DATEDIFF(DAY, '20200909', '20220227')
,      DATEDIFF(MONTH, '20200909', '20220227')
,      DATEDIFF(YEAR, '20200909', '20220227')
,      DATEADD(MONTH, -3, GETDATE())
,      DATEADD(MONTH, 3, GETDATE())
,      DATEDIFF(SECOND, '16:25', '16:56')
,      DATEDIFF(MINUTE, '16:46', '16:56')
,      DATEDIFF(Hour, '00:46', '16:56')
,      DATEDIFF(Hour, '00:46', '16:56')

-- все кому за тритцать лет
SELECT Id
,      LName
,      BirthDate
FROM Employees
WHERE DATEDIFF(YEAR, BirthDate, GETDATE()) < 30
-- более точная дата
SELECT Id
,      LName
,      BirthDate
FROM Employees
WHERE BirthDate > DATEADD(YEAR,-30, GETDATE())

--DATEFROMPARTS, DATETIMEFROMPARTS, TIMEFROMPARTS  -- получаем дату либо время из цифр
SELECT DATEFROMPARTS(2022, 02, 19)
, --2022-02-19
       DATETIMEFROMPARTS(2022, 02, 19, 04, 30, 12, 123)
, --2022-02-19 04:30:12.123
       TIMEFROMPARTS(04, 30, 12, 1234567, 7) -- 2022-02-19 04:30:12.123

-- -=6=- Logical function
----CHOOSE - возвращает элемент по указанному индексу из списка значений
SELECT Id
,      LName
,      BirthDate
,      CHOOSE(MONTH(BirthDate), 'Winter','Winter', 'Spring','Spring','Spring','Summer','Summer', 'Summer','Autumn','Autumn','Autumn','Winter')
FROM Employees

-- -7=-. Metadata Functions
----OBJECT_ID и OBJECT_NAME
IF NOT EXISTS(SELECT 1
	FROM sys.tables
	WHERE object_id = OBJECT_ID('Cars'))
BEGIN
	CREATE TABLE Cars ( Id   int IDENTITY
	,                   Name varchar(20) )
END
GO
SELECT OBJECT_ID('Cars')
,      OBJECT_NAME(OBJECT_ID('Cars'))
GO
IF EXISTS(SELECT 1
	FROM sys.tables
	WHERE object_id = OBJECT_ID('Cars'))
BEGIN
	DROP TABLE Cars
END

