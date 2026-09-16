SELECT 
	* 
FROM SalesLT.CategoryQtyYear
PIVOT
(
	SUM(Qty)
	FOR OrderYear IN
	([2024],[2025],[2026])
) AS dummy

--SELECT DISTINCT OrderYear FROM SalesLT.CategoryQtyYear


-- Let op een extra overbodig kolom vereist een derived table:
SELECT 
	*
FROM 
(
	SELECT Category, Qty, OrderYear FROM SalesLT.CategoryQtyYearOrderId
) as sandy
PIVOT
(
	SUM(Qty)
	FOR OrderYear IN
	([2024],[2025],[2026])
) AS dummy
