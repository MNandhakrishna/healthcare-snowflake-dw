-- ============================================================
-- File       : 02_create_internal_stage.sql
-- Purpose    : Create Internal Stage for HMIS Dataset
-- Project    : Healthcare Enterprise Data Warehouse
-- ============================================================

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DW;
USE SCHEMA RAW;

CREATE OR REPLACE STAGE STG_HMIS_FILES
FILE_FORMAT = FF_CSV
COMMENT = 'Internal Stage for Hospital HMIS Dataset';

SHOW STAGES IN SCHEMA RAW;  -- to verify the stage creation


LIST @RAW.STG_HMIS_FILES;