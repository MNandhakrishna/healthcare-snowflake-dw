# Healthcare HMIS - Source Relationships

## Patient Domain

PATIENT
- Primary Key: patient_id

PATIENT
  └── patient_id
       ├── ADMISSION.patient_id
       └── PATIENT_INSURANCE.patient_id


## Admission Domain

ADMISSION
- Primary Key: admission_id

ADMISSION
  └── admission_id
       ├── BILLING.admission_id
       ├── PRESCRIPTION.admission_id
       └── PATIENT_DIAGNOSTIC.admission_id


## Department Domain

DEPARTMENT
- Primary Key: department_id

DEPARTMENT
  └── department_id
       ├── ADMISSION.department_id
       ├── EMPLOYEE.department_id
       ├── WARD.department_id
       └── DIAGNOSTIC_TEST.department_id


## Ward / Bed Domain

WARD
- Primary Key: ward_id

WARD
  └── ward_id
       ├── BED.ward_id
       └── STAFF_ASSIGNMENT.ward_id

BED
- Primary Key: bed_id

BED
  └── bed_id
       └── ADMISSION.bed_id


## Disease Domain

DISEASE
- Primary Key: disease_id

DISEASE
  └── disease_id
       └── ADMISSION.disease_id


## Employee / Doctor Domain

EMPLOYEE
- Primary Key: employee_id

EMPLOYEE
  └── employee_id
       ├── DOCTOR.employee_id
       └── STAFF_ASSIGNMENT.employee_id

DOCTOR
- Primary Key: doctor_id

DOCTOR
  └── doctor_id
       └── PATIENT_DIAGNOSTIC.doctor_id


## Billing Domain

BILLING
- Primary Key: bill_id

BILLING
  └── bill_id
       └── BILLING_DETAIL.bill_id

BILLING_DETAIL
- Primary Key: billing_detail_id


## Pharmacy Domain

DRUG_MANUFACTURER
- Primary Key: manufacturer_id

DRUG_MANUFACTURER
  └── manufacturer_id
       └── DRUG.manufacturer_id

DRUG
- Primary Key: drug_id

DRUG
  └── drug_id
       ├── PRESCRIPTION.drug_id
       └── DRUG_INVENTORY.drug_id


## Diagnostic Domain

DIAGNOSTIC_TEST
- Primary Key: test_id

DIAGNOSTIC_TEST
  └── test_id
       └── PATIENT_DIAGNOSTIC.test_id


## Insurance Domain

INSURANCE_PROVIDER
- Primary Key: insurance_provider_id

INSURANCE_PROVIDER
  └── insurance_provider_id
       └── PATIENT_INSURANCE.insurance_provider_id

PATIENT_INSURANCE
- Primary Key: patient_insurance_id