-- BRONZE (Synonyms)
SELECT * FROM bronze.erp_Customer;
SELECT * FROM bronze.erp_product;
SELECT * FROM bronze.erp_Password;
SELECT * FROM bronze.erp_SalesOrderHeader;
SELECT * FROM bronze.erp_SalesOrderbetail;
SELECT * FROM bronze.Address;
SELECT * FROM bronze.erp_ProductCategory;

-- SILVER CLEANUP
EXEC silver.dim_Customer_cleanup;
EXEC silver.cleanup_product;
EXEC silver.cleanup_addres;
EXEC silver.cleanup_password;
EXEC silver.fac_sales_order_header_customer_cleanup;
EXEC silver.sales_order_detail_cleanup;
EXEC silver.dim_ProductCategory_cleanup;

-- SILVER IMPORT
EXEC silver.dim_Customer_imporet;
EXEC silver.dim_product_import;
EXEC silver.dim_address_import;
EXEC silver.load_password;
EXEC silver.fac_sales_order_header_customer_import;
EXEC silver.sales_order_detail_import;
EXEC silver.dim_ProductCategory_import;

-- GOLD MERGE
EXEC gold.dim_Customer_merge;
EXEC gold.dim_product_merge;
EXEC gold.dim_addrees_merge;
EXEC gold.load_password;
EXEC gold.fac_sales_order_header_customer_merge;
EXEC gold.sales_order_detail_import_marge;
EXEC gold.dim_ProductCategory_merge;

-- ROW COUNTS
SELECT 'silver.dim_Customer' AS [table], COUNT(*) AS rows_count FROM silver.dim_Customer
UNION ALL SELECT 'silver.dim_product', COUNT(*) FROM silver.dim_product
UNION ALL SELECT 'silver.dim_Address', COUNT(*) FROM silver.dim_Address
UNION ALL SELECT 'silver.dim_password', COUNT(*) FROM silver.dim_password
UNION ALL SELECT 'silver.dim_ProductCategory', COUNT(*) FROM silver.dim_ProductCategory
UNION ALL SELECT 'silver.fac_sales_order_header_customer', COUNT(*) FROM silver.fac_sales_order_header_customer
UNION ALL SELECT 'silver.fac_sales_order_detail', COUNT(*) FROM silver.fac_sales_order_detail
UNION ALL SELECT 'gold.dim_Customer', COUNT(*) FROM gold.dim_Customer
UNION ALL SELECT 'gold.dim_product', COUNT(*) FROM gold.dim_product
UNION ALL SELECT 'gold.dim_Address', COUNT(*) FROM gold.dim_Address
UNION ALL SELECT 'gold.dim_password', COUNT(*) FROM gold.dim_password
UNION ALL SELECT 'gold.dim_ProductCategory', COUNT(*) FROM gold.dim_ProductCategory
UNION ALL SELECT 'gold.fac_sales_order_header_customer', COUNT(*) FROM gold.fac_sales_order_header_customer
UNION ALL SELECT 'gold.fac_sales_order_detail', COUNT(*) FROM gold.fac_sales_order_detail;
