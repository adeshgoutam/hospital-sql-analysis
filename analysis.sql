CREATE TABLE hospital_data (
    patient_id INT,
    arrival_time TIMESTAMP,
    doctor_name VARCHAR(50),
    consultation_start TIMESTAMP,
    consultation_end TIMESTAMP,
    department VARCHAR(50)
);

INSERT INTO hospital_data VALUES
(101, '2024-01-01 09:00:00', 'Dr A', '2024-01-01 10:30:00', '2024-01-01 10:50:00', 'Cardiology');

SELECT 
    patient_id,
    (consultation_start - arrival_time) AS wait_time
FROM hospital_data;
