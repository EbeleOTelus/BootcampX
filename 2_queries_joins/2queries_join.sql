SELECT COUNT(*) FROM assignments JOIN assignment_submissions
ON assignments.duration = assignment_submissions.duration GROUP BY assignments.name = 'Ibrahim Schimmel';

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';


SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.start_date = students.start_date
WHERE cohorts.name = 'FEB12';