/*********************************************
**************System Catalog******************
*********************************************/

-- -=1=-. Object Catalog Views
select *
 from sys.objects where parent_object_id>0
 -- все таблицы 
 SELECT * FROM sys.objects
WHERE type = 'U'
-- все сощности
 SELECT * FROM sys.objects
WHERE schema_id =SCHEMA_ID('dbo')
-- по всем объектвм
SELECT * FROM sys.tables
 
create view v_students as select * from Students ;

SELECT * FROM sys.views

SELECT * FROM sys.triggers

SELECT * FROM sys.procedures

/*
From https://msdn.microsoft.com/en-us/library/ms190324.aspx:
 FN SQL_SCALAR_FUNCTION
 FS Assembly (CLR) scalar-function
 FT Assembly (CLR) table-valued function
 IF SQL_INLINE_TABLE_VALUED_FUNCTION
 TF SQL_TABLE_VALUED_FUNCTION
*/
SELECT * FROM sys.objects
WHERE type IN ('FN', 'IF', 'TF', 'FS', 'FT') ;

EXEC sp_help
-- вся инфа о таблицах и представлений БД
EXEC sp_tables
-- вся инфа о таблицах и представлений БД для dbo
EXEC sp_tables @table_owner= 'dbo'
-- вся инфа о таблице
EXEC sp_help 'students'
-- вся инфа о ключе
EXEC sp_help 'students_pk'

-- вся инфа о колонках таблицы
EXEC sp_columns 'students'

-- вся инфа первичных ключах
EXEC sp_pkeys'students'

-- вся инфа первичных ключах
EXEC sp_fkeys'students'

-- вся инфа c зависимостями
EXEC sp_depends 'students'


-- вся инфа о колонках
EXEC sp_help 'students'

