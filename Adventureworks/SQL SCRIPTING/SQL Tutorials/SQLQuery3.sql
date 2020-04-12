use AdventureWorksDW2017;
Go

CREATE VIEW log_view
CREATE DATABASE TestData  
GO  

Use TestData;
Go

CREATE TABLE dbo.Products  
   (ProductID int PRIMARY KEY NOT NULL,  
   ProductName varchar(25) NOT NULL,  
   Price money NULL,  
   ProductDescription varchar(max) NULL)  
GO

-- Standard syntax  
INSERT dbo.Products (ProductID, ProductName, Price, ProductDescription)  
    VALUES (1, 'Clamp', 12.48, 'Workbench clamp')  
GO 

-- Changing the order of the columns  
INSERT dbo.Products  
    VALUES (75, 'Tire Bar', NULL, 'Tool for changing tires.')  
GO