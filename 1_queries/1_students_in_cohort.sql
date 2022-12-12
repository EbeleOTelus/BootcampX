SELECT id, name
FROM students
WHERE cohort_id = 4
ORDER BY name ASC;


SELECT COUNT(*)
FROM students
WHERE cohort_id <= 3;

                  
SELECT name, id
FROM students
WHERE email IS NULL
OR phone IS NUll 
ORDER BY cohort_id;

SELECT name, email, id, cohort_id
FROM students
WHERE phone IS NULL
AND email NOT LIKE '%gmail.com';

SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NUll;


