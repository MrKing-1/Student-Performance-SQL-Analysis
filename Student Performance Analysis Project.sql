--- Create table
Create Table students (
Student_id INT,
First_Name VARCHAR(50),
Department VARCHAR(50),
Gender VARCHAR(20),
Age INT,
Score INT,
Attendance INT,
Study_Hours INT,
Exam_Date Date
);


INSERT INTO students
(Student_id, First_Name, Department, Gender, Age, Score, Attendance, Study_Hours, Exam_Date)
VALUES
(1,'Suliat','Computer Science', 'Male', 21, 85, 90, 5, '2026-05-10'),
(2, 'Daniel', 'Medicine', 'Female', 23, 92, 95, 7, '2026-05-12'),
(3, 'Kayode', 'Engineering', 'Male', 22, 70, 75, 3, '2026-05-15');

--Question 1: Data Retrieval and Filtering
SELECT First_Name, Department, Score FROM students;

SELECT * 
FROM students
WHERE score > 80;

SELECT * 
FROM students
WHERE attendance > 85;

SELECT DISTINCT Department
FROM students;

SELECT * 
FROM students
ORDER BY score DESC;

--Question 2: Analysis and Categorization
SELECT
department,
COUNT(*) AS number_of_students,
AVG(score) AS average_score,
MAX(score) AS highest_score
FROM students
GROUP BY department;

SELECT
department,
COUNT(*) AS number_of_students,
AVG(score) AS average_score,
MAX(score) AS highest_score
FROM students
GROUP BY department
HAVING AVG(score) > 75;

SELECT
first_name,
score,
CASE
WHEN score >= 85 THEN 'Excellent'
WHEN score BETWEEN 70 AND 84 THEN 'Good'
ELSE 'Needs Improvement'
END AS Performance_Level
FROM students;

--Real-World Data Analyst Task
SELECT
first_name,
attendance,
study_hours,
ABS(attendance - study_hours) AS difference
FROM students;

SELECT
first_name,
exam_date,
EXTRACT(DAY FROM exam_date) AS Day,
TO_CHAR(exam_date, 'Month') AS Month_Name,
EXTRACT(QUARTER FROM exam_date) AS Quarter_Number
FROM students;

SELECT
first_name,
COALESCE(score, 0) AS score,
COALESCE(attendance, 0) AS attendance
FROM students;


SELECT
first_name AS Student_Name,
department,
score,
CASE
WHEN score >= 85 THEN 'Excellent'
WHEN score BETWEEN 70 AND 84 THEN 'Good'
ELSE 'Needs Improvement'
END AS Performance_Level,
TO_CHAR(exam_date, 'Month') AS Exam_Month
FROM students;
