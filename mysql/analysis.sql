USE healthcare_analytics;

-- length of stay per admission
SELECT 
	a.admission_ID,
    p.patient_ID,
    d.department_name,
    a.admission_date,
    di.discharge_date,
    DATEDIFF(di.discharge_date, a.admission_date) AS length_of_stay_days
FROM admissions a
JOIN discharges di
	ON a.admission_ID = di.admission_ID
JOIN patients p
	ON a.patient_ID = p.patient_ID
JOIN departments d
	ON a.department_ID = d.department_ID;
    
-- average length of stay by department
SELECT 
	d.department_ID,
    d.department_name,
    ROUND(AVG(DATEDIFF(di.discharge_date, a.admission_date)), 2) AS avg_los_days
FROM admissions a
JOIN discharges di
	ON a.admission_ID = di.admission_ID
JOIN departments d
	ON a.department_ID = d.department_ID
GROUP BY d.department_ID, d.department_name
ORDER BY avg_los_days DESC ;

-- monthly admissions trend
SELECT 
	DATE_FORMAT(admission_date, '%Y-%m') AS admission_month,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_month
ORDER BY admission_month;

-- readmission identification
SELECT 
	patient_id,
    COUNT(*) AS number_of_admissions,
CASE
	WHEN COUNT(*) > 1 THEN "Readmission"
    ELSE "Single Admission"
END AS admission_status
FROM admissions
GROUP BY patient_id;

-- occupancy proxy
SELECT *
FROM admissions;

SELECT *
FROM discharges;

SELECT *
FROM departments;

SELECT *
FROM patients;

SELECT 
dept.department_name,
COUNT(ad.admission_ID) AS total_admissions,
dept.total_beds,
ROUND(COUNT(ad.admission_id) / dept.total_beds, 2) AS admission_to_bed_ratio
FROM admissions AS ad
LEFT JOIN departments AS dept
	ON ad.department_id = dept.department_id
GROUP BY dept.department_name, dept.total_beds
ORDER BY admission_to_bed_ratio DESC;

-- High Level Operational Summary
WITH los_data AS (
	SELECT 
    ad.admission_ID,
    dept.department_name,
    DATEDIFF(dis.discharge_date, ad.admission_date) AS los
    FROM admissions AS ad
    JOIN discharges AS dis
		ON ad.admission_ID = dis.admission_ID
	JOIN departments AS dept
		ON ad.department_id = dept.department_id
) 
SELECT 
	department_name,
	COUNT(admission_ID) AS admissions,
	ROUND(AVG(los), 2) AS avg_los
FROM los_data
GROUP BY department_name
ORDER BY avg_los DESC;

