-- CREATE GOLD LAYER VIEWS

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS;

-- CALENDAR

ALTER VIEW gold.calendar AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Calendar/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- CUSTOMERS

CREATE VIEW gold.customers AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Customers/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- PRODUCTS

CREATE VIEW gold.products AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Products/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- RETURNS

CREATE VIEW gold.returns AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Returns/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- SALES

CREATE VIEW gold.sales AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Sales/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- TERRITORIES

CREATE VIEW gold.territories AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/AdventureWorks_Territories/',
    FORMAT = 'PARQUET'
) AS QUERY1;

-- SUBCATEGORIES

CREATE VIEW gold.subcategories AS
SELECT *
FROM OPENROWSET(
    BULK 'https://<storage_account>.blob.core.windows.net/silver/Product_Subcategories/',
    FORMAT = 'PARQUET'
) AS QUERY1