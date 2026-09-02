CREATE OR ALTER PROCEDURE silver.dim_Customer_imporet
AS
BEGIN
INSERT INTO silver.dim_Customer(
  CustomerID ,
  PersonID ,
  StoreID ,
  TerritoryID ,
  AccountNumber ,
  rowguid ,
  ModifiedDate)
SELECT 
[CustomerID],
ISNULL(PersonID,0) AS PersonID,
ISNULL(StoreID,0) AS StoreID,
[TerritoryID],
[AccountNumber],
[rowguid],
[ModifiedDate]
FROM [bronze].[erp_Customer] 
END