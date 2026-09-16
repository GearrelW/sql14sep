

--744,5952
-- Welke producten hebben een prijs die hoger is dan de gemiddelde prijs over alle producten:
SELECT 
	* 
FROM SalesLT.Product 
WHERE ListPrice >		-- subquery in de WHERE
(
	SELECT 
		AVG(ListPrice) 
	FROM SalesLT.Product
);

-- Hoe verhoudt de prijs van elk product zich tot de gemiddelde prijs (over alle producten)
WITH Prijs_Verschillen AS
(
SELECT
	ListPrice
	, (SELECT AVG(ListPrice) FROM SalesLT.Product) AS AverageListPrice
	, (SELECT AVG(ListPrice) FROM SalesLT.Product) - ListPrice AS Verschil
FROM SalesLT.Product
)
SELECT * 
FROM Prijs_Verschillen
WHERE Verschil < -500

-- ---------------------------------

DECLARE @x AS int;
SET @x = 10;


DECLARE @y AS int = 20;

DECLARE @z AS int;

SELECT @z = COUNT(*) FROM SalesLT.Product

PRINT CONCAT_WS(' ', @x, @y, @z)