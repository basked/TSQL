/*********************************************
**************DDL********************
*********************************************/

/* DDL (CREATE, ALTER, DROP, TRUNCATE TABLE, DISABLE/ENABLE TRIGGER... )*/
--  CREATE ( DATABASE, TABLE, INDEX,TRIGER, PROCEDURE, VIEW..)  Используется для создания новых сущностей
--  ALTER  (DATABASE,TABLE, INDEX,  TRIGER, PROCEDURE, VIEW..)  Используетcя для изменения сущностей
--  DROP (DATABASE, TA BLE, INDEX, TRIGER, PROCEDURE, VIEW..)    Используетcя для удаления  сущностей

-- создаем БД
CREATE DATABASE BasDB
GO
-- смена кодировки на кирилицу
-- CI(CS) - не чувствительна к регистру
-- AS(AI) - дикретические знаки учитываются
ALTER DATABASE BasDB
collate Cyrillic_General_CI_AS
GO
-- удаление БД
--DROP DATABASE BasDB
-- c какой БД работаем
USE BasDB
GO
----------------------------------------------------------------
-- созданм таблицу students 
 CREATE TABLE Student
(
    id int IDENTITY(1,1 ) NOT NULL,
    FName varchar(25),
    LName varchar(25),
    Phone char(12),
    Emain varchar(20)
);
GO
-- изменим поле LName на NOT NULL
ALTER TABLE Student ALTER COLUMN LName VARCHAR(30) NOT NULL
GO
-- добавим поле LName на NOT NULL
ALTER TABLE Student ADD MName VARCHAR(30) NOT NULL
GO
-- удилим поле MName
ALTER TABLE Student DROP COLUMN MName 
GO
-- переименуем столбец 
sp_rename 'Student.Emain' , 'Email', 'COLUMN'
GO
-- переименуем таблицу
sp_rename 'Student' , 'Students'
GO
--созданим первичный ключ 
ALTER TABLE Students ADD CONSTRAINT students_pk PRIMARY KEY(id)
GO
-- созданим уникальный ключ 
ALTER TABLE Students ADD CONSTRAINT students_uk UNIQUE(email)
