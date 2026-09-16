DECLaRE @City AS nvarchar(30);

SET @city = 'LONDON';		-- Mo, deze waarde!!

SELECT
	--GETDATE() + DB_NAME() AS metadata		-- SQL Server probeert van de tekst 'adventureworks' een datum te maken, dat lukt niet
	--CAST(GETDATE() AS nvarchar) + ' ' + DB_NAME() + ' ' + SYSTEM_USER AS metadata	
	--CONCAT(GETDATE(), ' ', DB_NAME(), ' ', SYSTEM_USER) AS metadata	
	CONCAT_WS(', ', GETDATE(), DB_NAME(), SYSTEM_USER) AS metadata	
	, c.LastName
	, a.City
FROM SalesLT.Address AS a
INNER JOIN SalesLT.CustomerAddress AS ca
ON a.AddressID = ca.AddressID
INNER JOIN SalesLT.Customer AS c
ON ca.CustomerID = c.CustomerID
WHERE a.City = @city;

UPDATE SalesLT.Customer 
SET LastName = 'Mañana' 
WHERE LastName = 'Diaz'

SELECT 
* 
FROM SalesLT.Customer 
WHERE LastName = 'Manana'
COLLATE SQL_Latin1_General_CP1_CI_AI

-- ------------------------------------------

GO

CREATE OR ALTER PROCEDURE SalesLT.KlantenPerPlaats
	@city AS nvarchar(30)
	, @aantal AS int OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF (LEN(@city) < 3)
	BEGIN;		-- BEGIN / END bij meer dan 1 regel
		--PRINT 'Plaatsnaam moet tenminste 3 tekens zijn';
	
		THROW 50001, 'Plaatsnaam moet tenminste 3 tekens zijn', 1;
	END;

	SELECT
		c.LastName
		, a.City
	FROM SalesLT.Address AS a
	INNER JOIN SalesLT.CustomerAddress AS ca
	ON a.AddressID = ca.AddressID
	INNER JOIN SalesLT.Customer AS c
	ON ca.CustomerID = c.CustomerID
	WHERE a.City = @city;

	SELECT
		@aantal = COUNT(*)
	FROM SalesLT.Address AS a
	INNER JOIN SalesLT.CustomerAddress AS ca
	ON a.AddressID = ca.AddressID
	INNER JOIN SalesLT.Customer AS c
	ON ca.CustomerID = c.CustomerID
	WHERE a.City = @city;

	INSERT INTO VecozoAudit
	(DatumTijd, Gebruiker)
	VALUES
	(SYSDATETIME(), SYSTEM_USER);
END;

GO

-- ----------------------
-- 🥸 Ik ben de gebruiker, consumer van de stored procedure

DECLARE @mijnAantal AS int;

EXEC SalesLT.KlantenPerPlaats @city = 'Toronto', @aantal = @mijnAantal OUT

PRINT CONCAT('Kijk nu eens: ', @mijnAantal);

-- --------------------------------------
-- TRY-CATCH
GO

BEGIN TRY
	DECLARE @mijnAantal AS int;

	EXEC SalesLT.KlantenPerPlaats @city = 'T', @aantal = @mijnAantal OUT

	PRINT CONCAT('Kijk nu eens: ', @mijnAantal);
END TRY
BEGIN CATCH
	--PRINT 'Something went horribly wrong';
	PRINT CONCAT_WS(' ', ERROR_MESSAGE(), ERROR_NUMBER());
	THROW;
END CATCH

-- -----------------------------------------------

CREATE TABLE VecozoAudit
(
	Id			int IDENTITY,
	DatumTijd	datetime2(0),
	Gebruiker	nvarchar(50),
);

INSERT INTO VecozoAudit
(DatumTijd, Gebruiker)
VALUES
(SYSDATETIME(), SYSTEM_USER);

