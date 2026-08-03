-- ============================================================
-- File       : 01_create_file_format.sql
-- Purpose    : Create CSV File Format for Healthcare Dataset
-- Project    : Healthcare Enterprise Data Warehouse
-- ============================================================

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DW;

CREATE OR REPLACE FILE FORMAT FF_CSV
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
TRIM_SPACE = TRUE
EMPTY_FIELD_AS_NULL = TRUE
NULL_IF = ('NULL', 'null', '')
ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE
COMPRESSION = AUTO;