--select statement

select * from DimEmployee order by LastName;


--select statement
select e.EmployeeKey from DimEmployee e order by LastName;

--select statement

SELECT FirstName, LastName, StartDate AS FirstDay  
FROM DimEmployee   
ORDER BY LastName;

--current married employee list
SELECT FirstName, LastName, StartDate AS FirstDay  
FROM DimEmployee   
WHERE EndDate IS NOT NULL   
AND MaritalStatus = 'M'  
ORDER BY LastName;

--calculating gross pay to employee
SELECT FirstName, LastName, BaseRate, BaseRate * 40 AS GrossPay  
FROM DimEmployee  
ORDER BY LastName;

--use of distinct clause
SELECT DISTINCT Title  
FROM DimEmployee  
ORDER BY Title;

--total amount for all sales on each day.

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey;
--the average price and the sum of Internet sales for each day, grouped by order date and the promotion key
SELECT OrderDateKey, PromotionKey, AVG(SalesAmount) AS AvgSales, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey, PromotionKey  
ORDER BY OrderDateKey;


--The following example puts the results into groups after retrieving only the rows with order dates later than August 1, 2002.

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
WHERE OrderDateKey > '20020801'  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey;

--
SELECT SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY (OrderDateKey * 10);

--Using GROUP BY with ORDER BY
SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey; 

--having clause
SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
HAVING OrderDateKey > 20010000  
ORDER BY OrderDateKey;

--with different arguments
select distinct(OrderDateKey) ,count(*) as numbers from FactInternetSales group by OrderDateKey order by numbers desc;

--top
select distinct(OrderDateKey) ,(count(*)) as numbers from FactInternetSales group by OrderDateKey order by numbers desc;

--query
