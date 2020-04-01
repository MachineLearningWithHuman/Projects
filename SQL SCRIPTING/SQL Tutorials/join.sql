

select * from DimProduct p  inner join DimProductSubcategory  S on  
p.ProductKey=S.ProductCategoryKey inner join DimProductCategory o on
o.ProductCategoryKey=S.ProductCategoryKey

select Distinct(ProductAlternateKey) , (ISNULL(p.ProductSubcategoryKey,0)) from DimProduct p  inner join DimProductSubcategory  S on  
p.ProductKey=S.ProductCategoryKey inner join DimProductCategory o on
o.ProductCategoryKey=S.ProductCategoryKey

