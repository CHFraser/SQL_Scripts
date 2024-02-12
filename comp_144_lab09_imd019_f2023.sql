/* COMP 144 Lab 09 
Author: Ciara Fraser
Date: November 21, 2023
*/

/* QUERY 1 -  
Display each country name, and the region name associated 
with it for the region of Asia.  Protect against upper/lowercase anomalies.
*/
select c.country_name, r.region_name
from countries c
join regions r
on c.region_id=r.region_id
where r.region_name LIKE upper('ASIA%');


/* QUERY 2 - 
Write a query to display the first name, last name (concatenated, with the header "Full Name", 
job title, department id, and department name for all employees who work 
in Toronto. Be sure to handle case (i.e. upper and lower case) when checking 
for the correct city.  Use a function to force a proper case comparison. 
Order by ascending last name.
*/

select CONCAT(e.first_name, " ", e.last_name) as "Full Name", j.job_title, d.department_id, d.department_name
from employees e, departments d, locations l, jobs j
WHERE e.department_id=d.department_id AND e.job_id=j.job_id AND d.location_id-l.location_id 
AND UPPER(l.city)= "TORONTO"
ORDER BY e.last_name asc;




/* QUERY 3 - 
Write a query to find the addresses of all the departments that are in 
Canada, Italy and Japan. Please include location id, street address, 
city, state/province and country name
*/

select l.location_id, l.street_address, l.city, l.state_province, l.country_id
from locations l
JOIN countries c
ON c.country_id=l.country_id
WHERE c.country_name IN ('Canada','Italy','Japan');


/* QUERY 4 - 
Display the employee last name, employee number, and department name, along with their 
   manager's last name and manager number (in other words the manager's 
   employee id) for all employees whose last name begins with 'C' (be 
   sure to handle case - use a function).  Label the columns Employee, 
   Employee ID, Employee Dept, Manager, and Manager ID, respectively 
*/
SELECT e.last_name as "Employee", e.employee_id as "Employee ID", d.department_name as " Employee Dept", m.last_name as "Manager", m.manager_id as "Manager ID"
FROM employees e, departments d JOIN employees m 
WHERE m.employee_id=e.manager_id AND e.department_id=d.department_ID 
AND UPPER(e.last_name) LIKE ("C%");

/* QUERY 5 - 
Display the first name, last name (concatenated with the title "Full Name",
employee id, department id, job id, job title and time (in years) that 
the employee worked the job for all employees who are in department 90.
*/
select CONCAT(e.first_name," ", e.last_name) as "Full Name", e.employee_id, d.department_id, j.job_id, j.job_title, ROUND(datediff(jh.end_date,jh.start_date)/365) as "Years Worked"
FROM employees e, departments d, jobs j, job_history jh
WHERE e.department_id=d.department_id AND e.job_id=j.job_id AND jh.employee_id=e.employee_id
AND d.department_id IN ('90');






/* QUERY 6 - 
Display the first name, last name (concatenated with the title "Full Name"),
job title, department name, city, and country name, for all employees  in the 
Marketing department that do not work in the United States of America.
*/

select   CONCAT(e.first_name, " ", e.last_name) as "Full Name", j.job_title, d.department_name, l.city, c.country_name
FROM employees e, jobs j, departments d, locations l, countries c
WHERE e.department_id=d.department_id AND c.country_id=l.country_id AND d.location_id=l.location_id
AND UPPER(d.department_name) = ('MARKETING')
AND UPPER(c.country_name) != ('UNITED STATES OF AMERICA')
GROUP BY e.last_name;


