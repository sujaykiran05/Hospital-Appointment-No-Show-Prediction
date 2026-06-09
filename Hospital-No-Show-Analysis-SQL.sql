USE hospital_db;

SELECT COUNT(*)
FROM hospital_appointment_no_show_5000;

SELECT *
FROM hospital_appointment_no_show_5000
LIMIT 4;

SELECT COUNT(*) AS total_no_shows
 FROM hospital_appointment_no_show_5000 
 WHERE no_show = 1;
 
SELECT department, COUNT(*) AS no_shows 
FROM hospital_appointment_no_show_5000 
WHERE no_show = 0
GROUP BY department
ORDER BY no_shows DESC;

SELECT gender, COUNT(*) AS no_show
FROM hospital_appointment_no_show_5000
WHERE NO_SHOW = 1
GROUP BY gender;

SELECT sms_reminder, COUNT(*) AS total,
SUM(CASE WHEN no_show = 1 THEN 1 ELSE 0 END) 
AS no_shows
FROM hospital_appointment_no_show_5000
GROUP BY sms_reminder;

SELECT 
CASE 
WHEN age < 20 THEN 'Below 20'
WHEN age BETWEEN 20 AND 40 THEN '20-40'
WHEN age BETWEEN 41 AND 60 THEN '41-60'
ELSE 'Above 60'
END AS age_group,
COUNT(*) AS no_shows
FROM hospital_appointment_no_show_5000
WHERE no_show = 1
GROUP BY age_group;

SELECT Public_holiday,COUNT(*) 
FROM hospital_appointment_no_show_5000
WHERE NO_SHOW =1 
GROUP BY Public_holiday;

SELECT COUNT(*) 
FROM hospital_appointment_no_show_5000
WHERE diabetes = 1 ;

SELECT 
SUM(CASE WHEN patient_id IS NULL THEN 1 ELSE 0 END) AS missing_patient_id,
SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS missing_age,
SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
SUM(CASE WHEN city_type IS NULL THEN 1 ELSE 0 END) AS missing_city_type,
SUM(CASE WHEN distance_km IS NULL THEN 1 ELSE 0 END) AS missing_distance_km,
SUM(CASE WHEN travel_time_min IS NULL THEN 1 ELSE 0 END) AS missing_travel_time,
SUM(CASE WHEN appointment_day IS NULL THEN 1 ELSE 0 END) AS missing_appt_day,
SUM(CASE WHEN appointment_time_slot IS NULL THEN 1 ELSE 0 END) AS missing_time_slot,
SUM(CASE WHEN department IS NULL THEN 1 ELSE 0 END) AS missing_department,
SUM(CASE WHEN waiting_days IS NULL THEN 1 ELSE 0 END) AS missing_waiting_days,
SUM(CASE WHEN previous_appointments IS NULL THEN 1 ELSE 0 END) AS missing_prev_appts,
SUM(CASE WHEN previous_no_shows IS NULL THEN 1 ELSE 0 END) AS missing_prev_noshows,
SUM(CASE WHEN diabetes IS NULL THEN 1 ELSE 0 END) AS missing_diabetes,
SUM(CASE WHEN hypertension IS NULL THEN 1 ELSE 0 END) AS missing_hypertension,
SUM(CASE WHEN chronic_disease IS NULL THEN 1 ELSE 0 END) AS missing_chronic_disease,
SUM(CASE WHEN sms_reminder IS NULL THEN 1 ELSE 0 END) AS missing_sms_reminder,
SUM(CASE WHEN email_reminder IS NULL THEN 1 ELSE 0 END) AS missing_email_reminder,
SUM(CASE WHEN num_reminders IS NULL THEN 1 ELSE 0 END) AS missing_num_reminders,
SUM(CASE WHEN employment_status IS NULL THEN 1 ELSE 0 END) AS missing_employment,
SUM(CASE WHEN education_level IS NULL THEN 1 ELSE 0 END) AS missing_education,
SUM(CASE WHEN insurance_status IS NULL THEN 1 ELSE 0 END) AS missing_insurance,
SUM(CASE WHEN rainy_day IS NULL THEN 1 ELSE 0 END) AS missing_rainy_day,
SUM(CASE WHEN public_holiday IS NULL THEN 1 ELSE 0 END) AS missing_public_holiday,
SUM(CASE WHEN no_show IS NULL THEN 1 ELSE 0 END) AS missing_no_show
FROM hospital_appointment_no_show_5000;