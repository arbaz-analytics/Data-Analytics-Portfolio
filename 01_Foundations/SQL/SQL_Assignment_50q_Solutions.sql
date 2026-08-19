-- SQL Assignment - 50 Questions - Given by Nasir Sir

CREATE DATABASE IF NOT EXISTS sql_assignment;
USE sql_assignment;

-- DEPARTMENT TABLE 01

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR (100) NOT NULL,
location VARCHAR (100),
budget DECIMAL(10,2)
) ;

INSERT INTO departments 
(department_id, department_name, location, budget)
VALUES 
(10, 'Data Science', 'Hyderabad', 500000),
(20, 'HR', 'Bangalore',	300000),
(30, 'Finance',	'Mumbai', 400000),
(40, 'Sales', 'Delhi', 450000),
(50, 'Marketing', 'Chennai', 350000),
(60, 'IT', 'Pune', 600000) ;

SELECT * FROM departments;

-- EMPLOYEE TABLE 02

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
employee_name VARCHAR (50) NOT NULL,
department_id INT,
manager_id INT,
salary DECIMAL(10,2),
city VARCHAR (30),
hire_date DATE,
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
) ;

 INSERT INTO employees 
(employee_id, employee_name, department_id, manager_id, salary, city, hire_date)
VALUES 
(101, 'Alice', 10, 201,	60000, 'Hyderabad', '2022-01-15'),
(102, 'Bob', 20, 202, 55000, 'Bangalore', '2021-06-20'),
(103, 'Charlie', 10, 201, 70000, 'Hyderabad', '2020-03-10'),
(104, 'David', 30, 203, 50000, 'Mumbai', '2023-02-18'),
(105, 'Emma', 40, 204, 65000, 'Delhi', '2022-11-05'),
(106, 'Frank', NULL, 201, 45000, 'Hyderabad', '2024-01-10'),
(107, 'Grace', 20, 202,	58000, 'Bangalore',	'2023-07-12'),
(108, 'Henry', 30, 203,	52000, 'Mumbai', '2021-09-25'),
(109, 'Irene', 10, 201,	72000, 'Hyderabad',	'2019-05-14'),
(110, 'Jack', 50, NULL,	48000, 'Chennai',  '2024-04-01') ;

SELECT * FROM employees;

-- PROJECTS TABLE 03

CREATE TABLE projects (
project_id INT PRIMARY KEY,
project_name VARCHAR (100),
department_id INT,
budget DECIMAL (10,2),
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
);

INSERT INTO projects
(project_id, project_name, department_id, budget)
VALUES
(1,	'AI Platform', 10, 250000),
(2,	'Recruitment System', 20, 150000),
(3, 'Fraud Detection', 30, 200000),
(4,	'Sales Dashboard', 40, 180000),
(5, 'Marketing Campaign', 50, 120000),
(6,	'Cloud Migration', 60, 300000) ;

SELECT * FROM projects;

-- Section A — Basic SQL

-- Q1. Display all employees.
SELECT * FROM employees;

-- Q2. Display only employee name and salary.
SELECT employee_name, salary
FROM employees;

-- Q3. Display employees who earn more than 60,000.
SELECT employee_name, salary
FROM employees
WHERE salary > 60000;

-- Q4. Display employees who live in Hyderabad.
SELECT employee_name, city
FROM employees
WHERE city = 'Hyderabad';

-- Q5. Display employees whose salary is between 50,000 and 70,000.
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

-- Q6. Display employees who live in either Hyderabad or Bangalore.
SELECT employee_name, city
FROM employees
WHERE city IN ('Hyderabad', 'Bangalore');

-- Q7. Display employees whose names start with the letter 'A'.
SELECT employee_name
FROM employees
WHERE employee_name LIKE 'A%';

-- Q8. Display employees whose names end with the letter 'e'.
SELECT employee_name 
FROM employees
WHERE employee_name LIKE '%e';

-- Q9. Display all employees sorted by salary from highest to lowest.
SELECT employee_name, salary 
FROM employees
ORDER BY salary DESC;

-- Q10. Display the top 3 highest-paid employees.
SELECT employee_name, salary 
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Section B — Aggregate Functions

-- Q11. Find the total number of employees.
SELECT COUNT(employee_id) AS total_employees
FROM employees;

-- Q12. Find the total salary of all employees.
SELECT SUM(salary) AS total_salary
FROM employees;

-- Q13. Find the average employee salary.
SELECT AVG(salary) AS average_salary
FROM employees;

-- Q14. Find the highest salary.
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Q15. Find the lowest salary.
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Q16. Find the number of employees living in Hyderabad.
SELECT COUNT(employee_id) AS employee_count
FROM employees
WHERE city = 'Hyderabad';

-- Q17. Find the total salary paid to employees living in Mumbai.
SELECT SUM(salary) AS total_salary, city
FROM employees
WHERE city = 'Mumbai';

-- Q18. Find the average salary of employees living in Bangalore.
SELECT AVG(salary) AS average_salary
FROM employees
WHERE city = 'Bangalore';

-- Section C — GROUP BY and HAVING

-- Q19. Find the number of employees in each department.
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q20. Find the average salary in each department.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q21. Find the maximum salary in each department.
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q22. Find the minimum salary in each department.
SELECT d.department_name, MIN(e.salary) AS lowest_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q23. Find the total salary paid by each department.
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q24. Find the number of employees in each city.
SELECT city, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY city;

-- Q25. Find the average salary for each city.
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

-- Q26. Find cities having more than 2 employees.
SELECT city, COUNT(employee_id) AS employee_count
FROM employees
GROUP BY city
HAVING employee_count > 2;

-- Q27. Find departments where the average salary is greater than 60,000.
SELECT d.department_name, AVG(e.salary) AS average_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING average_salary > 60000;

-- Q28. Find departments where the total salary is greater than 150,000.
SELECT d.department_name, SUM(e.salary) AS total_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING total_salary > 150000;

-- Section D — Constraints

-- Q29. Create the students table using the following constraints:
-- student_id PRIMARY KEY, student_name NOT NULL, email UNIQUE, age CHECK (age >= 18), and city DEFAULT 'Hyderabad'.

CREATE TABLE students (
student_id INT PRIMARY KEY,
student_name VARCHAR (100) NOT NULL,
email_id VARCHAR (30) UNIQUE,
age INT CHECK (age >= 18),
city VARCHAR (30) DEFAULT "Hyderabad"
);

-- Q30. Insert a valid student record into the students table.

INSERT INTO students
(student_id, student_name, email_id, age, city)
VALUES
(01, 'John', 'John@gmail.com', 20, 'Nanded');

-- Q31. Attempt to insert two students with the same student_id. Identify the constraint that is violated.
INSERT INTO students
(student_id, student_name, email_id, age, city)
VALUES
(02, 'Bob', 'Bob@gmail.com', 23, 'Bangalore'),
(02, 'George', 'George@gmail.com', 25, 'Delhi');

-- Explanation : The PRIMARY KEY contraint is violated. PK should be unique and not null, duplicates are not allowed.
-- Error Code : 1062 Duplicate entry '02' for key 'students' PRIMARY
-- Note : Each table contains only one PRIMARY KEY.

-- Q32. Attempt to insert a student without providing student_name. Identify what happens.
INSERT INTO students
(student_id, student_name, email_id, age, city)
VALUES
(02, NULL, 'Bob@gmail.com', 23, 'Bangalore');

-- Explanation : The NOT NULL contraint is violated. It ensures column does not contains NULL values.
-- Error Code : 1048 Column 'student_name' cannot be null
-- Note : Null values means Empty or no values.


-- Q33. Attempt to insert a student whose age is 15. Identify the constraint that is violated.
INSERT INTO students
(student_id, student_name, email_id, age, city)
VALUES
(02, 'Bob', 'Bob@gmail.com', 15, 'Bangalore');

-- Explanation : The CHECK contraint is violated. It ensures the value or entry meets the specific requirement. 
-- Error Code : 3819 Check contraint 'student_chk_1' is violated
-- Note : It allows only those values , which satisfy the given condition. So the age should be greater than or equal to 18

-- Q34. Insert a student without specifying city. Verify the value assigned by the DEFAULT constraint.
INSERT INTO students
(student_id, student_name, email_id, age)
VALUES
(02, 'Bob', 'Bob@gmail.com', 27);

-- Explanation : When we use 'DEFAULT' constraint, it gives a default value , when not provided by the users.
-- Example : If the data is about the population living in india , then we can set the country by default to INDIA
-- Note : If the user does not provide any value , it takes default value and run the program safely without throwing an error.

-- Section E — JOINs

-- Q35. Display employee name and department name.
SELECT e.employee_name, d.department_name
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id;

-- Q36. Display employee name, salary, department name, and department location.
SELECT employee_name, department_name, salary, location
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;


-- Q37. Display all employees, including employees who do not belong to any department.
SELECT e.employee_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id;

-- Q38. Display all departments, including departments that have no employees.
SELECT d.department_name, e.employee_name
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id;

-- Q39. Find employees working in the Data Science department.
SELECT e.employee_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id= d.department_id
WHERE d.department_name = 'Data Science';

-- Q40. Find employees working in departments located in Hyderabad.
SELECT e.employee_name, d.department_name, location
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id= d.department_id
WHERE location = 'Hyderabad';

-- Q41. Find the number of employees in each department using JOIN and GROUP BY.
-- Include departments with zero employees.

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q42. Find the average salary for each department using JOIN and GROUP BY.
SELECT d.department_name, AVG(salary) AS average_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Section F — Subqueries

-- Q43. Find employees whose salary is greater than the overall average salary.
SELECT employee_name, salary
FROM employees
WHERE salary >
(SELECT AVG(salary) FROM employees);

-- Q44. Find the employee with the highest salary using a subquery.
SELECT employee_name, salary 
FROM employees 
WHERE salary =
(SELECT MAX(salary) FROM employees);

-- Q45. Find employees who earn the same salary as Alice.
SELECT employee_name, salary
FROM employees
WHERE salary =
(SELECT salary FROM employees
WHERE employee_name ='Alice');

-- Q46. Find employees who earn more than Alice.
SELECT employee_name, salary
FROM employees
WHERE salary >
(SELECT salary FROM employees
WHERE employee_name ='Alice');

-- Q47. Find employees who earn more than the average salary of their own department.
SELECT employee_name, salary
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.salary >
(
SELECT AVG(e.salary) AS avg_dept_salary
FROM employees AS e
WHERE e.department_id = d.department_id
);

-- Section G — Mixed SQL

-- Q48. Find the department with the highest average salary.
SELECT d.department_name, AVG(salary) AS highest_avg_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY highest_avg_salary DESC
LIMIT 1;

-- Q49. Display each department with department name, employee count, average salary, maximum salary, minimum salary, and total salary.
-- Include departments with zero employees.
SELECT d.department_name,
COUNT(e.employee_id) AS employee_count,
SUM(e.salary) AS total_salary,
AVG(e.salary) AS average_salary,
MAX(e.salary) AS highest_salary,
MIN(e.salary) AS lowest_salary
FROM departments AS d
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q50. Find employees who satisfy all conditions: salary greater than 55,000;
 -- city is Hyderabad or Bangalore; employee belongs to a valid department; 
 -- and employee salary is greater than the average salary of their department.
 SELECT e.employee_name, d.department_name, e.salary, e.city
 FROM employees AS e
 INNER JOIN departments AS d
 ON e.department_id = d.department_id
 WHERE e.salary > 55000 AND e.city IN ('Hyderabad','Bangalore')
 AND e.salary > (
 SELECT AVG(e.salary) 
 FROM employees AS e
 WHERE e.department_id = d.department_id );