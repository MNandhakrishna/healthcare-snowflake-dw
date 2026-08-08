                         DIM_DATE
                            │
              ┌─────────────┼──────────────┐
              │             │              │
              ▼             ▼              ▼
        FACT_ADMISSION  FACT_BILLING  FACT_DIAGNOSTIC
              │             │              │
      ┌───────┼───────┐     │        ┌─────┼─────┐
      ▼       ▼       ▼     ▼        ▼     ▼     ▼
 DIM_PATIENT DIM_DEPT DIM_WARD   FACT_BILLING_DETAIL
      │       │       │
      │       ▼       ▼
      │    DIM_DISEASE
      │
      ├──────────────► FACT_PRESCRIPTION ◄──── DIM_DRUG
      │
      └──────────────► BRIDGE_PATIENT_INSURANCE
                              │
                              ▼
                       DIM_INSURANCE_PROVIDER


FACT_DIAGNOSTIC
      │
      ├── DIM_PATIENT
      ├── DIM_DOCTOR
      └── DIM_DIAGNOSTIC_TEST


