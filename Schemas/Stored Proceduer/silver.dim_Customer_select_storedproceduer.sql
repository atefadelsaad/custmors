
CREATE OR ALTER PROCEDURE silver.dim_Customer_select
AS
BEGIN
      SELECT
            CustomerID,
            PersonID,
            StoreID,
            TerritoryID,
            AccountNumber,
            rowguid,
            ModifiedDate
      FROM silver.dim_Customer
END
