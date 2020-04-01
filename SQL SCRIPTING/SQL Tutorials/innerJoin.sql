--Some information from person table 
select * from Person.Person ;

SELECT PersonType,COUNT(EmailPromotion) FROM
Person.Person WHERE (EmailPromotion) !=0 GROUP BY PersonType 
HAVING  COUNT(EmailPromotion)>100;


--joining tables to see the whole figure
select * from Production.WorkOrder w inner join Production.TransactionHistory t 
on w.ProductID=t.ProductID;


--Query 1
select
w.ProductID,
SUM(w.OrderQty) Qty_ordered,
SUM(w.StockedQty) Qty_stocked,
AVG(w.OrderQty) Qty_Avg,
AVG(w.StockedQty) SQty_Avg
from Production.WorkOrder w inner join Production.TransactionHistory t 
on w.ProductID=t.ProductID
group by w.ProductID
order by Qty_ordered desc;




