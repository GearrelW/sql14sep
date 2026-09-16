USE adventureworks;
GO

DROP TABLE IF EXISTS dbo.Klanten;
DROP TABLE IF EXISTS dbo.Medewerkers;

CREATE TABLE dbo.Klanten
(
	id				int IDENTITY
	, email			nvarchar(50)
	, city 			nvarchar(50)
	, postalcode 	nvarchar(25)
	, country 		nvarchar(50)
);

CREATE TABLE dbo.Medewerkers
(
	id				int IDENTITY
	, lastname 		nvarchar(50)
	, city			nvarchar(50)
	, country		nvarchar(40)
);
GO

INSERT INTO dbo.Klanten
VALUES
('a@a.com', 'Amsterdam', '1111', 'Netherlands'),
('b@b.com', 'Barcelona', '2222', 'Spain'),
('c@c.com', 'Coevorden', '3333', 'Netherlands'),
('d@d.com', 'Dublin', '4444', 'Ireland'),
('e@e.com', 'Ede', '5555', 'Netherlands'),
('f@f.com', 'St. Petersburg', '6666', 'USA'),
('g@g.com', 'St. Petersburg', '7777', 'Russia');

INSERT INTO dbo.Medewerkers
VALUES
('de Jong', 'Amsterdam', 'Netherlands'),
('Abdulrahman', 'Amsterdam', 'Netherlands'),
('Harvey', 'Dublin', 'Ireland'),
('José', 'Barcelona', 'Spain'),
('van Puffelen', 'Amsterdam', 'Netherlands'),
('Jeltsin', 'St. Petersburg', 'Russia');
GO


SELECT email, city FROM Klanten
UNION
SELECT lastname, city FROM Medewerkers

SELECT city FROM Klanten
UNION		-- Sorteren + Duplicaten verwijderen
SELECT city FROM Medewerkers

SELECT city FROM Klanten
UNION ALL		-- Sorteren + Duplicaten verwijderen
SELECT city FROM Medewerkers

SELECT city, Country FROM Klanten
UNION		-- Sorteren + Duplicaten verwijderen
SELECT city, Country FROM Medewerkers


-- ------------------------------------------

SELECT city FROM Klanten
INTERSECT
SELECT city FROM Medewerkers



-- DROP TABLE IF EXISTS dbo.Klanten;
-- DROP TABLE IF EXISTS dbo.Medewerkers;
