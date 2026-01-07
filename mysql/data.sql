USE healthcare_analytics;

-- departments
INSERT INTO departments VALUES
(1, 'Cardiology', 40),
(2, 'Neurology', 30),
(3, 'Pulmonology', 25),
(4, 'General Medicine', 50);

-- patients
INSERT INTO patients VALUES
(101, 'FEMALE', 45), 
(102, 'MALE', 60),
(103, 'FEMALE', 32),
(104, 'MALE', 50),
(105, 'FEMALE', 28);

-- admissions
INSERT INTO admissions VALUES
(1001, 101, 1, '2024-01-02'),
(1002, 102, 3, '2024-01-05'),
(1003, 103, 4, '2024-01-10'),
(1004, 104, 2, '2024-01-15'),
(1005, 101, 1, '2024-02-01'); -- readmission case

-- discharges
INSERT INTO discharges VALUES
(2001, 1001, '2024-01-07'),
(2002, 1002, '2024-01-12'),
(2003, 1003, '2024-01-14'),
(2004, 1004, '2024-01-20'),
(2005, 1005, '2024-02-05');



