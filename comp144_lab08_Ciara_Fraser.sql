/* COMP 144 Lab 08 
Author: Ciara Fraser
Date: November 14, 2023
*/

/* QUERY 1 - Find number of records in employees table */
select COUNT(*) FROM employees;

/* QUERY 2 - Display the first 5 employees from the employees table */
Select CONCAT(first_name," ", last_name) AS "Employee Name" FROM employees LIMIT 5;

/* QUERY 3 - Display all employees whose last name starts with "L". Display first name, last name
	and department ID. Protect against upper/lower case anomalies. */
SELECT first_name, last_name, department_id 
FROM employees
WHERE last_name LIKE upper('L%');


/* QUERY 4 - Display all employees who have a salary that is less than 2500 per month. 
	Display first name and last name concatenated with the title "Poor Employees" as well as the salary
    	Order the salaries descending. */
SELECT concat(first_name, " ", last_name) AS "Poor Employees", salary
FROM employees WHERE salary<2500 ORDER BY salary desc;

/* QUERY 5 - Display all the employee phone numbers that start with area code 603
	include first name, last name (concatenated as "Full Name") and phone number */
SELECT CONCAT(first_name," ", last_name) AS "Full Name", phone_number 
FROM employees
WHERE phone_number LIKE '603%';

/* QUERY 6 - Display all the distinct department names from the departments table
	that have the word "sales" */
SELECT distinct department_name
FROM departments 
WHERE DEPARTMENT_NAME LIKE '%sales%';


/* QUERY 7 - Display the first name, department id, and salary from employees whose name begins 
	with A. Protect against upper/lowercase anomalies. Order results by descending department id. */
SELECT first_name, department_id, salary
FROM employees
WHERE first_name LIKE lower('A%')
ORDER BY department_id desc;

/* QUERY 8 - Write a query to display the first name, last name, and department name for all employees 
	in departments 40, 60 and 110 in alphabetical order by last name. HINT: simple JOIN */
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees 
JOIN departments
ON employees.department_id=departments.department_ID
WHERE departments.department_id IN ('40','60','110')
ORDER BY last_name;


/* QUERY 9 - Display the job title and yearly salary (monthly salary * 12) for all employees who have a monthly salary
	more than 12000. Display their first and last name concatenated with a heading of "Rich Employees".
   	 Display their yearly salary as "Yearly Salary" HINT: simple JOIN */ 

SELECT  jobs.job_title, CONCAT(employees.first_name," ", employees.last_name) AS "Rich Employees", salary*12 AS "Yearly Salary"
FROM employees
JOIN jobs
ON jobs.job_id=employees.job_id
WHERE salary>12000;




