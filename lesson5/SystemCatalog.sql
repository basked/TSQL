/*********************************************
**************System Catalog******************
*********************************************/

-- -=1=-. Object Catalog Views
select *
 from sys.objects where parent_object_id>0
 -- ��� ������� 
 SELECT * FROM sys.objects
WHERE type = 'U'
-- ��� ��������
 SELECT * FROM sys.objects
WHERE schema_id =SCHEMA_ID('dbo')
-- �� ���� ��������
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
-- ��� ���� � �������� � ������������� ��
EXEC sp_tables
-- ��� ���� � �������� � ������������� �� ��� dbo
EXEC sp_tables @table_owner= 'dbo'
-- ��� ���� � �������
EXEC sp_help 'students'
-- ��� ���� � �����
EXEC sp_help 'students_pk'

-- ��� ���� � �������� �������
EXEC sp_columns 'students'

-- ��� ���� ��������� ������
EXEC sp_pkeys'students'

-- ��� ���� ��������� ������
EXEC sp_fkeys'students'

-- ��� ���� c �������������
EXEC sp_depends 'students'


-- ��� ���� � ��������
EXEC sp_help 'students'

