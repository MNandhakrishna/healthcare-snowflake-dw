-- ============================================================
-- File       : create_raw_tables.sql
-- Purpose    : Create all RAW tables
-- Project    : Healthcare Enterprise Data Warehouse
-- ============================================================

USE ROLE ACCOUNTADMIN;
USE WAREHOUSE HEALTHCARE_WH;
USE DATABASE HEALTHCARE_DW;
USE SCHEMA RAW;

--------------------------------------------------------
-- PATIENT
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PATIENT (
    PATIENT_ID NUMBER,
    GENDER VARCHAR(10),
    DATE_OF_BIRTH VARCHAR(20),
    BLOOD_GROUP VARCHAR(5),
    CITY VARCHAR(100),
    CONTACT_NUMBER VARCHAR(50)
);

--------------------------------------------------------
-- ADMISSION
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_ADMISSION (
    ADMISSION_ID NUMBER,
    ADMISSION_DATE VARCHAR(20),
    DISCHARGE_DATE VARCHAR(20),
    ADMISSION_TYPE VARCHAR(50),
    ADMISSION_STATUS VARCHAR(30),
    PATIENT_ID NUMBER,
    DEPARTMENT_ID NUMBER,
    WARD_ID NUMBER,
    BED_ID NUMBER,
    DISEASE_ID NUMBER
);

--------------------------------------------------------
-- BILLING
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_BILLING (
    BILL_ID NUMBER,
    BILL_DATE VARCHAR(20),
    TOTAL_AMOUNT NUMBER(10,2),
    INSURANCE_COVERED_AMOUNT NUMBER(10,2),
    PATIENT_PAYABLE_AMOUNT NUMBER(10,2),
    PAYMENT_STATUS VARCHAR(30),
    PAYMENT_MODE VARCHAR(30),
    ADMISSION_ID NUMBER
);

--------------------------------------------------------
-- BILLING DETAIL
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_BILLING_DETAIL (
    BILLING_DETAIL_ID NUMBER,
    CHARGE_TYPE VARCHAR(100),
    REFERENCE_ID NUMBER,
    AMOUNT NUMBER(10,2),
    BILL_ID NUMBER
);

--------------------------------------------------------
-- DEPARTMENT
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DEPARTMENT (
    DEPARTMENT_ID NUMBER,
    DEPARTMENT_NAME VARCHAR(100),
    DEPARTMENT_TYPE VARCHAR(50),
    FLOOR_NUMBER NUMBER,
    STATUS VARCHAR(20)
);

--------------------------------------------------------
-- DIAGNOSTIC TEST
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DIAGNOSTIC_TEST (
    TEST_ID NUMBER,
    TEST_NAME VARCHAR(100),
    TEST_CATEGORY VARCHAR(50),
    STANDARD_COST NUMBER(10,2),
    DEPARTMENT_ID NUMBER
);

--------------------------------------------------------
-- DISEASE
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DISEASE (
    DISEASE_ID NUMBER,
    DISEASE_NAME VARCHAR(100),
    DISEASE_CATEGORY VARCHAR(100)
);

--------------------------------------------------------
-- DOCTOR
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DOCTOR (
    DOCTOR_ID NUMBER,
    EMPLOYEE_ID NUMBER,
    SPECIALIZATION VARCHAR(100),
    QUALIFICATION VARCHAR(100),
    EXPERIENCE_YEARS NUMBER
);

--------------------------------------------------------
-- DRUG
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DRUG (
    DRUG_ID NUMBER,
    DRUG_NAME VARCHAR(100),
    BRAND_NAME VARCHAR(100),
    DRUG_CATEGORY VARCHAR(50),
    UNIT_COST NUMBER(10,2),
    MANUFACTURER_ID NUMBER
);

--------------------------------------------------------
-- DRUG INVENTORY
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DRUG_INVENTORY (
    INVENTORY_ID NUMBER,
    CURRENT_STOCK NUMBER,
    REORDER_LEVEL NUMBER,
    INVENTORY_STATUS VARCHAR(30),
    LAST_RESTOCK_DATE VARCHAR(20),
    DRUG_ID NUMBER
);

--------------------------------------------------------
-- DRUG MANUFACTURER
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_DRUG_MANUFACTURER (
    MANUFACTURER_ID NUMBER,
    MANUFACTURER_NAME VARCHAR(100),
    COUNTRY VARCHAR(50),
    RELIABILITY_RATING NUMBER(3,2),
    CONTRACT_STATUS VARCHAR(30)
);

--------------------------------------------------------
-- EMPLOYEE
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_EMPLOYEE (
    EMPLOYEE_ID NUMBER,
    EMPLOYEE_NAME VARCHAR(100),
    GENDER VARCHAR(10),
    ROLE VARCHAR(100),
    EMPLOYMENT_TYPE VARCHAR(30),
    DATE_OF_JOINING VARCHAR(20),
    DEPARTMENT_ID NUMBER
);

--------------------------------------------------------
-- INSURANCE PROVIDER
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_INSURANCE_PROVIDER (
    INSURANCE_PROVIDER_ID NUMBER,
    PROVIDER_NAME VARCHAR(100),
    PROVIDER_TYPE VARCHAR(50),
    CONTACT_DETAILS VARCHAR(100),
    COVERAGE_LIMIT NUMBER(12,2)
);

--------------------------------------------------------
-- PATIENT DIAGNOSTIC
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PATIENT_DIAGNOSTIC (
    PATIENT_DIAGNOSTIC_ID NUMBER,
    TEST_DATE VARCHAR(20),
    RESULT_STATUS VARCHAR(30),
    ADMISSION_ID NUMBER,
    TEST_ID NUMBER,
    DOCTOR_ID NUMBER
);

--------------------------------------------------------
-- PATIENT INSURANCE
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PATIENT_INSURANCE (
    PATIENT_INSURANCE_ID NUMBER,
    POLICY_NUMBER VARCHAR(100),
    COVERAGE_PERCENTAGE NUMBER,
    POLICY_START_DATE VARCHAR(20),
    POLICY_END_DATE VARCHAR(20),
    PATIENT_ID NUMBER,
    INSURANCE_PROVIDER_ID NUMBER
);

--------------------------------------------------------
-- PRESCRIPTION
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_PRESCRIPTION (
    PRESCRIPTION_ID NUMBER,
    DOSAGE VARCHAR(50),
    FREQUENCY VARCHAR(50),
    DURATION_DAYS NUMBER,
    ADMISSION_ID NUMBER,
    DRUG_ID NUMBER
);

--------------------------------------------------------
-- STAFF ASSIGNMENT
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_STAFF_ASSIGNMENT (
    ASSIGNMENT_ID NUMBER,
    EMPLOYEE_ID NUMBER,
    WARD_ID NUMBER,
    SHIFT VARCHAR(20)
);

--------------------------------------------------------
-- WARD
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_WARD (
    WARD_ID NUMBER,
    WARD_NAME VARCHAR(100),
    WARD_TYPE VARCHAR(50),
    TOTAL_BEDS NUMBER,
    DEPARTMENT_ID NUMBER
);

--------------------------------------------------------
-- BED
--------------------------------------------------------
CREATE OR REPLACE TABLE RAW_BED (
    BED_ID NUMBER,
    BED_NUMBER VARCHAR(20),
    BED_STATUS VARCHAR(30),
    WARD_ID NUMBER
);