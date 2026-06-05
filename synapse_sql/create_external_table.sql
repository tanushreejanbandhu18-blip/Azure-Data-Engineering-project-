-- CREATE DATABASE SCOPED CREDENTIAL

CREATE DATABASE SCOPED CREDENTIAL <credential_name>
WITH
    IDENTITY = 'Managed Identity';

-- CREATE EXTERNAL DATA SOURCES

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://<storage_account>.blob.core.windows.net/silver',
    CREDENTIAL = <credential_name>
);

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://<storage_account>.blob.core.windows.net/gold',
    CREDENTIAL = <credential_name>
);

-- CREATE EXTERNAL FILE FORMAT

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

-- CREATE EXTERNAL TABLE

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales;

-- VALIDATION

SELECT * FROM gold.extsales;