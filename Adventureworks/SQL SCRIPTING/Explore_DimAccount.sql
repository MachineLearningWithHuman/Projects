
--visualizing the whole table at a glance
select * from dbo.DimAccount; --99 records

--select different ValueTypes
select Distinct(ValueType) from dbo.DimAccount;

select * from dbo.DimAccount where ValueType='Unit';