/*********************************************
*********************-=DLM=- ********************
*********************************************/
/* SELECT, INSERT, UPDATE, DELETE, MERGE*/
---------------------------------------------------------------------------------------
-- INSERT - ВСТАВКА ЗАПИСЕЙ
---------------------------------------------------------------------------------------
INSERT INTO Students ( FName,    LName,        Phone,         Email           )
VALUES               ( 'Basket', N'Мисюля',    '80292813044', 'bas@bas.lm'    )
,                    ( 'Sony',   N'Савко',     '80292553265', 'sony@sony.lm,' )
,                    ( 'Ice',    N'Карницкий', '8033546811',  'ice@ice.lm'    )
,                    ( 'Hip',    N'Поух',      '80445225499', 'hip@hip.lm'    )
GO
INSERT INTO Students
VALUES ( 'Shake', N'Прокопьеф', '80292834545', 'shake@shake.lmc' )
GO
-- для вставки c нужным Id
SET IDENTITY_INSERT students ON;
INSERT INTO Students ( ID, FName,   LName,        Phone,         Email             )
VALUES               ( 6,  'Scope', N'Жолнерчук', '80292836645', 'scope@scope.lmc' )
SET IDENTITY_INSERT students OFF;
GO
--создадим таблицу с телефонами для студентов для последубщей вставки с выборкой
--DROP TABLE StudentPhones
--GO
CREATE TABLE StudentPhones ( id    int identity not null
,                            FName varchar(25)
,                            Phone char(12) )
GO
ALTER TABLE StudentPhones ADD Student_id int;
GO
ALTER TABLE StudentPhones DROP CONSTRAINT student_phone_fk;
GO
ALTER TABLE StudentPhones ADD CONSTRAINT student_phone_fk FOREIGN KEY(Student_id) REFERENCES Students(id) ON DELETE CASCADE;
GO
INSERT INTO StudentPhones
SELECT s.FName
,      s.Phone
,      s.id
FROM Students as s
GO
INSERT INTO Students
VALUES ( 'MUDACON', N'Мудакон', '80292832345', 'mudakon@mudacon.lmc' )
GO


---------------------------------------------------------------------------------------
-- UPDATE - ИЗМЕНЕНИЕ ДАННЫХ
---------------------------------------------------------------------------------------
-- изменим значение в для Sony
UPDATE Students
SET Email = 'sony@sony.lm'
WHERE Email='sony@sony.lm,'
GO
-- именим домен для почты каждого студента
UPDATE Students
SET Email = Email+'c'
WHERE Email like '%.lm'
GO
-- обнулим телефоны
UPDATE StudentPhones
SET Phone = NULL
GO
-- обновим телефоны из таблицы Students
UPDATE StudentPhones
SET Phone = s.Phone
FROM Students      s 
JOIN StudentPhones sp on s.id=sp.student_id
GO
---------------------------------------------------------------------------------------
-- SELECT - ВЫБОРКА ДАННЫХ
---------------------------------------------------------------------------------------
-- все студенты
SELECT *
FROM Students
-- все без  студенты с телефонами
SELECT *
FROM      Students      s 
left join StudentPhones sp on s.id=sp.student_id
where sp.id IS NULL

-- не корректный формат телефона
select *
from StudentPhones
where len(Phone)<>11
GO
---------------------------------------------------------------------------------------
-- DELETE - УДАЛЕНИЕ ДАННЫХ
---------------------------------------------------------------------------------------
-- при удалении ID продолжаются  с последнего

DELETE FROM StudentPhones
WHERE id between 8 and 20
GO
DELETE FROM Students -- удалеят все строки а так же все строки таблицы StudentPhones т.е. ON DELETE CASCADE


---------------------------------------------------------------------------------------
-- TRANCATE - УДАЛЕНИЕ ДАННЫХ (БЫСТРЕЕ  чем DELETE)
---------------------------------------------------------------------------------------
-- при удалении ID начинаются заново
TRUNCATE TABLE Students -- нельзя удалить т.к. существуют всешние ключи
-- перед удалением необходимо удалить внешний ключ
GO
ALTER TABLE StudentPhones DROP CONSTRAINT student_phone_fk;
GO
TRUNCATE TABLE Students
GO
ALTER TABLE StudentPhones ADD CONSTRAINT student_phone_fk FOREIGN KEY(Student_id) REFERENCES Students(id) ON DELETE CASCADE;


---------------------------------------------------------------------------------------
-- OUTPUT  - ВЫВОД ДАННЫХ
---------------------------------------------------------------------------------------
-- При добавлниипопадают в таблицу inderted
INSERT INTO Students
	OUTPUT inserted.id
VALUES ( 'MUDACON', N'Мудакон', '80292832345', 'mudakon@mucohn.lmc' )
-- При обновлении попадают в таблицs inderted и deleted
UPDATE Students
SET FName = 'MUDAKON'
	OUTPUT deleted.id    
	,      deleted.FName  as [старый ник]
	,      inserted.FName as [новый ник]
WHERE UPPER(FName) like 'MUDACON'
-- При удалении попадают в таблицу deleted
GO
DELETE FROM Students
	OUTPUT deleted.*
WHERE UPPER(FName) like 'MUDA%'
GO

-- можно так же поместить в определённую таблицу
CREATE TABLE StudentsPhoneWithotFK ( id    int primary key
,                                    FName varchar(25)
,                                    Phone char(12) )
-- удаляем записи из StudentPhones при этом они всатвляються в StudentsPhoneWithotFK
DELETE FROM Students
	OUTPUT deleted.id
	,      deleted.FName
	,      deleted.Phone
	INTO StudentsPhoneWithotFK
WHERE UPPER(FName) like 'MUDA%'

-- удаение через table variable
DECLARE @deleteTable table ( Id        int
,                            FirstName nvarchar(20)
,                            phone     char(12) );
GO
DELETE FROM StudentsPhoneWithotFK
	OUTPUT deleted.id
	,      deleted.FName
	,      deleted.Phone
	INTO @deleteTable;
GO
SELECT *
FROM @deleteTable
--Id	FirstName	phone
--14	MUDAKON	    80292832345


