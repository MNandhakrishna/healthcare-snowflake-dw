-- ============================================================
-- File       : 01_create_patient_stream.sql
-- Purpose    : Capture changes from CUR_PATIENT
-- Layer      : INCREMENTAL
-- ============================================================

USE ROLE ACCOUNTADMIN;

USE DATABASE HEALTHCARE_DW;
USE SCHEMA CURATED;

CREATE OR REPLACE STREAM STREAM_CUR_PATIENT
ON TABLE HEALTHCARE_DW.CURATED.CUR_PATIENT;


