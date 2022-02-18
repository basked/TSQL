/*****
**************TYPES IN SQL********************
*****/

-- ������ �������� ����

declare @bigint bigint;         -- 8 ����    -9_223_372_036_854_775_808..9_223_372_036_854_775_807
declare @int int;               -- 4 �����   -2_147_483_684..2_147_483_683
declare @smallint smallint;     -- 2 �����   -32_768..32_767
declare @tinyint tinyint;       -- 1 ����     0 .. 255
declare @bit     bit;           -- 1 ����     0..1             
declare @money money;           --           -922_377_203_685_477.5808..+922_377_203_685_477.5807
declare @smallmoney smallmoney; --           -214_748,3648 .. +214_748.3647
declare @decimal decimal(5,4);  --           -10^38+1..10^38-1
-- ��������� 
declare @numeric numeric(5,4);  --           -10^38+1..10^38-1



