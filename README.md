# Healthcare Patient Flow & Length of Stay Analysis

## Project Overview
This project analyzes hospital patient flow and Length of Stay (LOS) to evaluate departmental efficiency and admission trends.
The analysis was conducted using MySQL for data modeling and querying, Excel for validation, and Power BI for dashboard visualization.

## Tools Used
- MySQL (Database design & SQL analysis)
- Excel (Data validation using DATEDIF, AVERAGEIFS, Pivot Tables)
- Power BI (Interactive dashboard & DAX measures)

## Database Schema
Tables created:
- departments
- patients
- admissions
- discharges

Key relationships:
- admissions → patients
- admissions → departments
- admissions → discharges

## Key Analysis Performed
- Calculated Length of Stay (LOS) using DATEDIFF
- Computed Average LOS by department
- Identified monthly admission trends
- Flagged readmissions using conditional aggregation
- Evaluated department load vs bed capacity

## Excel Validation
SQL outputs were exported to CSV and validated in Excel using:
- DATEDIFF
- AVERAGEIFS
- Pivot Tables
Validation confirmed aggregation accuracy.

## Power BI Dashboard
The dashboard includes:
- Total Admissions KPI
- Average LOS KPI
- Monthly Admissions Trend
- Average LOS by Department
- Date Slicer

## Key Insights
- Pulmonology showed the highest average LOS.
- Admission trends varied between January and February.
- Certain departments showed higher admission-to-bed ratios, indicating potential load pressure.

## Repository Structure

```
healthcare-patient-flow-analysis/
│
├── mysql/
│   ├── schema.sql
│   ├── data.sql
│   └── analysis.sql
│
├── excel/
│   ├── los_per_admission.csv
│   ├── avg_los_by_department.csv
│   └── los_validation.xlsx
│
├── powerbi/
│   ├── patient_flow_dashboard.pbix
│   └── dashboard_view.png
│
└── README.md
```