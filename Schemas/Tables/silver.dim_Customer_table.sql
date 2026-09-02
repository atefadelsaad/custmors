DROP TABLE IF EXISTS silver.dim_Customer
CREATE TABLE silver.dim_Customer(
  CustomerID INT NOT NULL PRIMARY KEY,
  PersonID INT NOT NULL,
  StoreID INT NOT NULL,
  TerritoryID INT NOT NULL,
  AccountNumber NVARCHAR(20) NOT NULL ,
  rowguid NVARCHAR(150) NOT NULL,
  ModifiedDate DATETIME NOT NULL
)