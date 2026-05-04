CREATE TABLE hospital_data (
    patient_id INT,
    arrival_time TIMESTAMP,
    doctor_name VARCHAR(50),
    consultation_start TIMESTAMP,
    consultation_end TIMESTAMP,
    department VARCHAR(50)
);
INSERT INTO hospital_data VALUES
(101, '2024-01-01 09:00:00', 'Dr A', '2024-01-01 10:30:00', '2024-01-01 10:50:00', 'Cardiology'),
(102, '2024-01-01 09:15:00', 'Dr B', '2024-01-01 09:40:00', '2024-01-01 10:00:00', 'Orthopedics'),
(103, '2024-01-01 10:00:00', 'Dr A', '2024-01-01 11:00:00', '2024-01-01 11:20:00', 'Cardiology'),
(104, '2024-01-01 10:30:00', 'Dr C', '2024-01-01 12:00:00', '2024-01-01 12:30:00', 'General'),
(105, '2024-01-01 11:00:00', 'Dr B', '2024-01-01 11:30:00', '2024-01-01 11:50:00', 'Orthopedics');

SELECT * FROM hospital_data;

SELECT 
    patient_id,
    arrival_time,
    consultation_start,
    (consultation_start - arrival_time) AS wait_time
FROM hospital_data;

SELECT 
    AVG(consultation_start - arrival_time) AS avg_wait_time
FROM hospital_data;

SELECT 
    EXTRACT(HOUR FROM arrival_time) AS hour,
    COUNT(*) AS total_patients
FROM hospital_data
GROUP BY hour
ORDER BY total_patients DESC;


SELECT 
    doctor_name,
    COUNT(*) AS total_patients
FROM hospital_data
GROUP BY doctor_name
ORDER BY total_patients DESC;

SELECT 
    doctor_name,
    SUM(consultation_end - consultation_start) AS total_work_time
FROM hospital_data
GROUP BY doctor_name;
