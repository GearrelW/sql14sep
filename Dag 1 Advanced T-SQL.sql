USE AdventureWorks;
GO

-- ANSI T-SQL 91
SELECT 
	soh.OrderDate
	, c.LastName
FROM SalesLt.SalesOrderHeader AS soh
INNER JOIN SalesLT.Customer AS c
ON soh.CustomerID = c.CustomerID;

-- ANSI T-SQL 89 (Marc)
SELECT 
	soh.OrderDate
	, c.LastName
FROM SalesLt.SalesOrderHeader AS soh,
SalesLT.Customer AS c
WHERE soh.CustomerID = c.CustomerID;


SELECT 
	c.LastName
	, a.City
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.CustomerAddress AS ca
ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address AS a
ON ca.AddressID = a.AddressID;

SELECT  
	c.Name AS CategorieNaam
	, p.Name AS ProductNaam
FROM SalesLT.Product AS p
RIGHT OUTER JOIN SalesLT.ProductCategory AS c
ON p.ProductCategoryID = c.ProductCategoryID
WHERE c.Name = 'Snoep';

INSERT INTO SalesLT.ProductCategory
(ParentProductCategoryID, Name)
VALUES
(2, 'Snoep');

-- Oók alle customers die nog GEEN order hebben geplaatst:
SELECT 
	soh.OrderDate
	, c.LastName
FROM SalesLt.SalesOrderHeader AS soh
RIGHT OUTER JOIN SalesLT.Customer AS c	-- 👈 INNER wordt RIGHT OUTER
ON soh.CustomerID = c.CustomerID;

SELECT 
	soh.OrderDate
	, c.LastName
FROM SalesLt.SalesOrderHeader AS soh
RIGHT OUTER JOIN SalesLT.Customer AS c	
ON soh.CustomerID = c.CustomerID
WHERE soh.OrderDate IS NULL;	-- 👈 Enkel customers zonder Order

-- Herschrijven:
SELECT 
	c.LastName
FROM SalesLt.Customer AS c
WHERE c.CustomerID NOT IN
(
	SELECT soh.CustomerID 
	FROM SalesLT.SalesOrderHeader AS soh
);

-- Herschrijven:
SELECT 
	c.LastName
FROM SalesLt.Customer AS c
WHERE NOT EXISTS
(
	SELECT 1
	FROM SalesLT.SalesOrderHeader AS soh
	WHERE soh.CustomerID = c.CustomerID
);

-- -------------------------------------------------

-- Volgorde (6 clauses)

SELECT DISTINCT				-- 👈 Korte syntax
	ProductCategoryID
FROM SalesLT.Product AS p

SELECT  
	p.ProductCategoryID
FROM SalesLT.Product AS p
GROUP BY p.ProductCategoryID	-- 👈 Langere syntax

-- -------------------------------------------------
SELECT  
	p.ProductCategoryID
	, SUM(*) AS aantal		-- Aggregate: COUNT, SUM, MIN, MAX, AVG
FROM SalesLT.Product AS p
GROUP BY p.ProductCategoryID
HAVING SUM(*) > 20
ORDER BY aantal;

GO

CREATE OR ALTER VIEW SalesLT.KorteNamenOrders
AS
SELECT TOP 3
	soh.OrderDate
	, LEFT(c.LastName, 2) AS lastName
FROM SalesLt.SalesOrderHeader AS soh
INNER JOIN SalesLT.Customer AS c
ON soh.CustomerID = c.CustomerID
WHERE LEN(c.LastName) < 5
ORDER BY c.LastName DESC

GO

SELECT * FROM SalesLT.KorteNamenOrders