--Advance Query
select
CustomerID,
SalesOrderID,
OrderDate,
TotalDue,
sum(TotalDue) OVER (ORDER BY SalesOrderID) RunningTotal --Agregated total
from Sales.SalesOrderHeader
order by SalesOrderID

SET STATISTICS IO ON
select
CustomerID,
SalesOrderID,
OrderDate,
TotalDue,
sum(TotalDue) OVER (ORDER BY SalesOrderID) RunningTotal --Agregated total
from Sales.SalesOrderHeader
order by SalesOrderID

SET STATISTICS IO ON
select
CustomerID,
SalesOrderID,
OrderDate,
TotalDue,
sum(TotalDue) OVER (ORDER BY SalesOrderID ROWS UNBOUNDED PRECEDING) RunningTotal --Agregated total
from Sales.SalesOrderHeader
order by SalesOrderID --FORCED INTO MEMORY IMPROVED PERFORMENCE

SET STATISTICS IO ON
select
CustomerID,
SalesOrderID,
OrderDate,
TotalDue,
sum(TotalDue) OVER (ORDER BY SalesOrderID RANGE UNBOUNDED PRECEDING) RunningTotal --Agregated total
from Sales.SalesOrderHeader
order by SalesOrderID --NOT FORCED INTO MEMORY


SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID) TotalDue 
FROM  Purchasing.PurchaseOrderDetail

--same for 2 and 3 no row see and so on 
SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS UNBOUNDED PRECEDING) TotalDue 
FROM  Purchasing.PurchaseOrderDetail

--not same as you can see by running

SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) TotalDue 
FROM  Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID

--RANGE DUPLICATE VALUE ROW IN MEMORY NON DUPLICATE VALUE COUNT

SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) TMovingAvg3 
FROM  Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID


--You can change the result according to your need
SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) MovingAvg22 
FROM  Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID


SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) MovingSum,
AVG(LineTotal) OVER ( ORDER BY PURCHASEORDERID
ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) MovingAvg
FROM  Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID

--
SELECT
PurchaseOrderID,
PurchaseOrderDetailID,
ProductID,
LineTotal,
SUM(LineTotal) OVER (PARTITION BY purchaseorderid ORDER BY LineTotal) Running_range,
SUM(LineTotal) OVER (PARTITION BY purchaseorderid ORDER BY LineTotal
ROWS UNBOUNDED PRECEDING) Running_rows
FROM  Purchasing.PurchaseOrderDetail
ORDER BY PurchaseOrderID



