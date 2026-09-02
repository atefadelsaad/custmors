
CREATE OR ALTER PROCEDURE silver.dim_Customer_cleanup
AS
BEGIN 
      TRUNCATE TABLE silver.dim_Customer
END