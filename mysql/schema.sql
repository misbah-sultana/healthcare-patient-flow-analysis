CREATE DATABASE IF NOT EXISTS healthcare_analytics;
USE healthcare_analytics;

CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    total_beds INT
);

CREATE TABLE patients(
	patient_ID INT PRIMARY KEY,
    gender VARCHAR(10)
    CHECK (gender IN('MALE', 'FEMALE', 'OTHERS')),
    age INT
);
    
CREATE TABLE admissions(
	admission_ID INT PRIMARY KEY,
    patient_ID INT,
    department_id INT,
    admission_date DATE,
    FOREIGN KEY (patient_ID) REFERENCES patients(patient_ID),
    FOREIGN KEY (department_ID) REFERENCES departments(department_ID)
);

CREATE TABLE discharges(
	discharge_ID INT PRIMARY KEY,
    admission_ID INT,
    discharge_date DATE,
    FOREIGN KEY (admission_ID) REFERENCES admissions(admission_ID)
);

