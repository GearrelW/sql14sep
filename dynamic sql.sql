--SELECT QUOTENAME(category) FROM SalesLT.CategoryQtyYear;

DECLARE @columns AS nvarchar(MAX) = '';

WITH UniekeCategorieen AS
(
    SELECT DISTINCT QUOTENAME(Category) AS CategorieNaam
    FROM SalesLT.CategoryQtyYear
)
SELECT @columns = CONCAT_WS(', ', @columns, CategorieNaam)
FROM UniekeCategorieen;

SET @columns = SUBSTRING(@columns, 2, LEN(@columns) - 1);

DECLARE @sql AS nvarchar(MAX) = 
'
SELECT 
    *
FROM SalesLT.CategoryQtyYear
PIVOT 
(
  SUM(Qty) FOR Category IN 
  (' + @columns + ')
) AS pvt
';

PRINT @sql
EXECUTE(@sql)
