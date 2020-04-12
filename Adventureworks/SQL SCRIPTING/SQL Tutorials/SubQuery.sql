--Examples Of Using Subquery

SELECT Ord.SalesOrderID,Ord.OrderDate,
(SELECT MAX(OrdDet.UnitPrice) FROM Sales.SalesOrderDetail AS OrdDet) AS MaxUnitPrice
FROM Sales.SalesOrderHeader AS Ord;

--
SELECT Name
FROM Production.Product Where ListPrice =
(SELECT ListPrice FROM Production.Product Where Name = 'Chainring Bolts' );

--
SELECT prod1.Name
from Production.Product as prod1 inner join Production.Product as prod2 
on prod2.ListPrice = prod1.ListPrice where prod2.Name = 'Chainring Bolts'

--
SELECT Name
FROM Sales.Store
where BusinessEntityID NOT IN (select CustomerID from Sales.Customer where TerritoryID=5)

SELECT Name
FROM Sales.Store
where Sales.Store.BusinessEntityID not in 
(select Sales.Customer.CustomerID from Sales.Customer where TerritoryID = 5);


select CONCAT(LastName,' ',FirstName) 'Full Name' from Person.Person where BusinessEntityID in
(select BusinessEntityID from HumanResources.Employee
where BusinessEntityID IN
(select BusinessEntityID from Sales.SalesPerson))

--same thing with join
select CONCAT(LastName,' ',FirstName) 'Full Name' from Person.Person p inner join
HumanResources.Employee h on p.BusinessEntityID=h.BusinessEntityID inner join Sales.SalesPerson s on h.BusinessEntityID
= s.BusinessEntityID


---CorelatedQuery
SELECT DISTINCT c.LastName, c.FirstName,e.BusinessEntityID
FROM Person.Person c JOIN HumanResources.Employee AS e
ON c.BusinessEntityID = e.BusinessEntityID
WHERE 5000.00 IN
(SELECT Bonus
    FROM Sales.SalesPerson sp 
	where e.BusinessEntityID=sp.BusinessEntityID
)

SELECT * FROM Person.Address WHERE
AddressID IN (SELECT AddressID
FROM Person.Address WHERE StateProvinceID=39) 




