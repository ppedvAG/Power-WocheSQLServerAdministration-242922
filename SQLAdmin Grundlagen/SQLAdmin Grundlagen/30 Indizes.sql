CREATE INDEX ixNachname
ON tblAutor(Nachname);

CREATE INDEX ixKontoNrBLZ
ON tblAutor (KontoNr, BLZ);

CREATE UNIQUE NONCLUSTERED INDEX ixTitel
ON tblBuch (Titel);

CREATE INDEX ixBank
ON tblBank(Bank)
WITH
PAD_INDEX=ON,
FILLFACTOR = 40;

EXECUTE sp_helpindex 'tblAutor';

SELECT database_id, object_id, index_id,index_type_desc,
avg_fragmentation_in_percent,
avg_page_space_used_in_percent
FROM sys.dm_db_index_physical_stats
(DB_ID(),OBJECT_ID('tblAutor'), NULL, NULL, NULL);

CREATE INDEX ixBank
ON tblBank(Bank)
WITH
(
PAD_INDEX = ON,
FILLFACTOR = 70,
DROP_EXISTING = ON
);

DROP INDEX tblBank.ixBank;

SELECT * FROM tblAutor
WHERE Vorname = 'Dirk';

DROP STATISTICS tblAutor._WA_Sys_00000002_7D78A4E7;

UPDATE STATISTICS tblAutor;

DBCC SHOW_STATISTICS (tblAutor, ixNachname);

SELECT TerritoryID, CustomerType
FROM Sales.Customer
WHERE AccountNumber = 'AW00024000';

CREATE INDEX ixAccountNumber
ON Sales.Customer (AccountNumber)
INCLUDE (TerritoryID, CustomerType);

USE AdventureWorks;
GO
CREATE NONCLUSTERED INDEX ixProductBlack
ON Production.Product(Name)
WHERE Color='Black';

CREATE VIEW vwProduct
WITH SCHEMABINDING
AS
SELECT Name, ProductNumber, StandardCost, ListPrice
FROM Production.Product;

CREATE UNIQUE CLUSTERED INDEX ixProduct
ON vwProduct (ProductNumber);