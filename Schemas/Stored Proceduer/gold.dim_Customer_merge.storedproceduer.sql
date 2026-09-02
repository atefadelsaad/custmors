
CREATE OR ALTER PROCEDURE gold.dim_Customer_merge
AS
BEGIN
      MERGE gold.dim_Customer AS target
      USING silver.dim_Customer AS source
         ON target.CustomerID = source.CustomerID
      WHEN MATCHED AND(
          target.PersonID <> source.PersonID
      OR  target.StoreID <> source.StoreID
      OR  target.TerritoryID <> source.TerritoryID
      OR  target.AccountNumber <> source.AccountNumber
      OR  target.rowguid <> source.rowguid
      OR  target.ModifiedDate <> source.ModifiedDate   
       )

      THEN  UPDATE SET

          target.PersonID = source.PersonID,
          target.StoreID = source.StoreID,
          target.TerritoryID = source.TerritoryID,
          target.AccountNumber = source.AccountNumber,
          target.rowguid = source.rowguid,
          target.ModifiedDate = source.ModifiedDate ,
          target.last_update = GETDATE()
      WHEN NOT MATCHED BY target
      THEN
          INSERT(CustomerID,PersonID,StoreID,TerritoryID,AccountNumber,rowguid,ModifiedDate,last_update)
          VALUES(source.CustomerID,source.PersonID,source.StoreID,source.TerritoryID,source.AccountNumber,source.rowguid,source.ModifiedDate,GETDATE());

END