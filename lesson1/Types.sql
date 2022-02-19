/*****
**************TYPES IN SQL********************
*****/

-- -=1=-Точные числовые типы
declare @bigint bigint; -- 8 байт     -9_223_372_036_854_775_808..9_223_372_036_854_775_807
declare @int int; -- 4 байта    -2_147_483_684..2_147_483_683
declare @smallint smallint; -- 2 байта    -32_768..32_767
declare @tinyint tinyint; -- 1 байт     0 .. 255
declare @bit bit=0; -- 1 байт     0..1
declare @money money; -- 8 байт     -922_377_203_685_477.5808..+922_377_203_685_477.5807
declare @smallmoney smallmoney; -- 4 байт     -214_748,3648 .. +214_748.3647
declare @decimal decimal(5,4); --            -10^38+1..10^38-1
-- идентичен
declare @numeric numeric(5,4); --           -10^38+1..10^38-1
--------------------------
--|Точность| Объем памяти|
-------------------------|
--|1 - 9   |  5          |
--|10-19   |  9			 |
--|20-28   |  13		 |
--|29-38   |  17		 |
--------------------------


-- -=2=- Приблизительные числовые типы
declare @float float(5); -- -1.79E + 308..1.79E + 308
declare @real real; -- -3.40E + 38 ..3.40E + 38
------------------------------------------|
--|N     |Значение  |Точность Объем памяти|
----------------------------------------- |
--|1-24  |7 знаков  |4 байт               |
--|25-53 |15 знаков |8 байт               |
----------------------------------------- |

-- -=3=- Типы данных даты и времени


declare @datetime datetime ; -- (точность – 3,33 миллисекунд)
declare @smalldatetime smalldatetime;
declare @date date;
declare @datetimeoffset datetimeoffset(7);
declare @datetime2 datetime2(7);
declare @time time(7);

/*
N –  задает число знаков для долей секунды. Может быть целым числом от 0 до 7. Точность долей
секунды по умолчанию равна 7 (100 нс). Миллисекундам может предшествовать либо двоеточие
(:), либо точка (.). Число после двоеточия обозначает тысячные доли секунды. При использовании
точки однозначное число обозначает десятые доли секунды, двузначное число – сотые, а
трехзначное – тысячные доли секунды.
*/


-- -=4=-  Символьные строки
declare @char char;
declare @varchar varchar;
--declare @text text;

/*
При помощи числа N, мы можем указать максимально возможную длину строки
(максимальное значение N – 8000). Позволяет хранить строки в формате ASCII, где
один символ занимает 1 байт.
*/


-- -=5=-  Символьные строки в UNICODE
declare @nchar nchar;
declare @nvarchar nvarchar;
--declare @ntext ntext;

/*
При помощи числа N, мы можем указать максимально возможную длину строки
(максимальное значение N – 8000). Позволяет хранить строки в формате ASCII, где
один символ занимает 1 байт.
*/


-- -=6=- Двоичные данные
declare @binary binary;
declare @varbinary varbinary;
--declare @image image;


-- -=7=- Прочие типы данных
--sql_variant, rowversion, uniqueidentifier, xml, cursor, table, hierarchyid, Пространственные типы(geography,geometry )


/*----------WORK----------*/


--Data Types
----BIT
DECLARE @someBit bit = 0 --объявление и инициализация переменной типа bit
PRINT @someBit

SET @someBit = 123
PRINT @someBit

----INTEGER
DECLARE @someInt int = 123 --объявление и инициализация переменной типа bit
PRINT @someInt
begin try
SET @someInt = 2147483647 + 1
PRINT @someInt
end try
begin catch
PRINT 'Ошибка переполнения'
end catch


----DECIMAL (NUMERIC)
DECLARE @someDecimal1 decimal = 123.56 --значения по умолчанию (18, 0)
PRINT @someDecimal1

DECLARE @someDecimal2 decimal(8,4) = 123.56
PRINT @someDecimal2


SET @someDecimal2 = 123.123456 -- округление
PRINT @someDecimal2

SET @someDecimal2 = 12345.56 -- ошибка
PRINT @someDecimal2

DECLARE @someDecimal22 decimal(7,4) = 998.565445
set @someDecimal22=@someDecimal22+1
PRINT @someDecimal22


----DATE

DECLARE @somed date = '30.12.2022' -- '30-12-2022', '30/12/2022, '
PRINT @somed --2022-12-30

DECLARE  @somed1 date = ' 20221230'
PRINT @somed1 --2022-12-30

DECLARE @someDate date
PRINT @someDate

SET @someDate = '2017-12-17'
PRINT @someDate

SET @someDate = '20170117'
PRINT @someDate

SET @someDate = '17-01-2017'
PRINT @someDate



----DATETIME

DECLARE @dt datetime = '31-12/2022 00:00:00' -- 31-12/2022 00:00:00, 31/12.2022 00:00:00
SET @dt = '27.02/2022'
PRINT @dt

DECLARE @someDateTime datetime = '01-12-2017 03:36:49'
PRINT @someDateTime

SET @someDateTime = '20170117 03:36:49:554'
PRINT @someDateTime

----TIME
DECLARE @someTime time = '03:36:49:1' 
PRINT @someTime --03:36:49.0010000
SET @someTime='03:36:49.1'
PRINT @someTime --03:36:49.1000000

SET @someTime='12:00:00 AM'
PRINT @someTime --00:00:00.0000000

SET @someTime='24:00:00 AM'
PRINT @someTime --error

SET @someTime = '03:36:49.123456'
PRINT @someTime --03:36:49.1234560

SET @someTime = '03:36:49.1234567'
PRINT @someTime  -- округление 03:36:49.1234567


----NCHAR
DECLARE @someNChar nchar = N'какой-то текст'
PRINT @someNChar + cast(len(@someNChar) as nchar)  -- к1   // по умолчанию длина строки nchar = 1 символ 

DECLARE @someNChar1 nchar(15) = N'какой-то текст'
PRINT   @someNChar1 + cast(len(@someNChar1) as nchar) -- какой-то текст 14   

 SET @someNChar1 ='текст'
 PRINT   @someNChar1 + cast(len(@someNChar1) as nchar) -- текст          5       


----NVARCHAR
DECLARE @someNVarChar nvarchar(15) = N'какой-то текст'
PRINT @someNVarChar

--Arithmetic operators
--приоритет типов данных https://msdn.microsoft.com/library/ms190309(SQL.130).aspx

---- оператор + (сложение)

DECLARE @x int = 123
DECLARE @y int = 456
SELECT @x + @y     -- выборка из неоткуда
DECLARE @x1 int = 123, @y1 int = 456
SELECT @x1 + @y1

DECLARE
@x2 int = 1,
@y2 int = 2,
@z2 int = 3
SELECT @x2 + @y2 * @z2

DECLARE @date1 datetime = '20220117 12:00 AM'
SELECT @date1 + 1.25 --2022-01-18 18:00:00.000 добавили к дате 1 день и 6 часов (24/0.25)
PRINT @date1
SELECT @date1 + 1.5
print @date1 

SELECT 'Hello, ' + 'world!' --конкатенация

---- ќператор - (вычитание)
---- ќператор * (умножение)
---- ќператор / (деление)

SELECT 10/3  --3
,      17/10 --1
,      10./3 --3.333333
,      10/3. --3.333333

SELECT 1/0 -- Divide by zero error encountered.

---- ќператор % (остаток от деления)

SELECT 7/5
,      7%5