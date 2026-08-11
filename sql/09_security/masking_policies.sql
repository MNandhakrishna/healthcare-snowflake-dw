-- ============================================================
-- File       : masking_policies.sql
-- Purpose    : Protect sensitive healthcare information
-- Layer      : SECURITY
-- ============================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE HEALTHCARE_DW;
USE SCHEMA SECURITY;

-- ============================================================
-- Mask Patient Contact Number
-- ============================================================

CREATE OR REPLACE MASKING POLICY MASK_PHONE_NUMBER
AS (VAL VARCHAR)
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    CASE
        WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN', 'HEALTHCARE_ADMIN')
            THEN VAL
        ELSE
            '********'
    END
$$;



ALTER TABLE HEALTHCARE_DW.ANALYTICS.DIM_PATIENT
MODIFY COLUMN CONTACT_NUMBER
SET MASKING POLICY HEALTHCARE_DW.SECURITY.MASK_PHONE_NUMBER;



-- ============================================================
-- Mask Insurance Policy Number
-- ============================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE HEALTHCARE_DW;
USE SCHEMA SECURITY;

USE ROLE ACCOUNTADMIN;

USE DATABASE HEALTHCARE_DW;
USE SCHEMA SECURITY;

CREATE OR REPLACE MASKING POLICY MASK_POLICY_NUMBER
AS (VAL VARCHAR)
RETURNS VARCHAR ->
    CASE
        WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN', 'HEALTHCARE_ADMIN')
            THEN VAL
        ELSE
            '********'
    END;

ALTER TABLE HEALTHCARE_DW.ANALYTICS.BRIDGE_PATIENT_INSURANCE
MODIFY COLUMN POLICY_NUMBER
SET MASKING POLICY HEALTHCARE_DW.SECURITY.MASK_POLICY_NUMBER;