/* COMP 144 Lab 10
Author: Ciara Fraser
Date: November 28, 2023
*/

/*** QUERY 1 ***/ 
/* Write a query to display the number of people with the same job. Use JOB_ID 
in your query and list the jobs by JOB_ID along with the number of people having
that job.*/ 
select j.job_id, count(e.employee_id)
from employees j, employees e
WHERE e.employee_ID=j.EMPLOYEE_ID
group by j.job_id;



/*** QUERY 2 ***/ 
/* Write a query to display the maximum, minimum, sum, and average 
salary for each job type  (assume each job_id represents a job type). Be 
sure to give the job type in your output.*/
/*select j.job_id, j.max_salary, j.min_salary, sum(e.salary), avg(e.salary)
from jobs j, employees e
WHERE j.job_id=e.job_id
group by job_id;*/

SELECT j.job_id as "Job Type", j.MIN_SALARY, j.max_salary, e.salary, SUM(e.salary), FORMAT(AVG(e.salary),2)
FROM jobs j
JOIN employees e
on j.job_id=e.job_id
group by j.job_id;

/*** QUERY 3 ***/
/* Write a query to display the department name (NAME, not ID),
number of people, total salary and average salary for each department that has an 
overall monthly payroll that is more than $20000. For your results, round each dollar amount 
to 2 decimal places and put a "$" in front, Give the headings "Number of People", "Total Salary"
and "Avg Salary" for each respective column. Results must be displayed by total salary descending */

select d.department_name, COUNT(e.employee_id) as "Number of People", CONCAT('$',FORMAT(SUM(e.salary),2)) as "Total Salary", CONCAT("$",FORMAT (avg(e.salary),2)) as "Avg Salary"
FROM departments d, employees e
WHERE d.department_id=e.DEPARTMENT_ID AND e.salary>20000
group by d.department_name;

/*** QUERY 4 ***/ 
/* Display the manager number and the salary of the lowest paid employee for 
that manager. Exclude anyone whose manager is not known - in other words, 
exclude anyone who has a NULL manager_id. Exclude any groups that have a minimum salary 
that is less than $5000 */

/*select e.manager_id, j.min_salary
from employees e, jobs j
WHERE e.job_id=j.job_id AND j.min_salary>5000 AND e.manager_id is not null
group by e.manager_id;*/

select e.manager_id, j.min_salary
from employees e
JOIN jobs j
on e.job_id=j.job_id
group by e.manager_id
having j.min_salary>500 AND e.manager_id is not null;

/*** QUERY 5 ***/
/* USING A SUBQUERY, Write a query that will display the last name and salary of every 
employee who reports to Gerald Cambrault. (There is more than one 
Cambrault in the database so you must be careful to check the first 
name too.) Be sure to handle case. */

SELECT last_name, salary
FROM employees
WHERE manager_id =
(SELECT manager_id
FROM employees
WHERE upper(last_name) = 'CAMBRAULT' AND upper(first_name) = "GERALD");

/*** QUERY 6 ***/
/* You have been hired by this company in the IT department as a programmer.
INSERT a new record in to the employees table for yourself. Add your name with the following info:
employee_id - 220
first_name - your name
last_name - your name
phone_number - your phone number
email - your email
job_id - "IT_PROG"
salary - 4200
commission - 0
manager_id - 145
department_id - 60 */


INSERT into employees (employee_id, first_name, last_name, phone_number, email, job_id, salary, commission_pct, manager_id, department_id, hire_date)
values 					(220, "Ciara", "Fraser", 7786798000, "ciarahfraser@outlook.com", "IT_PROG", 4200, 0, 145, 60, 11/28/2023);


/*** QUERY 7 ***/
/* Write a query to show all of the information for yourself, including department name, job name, city, and manager
name (concatenate first name and last name with a heading of "Manager") */

/*select e.*, d.department_name, j.job_title, l.city, concat(m.first_name," ",m.last_name) as "Manager"
 from employees e, employees m, departments d, jobs j, locations l
where e.employee_id=m.manager_id AND e.department_id=d.department_id AND e.job_id=j.job_id AND l.location_id=d.location_ID;*/
 
 SELECT e.*, d.department_name, j.job_title, l.city, concat(m.first_name, " ", m.last_name) as "Manager"
 FROM employees e, departments d, jobs j, locations l JOIN employees m
 where m.employee_id=e.manager_id AND e.department_id=e.department_id AND j.job_id=e.job_id AND l.location_id=d.location_id
 group by e.employee_ID
 HAVING e.employee_id=220;
 

 
 
 

/*** QUERY 8 ***/
/* You put in the wrong employee number for yourself. Write a query to change the employee number from 220 to 222
Display the resulting changes by displaying employee id, first name and last name (concatenated with a title "Full Name"),
department id, and manager id. */

UPDATE employees 
SET employee_id = 222
WHERE employee_id=220;

SELECT employee_id, CONCAT(first_name, "  ", last_name) as "Full name", department_id, manager_id
FROM employees
WHERE employee_id=222;

/*** QUERY 9 ***/
/* Your company isn't doing well and is cutting back on staff. You are the first to be let go. Delete yourself
from the employees table. Show proof that the record for you is no longer in the employees table. */

delete from employees where EMPLOYEE_ID=220;

select * from employees where employee_id=220;