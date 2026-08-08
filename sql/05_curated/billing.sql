-- ============================================================
-- File       : billing.sql
-- Purpose    : Create and Load Curated Billing Table
-- Layer      : CURATED
-- Project    : Healthcare Enterprise Data Warehouse
-- ============================================================

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DW;

CREATE OR REPLACE TABLE CURATED.CUR_BILLING (
    BILL_ID                    NUMBER,
    BILL_DATE                  DATE,
    TOTAL_AMOUNT               NUMBER(12,2),
    INSURANCE_COVERED_AMOUNT   NUMBER(12,2),
    PATIENT_PAYABLE_AMOUNT     NUMBER(12,2),
    PAYMENT_STATUS             VARCHAR(30),
    PAYMENT_MODE               VARCHAR(30),
    ADMISSION_ID               NUMBER,
    LOAD_TIMESTAMP             TIMESTAMP_NTZ
);

INSERT INTO CURATED.CUR_BILLING (
    BILL_ID,
    BILL_DATE,
    TOTAL_AMOUNT,
    INSURANCE_COVERED_AMOUNT,
    PATIENT_PAYABLE_AMOUNT,
    PAYMENT_STATUS,
    PAYMENT_MODE,
    ADMISSION_ID,
    LOAD_TIMESTAMP
)
SELECT
    BILL_ID,

    TRY_TO_DATE(BILL_DATE),

    TOTAL_AMOUNT,

    INSURANCE_COVERED_AMOUNT,

    PATIENT_PAYABLE_AMOUNT,

    UPPER(TRIM(PAYMENT_STATUS)),

    UPPER(TRIM(PAYMENT_MODE)),

    ADMISSION_ID,

    CURRENT_TIMESTAMP()

FROM RAW.RAW_BILLING

WHERE BILL_ID IS NOT NULL;
