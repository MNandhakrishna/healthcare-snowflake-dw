# Healthcare Data Warehouse on Snowflake

## 1. Project Overview

The Healthcare Data Warehouse is a Snowflake-based data platform designed to consolidate healthcare data such as patients, admissions, billing, prescriptions, diagnostics, doctors, drugs, departments, wards, and insurance.

The project transforms raw healthcare source data into curated datasets and a dimensional analytics model that supports reporting and business analysis.

The solution also implements Snowflake security features and incremental processing using Streams and Tasks.

---

## 2. Business Objectives

The warehouse supports analysis of:

- Patient admissions and hospital utilization
- Hospital billing and revenue
- Insurance coverage
- Doctor and diagnostic performance
- Prescription and drug usage
- Department-level healthcare activity
- Patient and insurance relationships

---

## 3. Architecture

```text
Source Files
     |
     v
+-------------+
|     RAW     |
| 19 Tables   |
+-------------+
     |
     v
+-------------+
|   CURATED   |
| Cleaned and |
| standardized|
+-------------+
     |
     +----------------------+
     |                      |
     v                      v
  Data Quality          Stream
                           |
                           v
                         Task
                           |
                           v
+-------------------------------------------+
|                 ANALYTICS                 |
|                                           |
| Dimensions                                |
|   DIM_PATIENT                             |
|   DIM_DOCTOR                              |
|   DIM_DEPARTMENT                          |
|   DIM_DISEASE                             |
|   DIM_WARD                                |
|   DIM_DRUG                                |
|   DIM_DATE                                |
|   DIM_INSURANCE_PROVIDER                  |
|   DIM_DIAGNOSTIC_TEST                     |
|                                           |
| Facts                                     |
|   FACT_ADMISSION                          |
|   FACT_BILLING                            |
|   FACT_BILLING_DETAIL                     |
|   FACT_PRESCRIPTION                       |
|   FACT_DIAGNOSTIC                         |
|                                           |
| Bridge                                    |
|   BRIDGE_PATIENT_INSURANCE                |
+-------------------------------------------+
     |
     v
+-----------------------+
|      REPORTING        |
| Admission Analytics   |
| Revenue Analytics     |
| Diagnostic Analytics  |
| Prescription Analysis |
| Insurance Analytics   |
+-----------------------+

Security:
RBAC + Dynamic Data Masking
````

---

## 4. Technology Stack

* Snowflake
* SQL
* Snowflake Streams
* Snowflake Tasks
* Snowflake RBAC
* Dynamic Data Masking
* Dimensional Modeling
* Star Schema
* Git/GitHub

---

## 5. Data Layers

### RAW

The RAW layer stores the source data with minimal transformation.

The project contains 19 source tables.

Purpose:

* Preserve source data
* Maintain source-level structure
* Provide a reliable ingestion layer

### CURATED

The CURATED layer contains cleaned and standardized data.

Transformations include:

* Data type conversion
* Date conversion
* Null handling
* Duplicate validation
* Business-rule validation
* Referential integrity checks

### ANALYTICS

The ANALYTICS layer contains the dimensional model used for analytical queries.

It includes:

* Dimension tables
* Fact tables
* Bridge table
* Surrogate keys

### REPORTING

The reporting layer contains business-focused views for analytical consumption.

---

## 6. Data Modeling

The analytics layer follows a dimensional/star-schema approach.

### Dimensions

* DIM_DATE
* DIM_PATIENT
* DIM_DEPARTMENT
* DIM_DOCTOR
* DIM_DISEASE
* DIM_WARD
* DIM_DRUG
* DIM_INSURANCE_PROVIDER
* DIM_DIAGNOSTIC_TEST

### Fact Tables

* FACT_ADMISSION
* FACT_BILLING
* FACT_BILLING_DETAIL
* FACT_PRESCRIPTION
* FACT_DIAGNOSTIC

### Bridge Table

* BRIDGE_PATIENT_INSURANCE

The bridge table handles the relationship between patients and insurance providers.

---

## 7. Data Quality

Validation was performed before promoting data to the analytics layer.

Examples include:

* Primary key uniqueness
* Null checks
* Referential integrity
* Orphan-record checks
* Invalid date checks
* Negative amount checks
* Coverage percentage validation
* Duplicate detection
* Valid status/value checks

Examples of validated relationships include:

```text
Admissions -> Patients
Admissions -> Departments
Admissions -> Wards
Admissions -> Diseases
Bills -> Admissions
Prescriptions -> Admissions
Prescriptions -> Drugs
Diagnostics -> Admissions
Diagnostics -> Doctors
Diagnostics -> Diagnostic Tests
Insurance -> Patients
Insurance -> Insurance Providers
```

---

## 8. Incremental Processing

Snowflake Streams and Tasks were implemented for incremental patient processing.

Flow:

```text
CURATED.CUR_PATIENT
        |
        v
STREAM_CUR_PATIENT
        |
        v
TASK_DIM_PATIENT
        |
        v
ANALYTICS.DIM_PATIENT
```

### Stream

`STREAM_CUR_PATIENT` captures changes occurring in `CUR_PATIENT`.

### Task

`TASK_DIM_PATIENT` runs on an hourly schedule and checks whether the stream contains new data.

The Task uses `MERGE` to insert new patients and update existing patients.

The task uses:

```sql
SYSTEM$STREAM_HAS_DATA()
```

to avoid executing the merge when there are no stream changes.

---

## 9. Security

The project implements Snowflake role-based access control.

Roles:

* HEALTHCARE_ADMIN
* HEALTHCARE_ANALYST

The analyst role has access to the Analytics layer but does not have direct access to the Raw layer.

### Dynamic Data Masking

Sensitive columns are protected using masking policies.

Masked fields include:

* Patient contact number
* Insurance policy number

Example:

```text
HEALTHCARE_ADMIN
+1-792-342-0981

HEALTHCARE_ANALYST
********
```

The underlying data remains unchanged while the returned value depends on the active role.

---

## 10. Reporting Views

### VW_ADMISSION_SUMMARY

Provides:

* Admission information
* Department
* Disease
* Ward
* Patient
* Length of stay

### VW_HOSPITAL_REVENUE

Provides:

* Total billed amount
* Insurance-covered amount
* Patient payable amount
* Payment mode
* Department-level revenue

### VW_DOCTOR_DIAGNOSTIC_PERFORMANCE

Provides:

* Diagnostic test volume
* Normal results
* Abnormal results
* Abnormal-result percentage
* Doctor specialization

### VW_PRESCRIPTION_ANALYTICS

Provides:

* Prescription volume
* Drug usage
* Drug category
* Manufacturer
* Patient counts
* Average prescription duration

### VW_INSURANCE_COVERAGE

Provides:

* Insured patient counts
* Coverage percentages
* Insurance provider analysis

---

## 11. Performance Testing

Snowflake Query Profile was used to establish a performance baseline.

A reporting query was compared with a more direct fact-table aggregation.

The direct fact-table query produced:

* Approximately 492 ms execution time
* 1.5 MB scanned

The dataset is currently small, so clustering was not introduced.

The decision was based on measured query behavior rather than adding clustering unnecessarily.

---

## 12. Project Structure

```text
healthcare-data-warehouse/
|
├── sql/
│   ├── 01_raw/
│   ├── 02_ingestion/
│   ├── 03_validation/
│   ├── 04_curated/
│   ├── 05_analytics/
│   ├── 06_facts/
│   ├── 07_reporting/
│   ├── 08_security/
│   └── 09_incremental/
|
├── README.md
└── .gitignore
```

---

## 13. Key Business Use Cases

The warehouse supports:

1. Hospital admission analysis
2. Department utilization analysis
3. Hospital revenue analysis
4. Insurance coverage analysis
5. Doctor diagnostic performance
6. Diagnostic outcome analysis
7. Prescription analysis
8. Drug utilization analysis
9. Patient insurance analysis

---

## 14. Key Snowflake Features Demonstrated

* Database and schema organization
* SQL-based transformations
* Dimensional modeling
* Surrogate keys
* Fact and dimension design
* Snowflake Streams
* Snowflake Tasks
* MERGE-based incremental processing
* RBAC
* Dynamic data masking
* Query Profile
* Performance analysis
* Reporting views

---

## 15. Conclusion

This project demonstrates an end-to-end healthcare data warehouse implemented on Snowflake, from raw source data through curated data, dimensional modeling, incremental processing, security, and reporting.

The architecture is designed to separate ingestion, transformation, analytics, security, and reporting responsibilities while providing a foundation for scalable healthcare analytics.