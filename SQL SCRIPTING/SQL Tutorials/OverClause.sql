--Number
DECLARE @Myproduct int;
SET @Myproduct = 750;
IF @Myproduct<> 0
SELECT * From Production.Product where ProductID>@Myproduct;

--OVER clause
SELECT ROW_NUMBER() OVER(PARTITION BY PostalCode ORDER BY SalesYTD DESC) AS 'Row Number',p.LastName,s.SalesYTD,a.PostalCode
FROM Sales.SalesPerson s INNER JOIN Person.Person p on s.BusinessEntityID = p.BusinessEntityID
INNER JOIN Person.Address a on a.AddressID = p.BusinessEntityID
WHERE TerritoryID IS NOT NULL AND SalesYTD <> 0 
ORDER BY PostalCode;

--over clause with aggregate function

SELECT SalesOrderID, ProductID , OrderQty
,SUM(OrderQty) OVER(PARTITION BY SalesOrderID) AS Total,
AVG(OrderQty) OVER(PARTITION BY SalesOrderID) AS "Avg",
COUNT(OrderQty) OVER(PARTITION BY SalesOrderID) AS Number,
MIN(OrderQty) OVER(PARTITION BY SalesOrderID) AS MIni,
MAX(OrderQty) OVER(PARTITION BY SalesOrderID) AS Maxi
FROM Sales.SalesOrderDetail    --summary statistics for product and salesorder id

--
SELECT SalesOrderID, ProductID , OrderQty,
SUM(OrderQty) OVER(PARTITION BY SalesOrderID) AS Total,
CAST(OrderQty*1.0 / SUM(OrderQty) OVER(PARTITION BY SalesOrderID) * 100 AS
DECIMAL(5,2)) "percent by product ID"
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659,43664); --1.0 TO MAKE FLOAT DIVISION


--MOVING AVG AND CUMULATIVE TOTAL

SELECT BusinessEntityID,TerritoryID,
DATEPART(yy,ModifiedDate) AS SalesYear,
CONVERT(VARCHAR(20),AVG(SalesYTD) OVER (PARTITION BY TerritoryID ORDER BY DATEPART(yy,ModifiedDate)),1) MovingAvg,
CONVERT(varchar(20),SUM(SalesYTD) OVER (PARTITION BY TerritoryID ORDER BY DATEPART(yy,ModifiedDate)),1) CumulativeSum
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL OR TerritoryID < 5
ORDER BY TerritoryID;

--over clause
SELECT BusinessEntityID,TerritoryID,
DATEPART(yy,ModifiedDate) AS SalesYear,
CONVERT(varchar(20),SalesYTD,1) SalesYTD,
CONVERT(VARCHAR(20),AVG(SalesYTD) OVER (PARTITION BY SalesYTD ORDER BY DATEPART(yy,ModifiedDate)),1) MovingAvg,
CONVERT(VARCHAR(20),SUM(SalesYTD) OVER (PARTITION BY SalesYTD ORDER BY DATEPART(yy,ModifiedDate)),1) CumulativeSum
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL OR TerritoryID < 5
ORDER BY SalesYear;


SELECT BusinessEntityID,TerritoryID,
DATEPART(yy,ModifiedDate) AS SalesYear,
CONVERT(varchar(20),SalesYTD,1) SalesYTD,
CONVERT(VARCHAR(20),AVG(SalesYTD) OVER (PARTITION BY TerritoryID ORDER BY DATEPART(yy,ModifiedDate) ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING),1) MovingAvg
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL OR TerritoryID < 5
ORDER BY SalesYear;



SELECT BusinessEntityID,TerritoryID,
DATEPART(yy,ModifiedDate) AS SalesYear,
CONVERT(varchar(20),SalesYTD,1) SalesYTD,
CONVERT(VARCHAR(20),AVG(SalesYTD) OVER (PARTITION BY TerritoryID ORDER BY DATEPART(yy,ModifiedDate) ROWS UNBOUNDED PRECEDING),1) MovingAvg
FROM Sales.SalesPerson
WHERE TerritoryID IS NULL OR TerritoryID < 5
ORDER BY SalesYear;

USE AdventureWorksDW2017;
GO

SELECT ROW_NUMBER() OVER(ORDER BY SUM(SalesAmountQuota) DESC) AS RowNumber ,
FirstName, LastName
FROM dbo.DimEmployee e INNER JOIN 
dbo.FactSalesQuota sq
ON e.EmployeeKey = sq.EmployeeKey
WHERE e.SalesPersonFlag =1
GROUP BY FirstName,LastName
