1. Wat is de volgorde waarin SQL Server een query uitvoert?

    a. FROM - SELECT - GROUP BY - HAVING - WHERE - ORDER BY  
    b. SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY  
    c. FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY  
    d. FROM - WHERE - SELECT - GROUP BY - HAVING - ORDER BY  

2. Waarvoor wordt het statement **`USE`** gebruikt?

    a. Om een database te verwijderen  
    b. Om een database als actieve database te selecteren  
    c. Om een gebruiker aan te maken  
    d. Om een transactie te starten  

3. Wat doet het statement **`GO`** in SQL Server?

    a. Start een transactie  
    b. Voert een query opnieuw uit  
    c. Markeert het einde van een batch  
    d. Commit automatisch alle wijzigingen  

4. Wat is het resultaat van een **`INNER JOIN`**?

    ```
    SELECT *
    FROM Customers c
    INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    ```

    a. Alle klanten, ook zonder orders  
    b. Alleen records waarvoor in beide tabellen een match bestaat  
    c. Alle orders, ook zonder klant  
    d. Alle mogelijke combinaties van alle records  

5. Wat is het resultaat van een **`LEFT OUTER JOIN`**?

    ```
    SELECT *
    FROM Customers c
    LEFT OUTER JOIN Orders o
    ON c.CustomerID = o.CustomerID;
    ```

    a. Alle klanten, ook zonder orders  
    b. Alleen records waarvoor in beide tabellen een match bestaat  
    c. Alle orders, ook zonder klant  
    d. Alle mogelijke combinaties van alle records  

6. Wat is een **VIEW** in SQL Server?

    a. Een fysieke kopie van een tabel  
    b. Een opgeslagen SELECT-query die zich als een virtuele tabel gedraagt  
    c. Een tabel met partities  
    d. Een tijdelijke tabel

7. Wat is een **TVF** (Table-Valued Function)?

    a. Een functie die één waarde retourneert  
    b. Een functie die een tabel retourneert  
    c. Een procedure die geen resultaat teruggeeft  
    d. Een view met een functie  

8. Wat is de tester die deze **Derived Table** schreef vergeten?

    ```
    SELECT *
    FROM (
        SELECT ProductID, Price
        FROM Products
    ) p;
    ```

9. Wat is een voordeel van een **CTE** (Common Table Expression)?

    ```
    WITH SalesCTE AS
    (
        SELECT
            SalesId
            , Amount * 0.90 AS DiscountedAmount
        FROM Sales
    )
    SELECT
        SalesId
        , Amount
        , Amount - DiscountedAmount AS Discount
    FROM SalesCTE;
    ```

    a. De query wordt permanent opgeslagen  
    b. Het maakt complexe query's beter leesbaar  
    c. Het vervangt altijd een VIEW  
    d. Het creëert automatisch een index  

10. Wat is het verschil tussen **`UNION`** en **`UNION ALL`**?
    a. UNION ALL sorteert automatisch de resultaten  
    b. UNION verwijdert duplicaten, UNION ALL niet  
    c. UNION ALL werkt alleen met identieke tabellen  
    d. UNION ALL is een UNION, EXCEPT en INTERSECT in één  

11. Wat doet `EXCEPT` hier?

    ```
    SELECT CustomerID FROM Customers
    EXCEPT
    SELECT CustomerID FROM Orders;
    ```

    a. Toont alleen waarden die in beide resultaten voorkomen  
    b. Toont waarden uit de eerste query die niet voorkomen in de tweede query  
    c. Toont waarden uit de tweede query die niet voorkomen in de eerste query  
    d. Toont alleen dubbele waarden  

12. Gegeven een tabel **Categorie** en **Product** tabel. Hoe kan ik alle categorieën zonder producten tonen:

    a.
    ```
    SELECT c.Naam
    FROM Categorie c
    LEFT OUTER JOIN Product p
    ON c.CategorieID = p.CategorieID
    WHERE p.ProductID = NULL;
    ```

    b.
    ```
    SELECT c.Naam
    FROM Categorie c
    RIGHT OUTER JOIN Product p
    ON c.CategorieID = p.CategorieID
    WHERE p.ProductID = NULL;
    ```

    c.
    ```
    SELECT c.*
    FROM Categorie c
    LEFT OUTER JOIN Product p
    ON c.CategorieID = p.CategorieID
    WHERE p.ProductID IS NULL;
    ```

    d.
    ```
    SELECT c.Naam
    FROM Categorie c
    RIGHT OUTER JOIN Product p
    ON c.CategorieID = p.CategorieID
    WHERE p.ProductID IS NULL;
    ```

-- ----------------------------------------------------------
-- Korte opdrachten

/* 1. Write a query which retrieves information from the OrderHeader and OrderDetail tables in one result set:

      SalesOrderID  OrderDate                 SalesOrderDetailID  OrderQty    UnitPrice   ProductID
      71774         2008-06-01 00:00:00.000   110562              1           356,8980    836
      71774         2008-06-01 00:00:00.000   110563              1           356,8980    822
      ...           ...                       ...                 ...         ...         ...

      (result: 542 rows) */

/* 2. Use the table Customer. Write a query which retrieves per SalesPerson the number of customers. 
      Use a COUNT(*) and GROUP BY. (result: 9 rows) */

/* 3. How often is each Title used? Write a new query to answer that.
      (result: 5 rows) */

/* 4. How often is each Suffix used? Write a new query.
      (result: 6 rows) */

/* 5. How often is each combination Title, Suffix used? Write a new query.
      (result: 10 rows) */
