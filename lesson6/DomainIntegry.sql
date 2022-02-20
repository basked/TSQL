/*********************************************
**************Data Integrity******************
*********************************************/

-- -=DOMAIN INTEGRITY=-
USE BasDB
GO
IF OBJECT_ID('Employees') IS NOT NULL
	DROP TABLE Employees;
GO

CREATE TABLE Employees ( Id        int IDENTITY NOT NULL
,                        FName     varchar(50)
,                        LName     varchar(50) CONSTRAINT CK_Employees_LName CHECK (LName LIKE '[A-Z]%'
OR LName LIKE '[А-Я]%')
,                        Phone     char(15) CONSTRAINT CK_Employees_Phone CHECK (Phone LIKE '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
,                        Salary    decimal(10,4)
,                        Bonus     decimal(10,4)
,                        Sex       varchar(6) CHECK (Sex IN ('male', 'female', 'm', 'f'))
,                        StartDate date CONSTRAINT DF_Employees_StartDate DEFAULT GETDATE() );
GO

INSERT INTO Employees
VALUES ( 'Basked', 'Дмитрий', '(800) 123-45-65', 10.5, 10.2, 'm5', '20221009' )

--CHECK
-- Добавить ограничение
ALTER TABLE Employees WITH NOCHECK -- отключение проверки существующих данных в столбце
ADD CONSTRAINT CK_Employees_Bonus -- CONSTRAINT CK_Employees_Bonus  -- можно не указывать
CHECK (Bonus <= Salary*0.1)

-- удалить ограничение
ALTER TABLE Employees
DROP CONSTRAINT CK__Employees__Sex__2CF2ADDF
GO

-- CHECK/NOCHECK - только для ограничений FOREIGN KEY и  CHECK
/* отключить ограничение*/
ALTER TABLE Employees
NOCHECK CONSTRAINT CK_Employees_Bonus
GO
INSERT INTO Employees
VALUES ( 'Bask6ed', 'Дмитрий', '(800) 123-45-65', 10.5, 10.6, 'm5', '20221009' )
GO
ALTER TABLE Employees
CHECK CONSTRAINT CK_Employees_Bonus
INSERT INTO Employees
VALUES ( 'Bask6ed', 'Дмитрий', '(800) 123-45-65', 10.5, 10.6, 'm5', '20221009' )
/*включить ограничение*/


--DEFAULT
-- Добавить по умолчанию 0 для бонуса
ALTER TABLE Employees ADD CONSTRAINT DF_Employye_Bonus DEFAULT 0 FOR bonus;
GO
ALTER TABLE Employees
DROP CONSTRAINT DF_Employye_Bonus
GO