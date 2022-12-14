----Important data about each assistance request
SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, completed_at - started_at AS duration
from teachers
JOIN assistance_requests
ON teachers.id = assistance_requests.teacher_id
JOIN students
ON assistance_requests.student_id = students.id
JOIN assignments
ON assistance_requests.id = assignments.id
ORDER BY completed_at - started_at;