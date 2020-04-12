use AdventureWorks2016;
GO

--Joins
--Query1
SELECT 
pv.ProductID,pv.BusinessEntityID,v.Name
FROM Purchasing.ProductVendor pv JOIN Purchasing.Vendor v
ON pv.BusinessEntityID = v.BusinessEntityID
WHERE pv.StandardPrice > $10 AND Name LIKE N'F%'
Go

--Doing the same with no join
SELECT
pv.ProductID,pv.BusinessEntityID,v.Name
FROM Purchasing.ProductVendor pv , Purchasing.Vendor v
WHERE pv.BusinessEntityID = v.BusinessEntityID AND
pv.StandardPrice > $10 AND Name LIKE N'F%'

--LOOP JOIN
DELETE FROM Sales.SalesPersonQuotaHistory
FROM Sales.SalesPersonQuotaHistory AS spqh
INNER LOOP JOIN Sales.SalesPerson sp 
on spqh.BusinessEntityID = sp.BusinessEntityID
WHERE sp.SalesYTD > 2500000.00

select * from Sales.SalesPersonQuotaHistory;

--MERGE JOIN
SELECT poh.PurchaseOrderID, poh.OrderDate , pod.ProductID , pod.DueDate , pod.OrderQty
FROM Purchasing.PurchaseOrderDetail AS pod
INNER MERGE JOIN Purchasing.PurchaseOrderHeader poh
ON pod.PurchaseOrderID = poh.PurchaseOrderID;




