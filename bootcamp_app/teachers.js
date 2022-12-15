const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

// pool.query(`
// SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
// FROM teachers
// JOIN assistance_requests
// ON assistance_requests.teacher_id = teachers.id
// JOIN students
// ON students.id = assistance_requests.student_id
// JOIN cohorts
// ON students.cohort_id = cohorts.id
// WHERE cohorts.name LIKE '%${process.argv[2]}%'
// GROUP BY cohorts.name, teachers.name
// ORDER BY teachers.name;

// `)
// .then(res => {
//   res.rows.forEach(row => {
//     console.log(`${process.argv[2]}:${row.teacher}`);
//   })
// });        


const cohortsName = process.argv[2];

const val = [`%${cohortsName}%`];

const queryCommand = `
SELECT teachers.name AS teacher, cohorts.name AS cohort, COUNT(assistance_requests) AS total_assistances
FROM teachers
JOIN assistance_requests
ON assistance_requests.teacher_id = teachers.id
JOIN students
ON students.id = assistance_requests.student_id
JOIN cohorts
ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
GROUP BY cohorts.name, teachers.name
ORDER BY teachers.name;

`;

pool.query(queryCommand, val)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}:${row.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));