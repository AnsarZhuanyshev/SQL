SELECT * FROM employees;
SELECT * FROM departments;
select * from job_grades 
select * from locations
select * from countries
/*
ALTER TABLE employees
DROP COLUMN department_id

ALTER TABLE employees
ADD department_id numeric
*/

UPDATE employees
SET department_id = 10
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'AD' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'AD')

UPDATE employees
SET department_id = 20
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'MK' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'MK')

UPDATE employees
SET department_id = 50
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'SH' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'SH')

UPDATE employees
SET department_id = 60
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'IT' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'IT')

UPDATE employees
SET department_id = 80
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'SA' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'SA')

UPDATE employees
SET department_id = 110
WHERE (substring(job_id FROM 0 FOR strpos(job_id,' ')) = 'AC' or substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'AC')

/* PROBLEM 1 */--6333.3333
SELECT  * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees
			   WHERE substring(job_id FROM 0 FOR strpos(job_id,'_')) = 'IT') 
ORDER BY salary DESC

/* PROBLEM 2 */
SELECT DISTINCT(salary),full_name,department_id,job_id FROM employees 
WHERE (salary IN (SELECT min(salary) FROM employees
				GROUP BY department_id)) AND department_id = department_id
GROUP BY department_id,full_name,salary,job_id
ORDER BY department_id DESC

/* PROBLEM 3 */
--SELECT TO_CHAR (NOW()::DATE , 'MON dd , yyyy')
--SELECT * FROM departments
SELECT * FROM departments 
WHERE manager_id = (SELECT employe_id FROM employees 
					WHERE hire_dat = (SELECT min(hire_dat) FROM employees 
										INNER JOIN departments ON employees.employe_id = departments.manager_id))
/* PROBLEM 4 */
SELECT * FROM employees 
WHERE length(CONCAT(SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')),
					SUBSTRING(full_name FROM strpos(full_name,' ')+1 FOR length(full_name)))) 
						= (SELECT max(f_name) FROM(
											SELECT full_name,length(CONCAT(SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')),
					   													SUBSTRING(full_name FROM strpos(full_name,' ')+1 FOR length(full_name)))) as f_name FROM employees) as max_length)

/* PROBLEM 5 */
SELECT round(AVG(salary)) FROM employees
WHERE department_id = 
(SELECT department_id FROM (SELECT department_id,COUNT(department_id) as number_of_depo FROM employees 
								GROUP BY department_id) as tabl 
WHERE number_of_depo = (SELECT max(number_of_depo) as max_num FROM
								(SELECT department_id,COUNT(department_id) as number_of_depo FROM employees 
								GROUP BY department_id) as max_num_of_depo))

/* PROBLEM 6 */
SELECT job_id,department_id FROM employees 
WHERE department_id IN
			(SELECT department_id FROM (SELECT MIN(salary) as min_salary_for_each,department_id FROM employees
										GROUP BY department_id) as need_info
			WHERE min_salary_for_each > (SELECT MIN(salary) as min_salary FROM employees 
										WHERE department_id = 50 ))
/* PROBLEM 7 */
SELECT MAX(average_for_each) FROM
(SELECT AVG(salary) as average_for_each FROM employees
GROUP BY department_id) as max_of_avg

/* PROBLEM 8 */
SELECT full_name,department_name FROM departments
						INNER JOIN employees ON departments.department_id = employees.department_id
						
/* PROBLEM 9 */
SELECT department_id,department_name FROM departments 
WHERE department_id NOT IN
		(SELECT department_id FROM employees
		GROUP BY department_id) 
	
/* PROBLEM 10 */
SELECT full_name,gra FROM job_grades 
INNER JOIN employees ON salary 
BETWEEN lowest_sal AND highest_sal

/* PROBLEM 11 */
SELECT full_name,job_id,department_name,hire_dat FROM (SELECT employe_id,full_name,job_id,department_name,hire_dat FROM employees 
														INNER JOIN departments ON employees.department_id = departments.department_id
														WHERE hire_dat IN (SELECT hire_dat FROM employees
														WHERE hire_dat 
														BETWEEN '1995-01-01' AND '2021-02-11'
														ORDER BY hire_dat) ) as table_hire_dat
INNER JOIN (SELECT employe_id,gra FROM (SELECT employe_id,gra FROM job_grades 
			INNER JOIN employees ON salary 
			BETWEEN lowest_sal AND highest_sal) as  GPA
			WHERE gra = ('A') OR gra = ('B') OR gra = ('C')) as table_gpa
ON table_hire_dat.employe_id = table_gpa.employe_id

/* PROBLEM 12 */
SELECT full_name,loc_name FROM employees 
INNER JOIN (SELECT loc_name,department_id FROM locations 
			INNER JOIN departments ON departments.location_id = locations.loc_id) as table_1
ON employees.department_id = table_1.department_id

/* PROBLEM 13 */
SELECT full_name,loc_name,ROUND(0.1*salary) as montly_pension_contribution,ROUND(1.2*salary) as annual_pension_contribution,
0.09*salary as medicine_contribution
FROM employees 
INNER JOIN (SELECT loc_name,department_id FROM locations 
			INNER JOIN departments ON departments.location_id = locations.loc_id) as table_1
ON employees.department_id = table_1.department_id

/* PROBLEM 14 */
SELECT loc_name,AVG(salary) FROM 
(SELECT full_name,loc_name,salary FROM employees
INNER JOIN (SELECT department_id,loc_name FROM departments 
 			INNER JOIN locations ON departments.location_id = locations.loc_id) as table_1  
ON employees.department_id = table_1.department_id) as t_2
GROUP BY loc_name
ORDER BY AVG(salary) DESC
LIMIT 3 

/* PROBLEM 15 */
SELECT * FROM (SELECT * FROM employees 
				WHERE department_id = (SELECT department_id FROM employees 
					   					WHERE employe_id = 142 OR employe_id = 144
					   					LIMIT 1)) as t_11
WHERE employe_id NOT IN (SELECT manager_id FROM departments 
						INNER JOIN (SELECT * FROM employees 
									WHERE department_id = (SELECT department_id FROM employees 
					   										WHERE employe_id = 142 OR employe_id = 144
					   										LIMIT 1)
		   							LIMIT 1 ) as t_1 
						ON departments.department_id = t_1.department_id) AND employe_id != 142  AND employe_id != 144
						
/* PROBLEM 16 */
SELECT * FROM employees 
WHERE department_id IN (SELECT department_id FROM (SELECT department_id,loc_name FROM departments 
												INNER JOIN locations ON departments.location_id = locations.loc_id) as t_1
						WHERE loc_name = 'Kyoto')
						
/* PROBLEM 17 */
SELECT * FROM employees 
WHERE employe_id NOT IN (SELECT employe_id FROM departments 
						INNER JOIN employees ON employees.employe_id = departments.manager_id)
						
/* PROBLEM 18 */
SELECT employe_id,full_name,loc_name FROM 
								(SELECT employe_id,full_name,location_id FROM departments 
								INNER JOIN (SELECT employe_id,full_name,department_id FROM employees
											WHERE employe_id = 174) as t_1 
								ON departments.department_id = t_1.department_id) as t_2 
INNER JOIN locations ON locations.loc_id = t_2.location_id

/* PROBLEM 19 */
SELECT employe_id,full_name,num_of_s FROM employees 
INNER JOIN (SELECT manager_id,num_of_s FROM departments 
			INNER JOIN(SELECT t_man.department_id,em_num-man_num as num_of_s FROM (SELECT department_id,COUNT(manager_id) as man_num FROM departments 
																				GROUP BY department_id) t_man 
						INNER JOIN (SELECT department_id,COUNT(employe_id) as em_num FROM employees 
									GROUP BY department_id) t_em 
						ON t_man.department_id = t_em.department_id) as t_1 
			ON departments.department_id = t_1.department_id) as t_2
ON t_2.manager_id = employees.employe_id

/* PROBLEM 20 */
SELECT employe_id,full_name,employees.department_id as worker_depo,departments.department_id as own_depo FROM employees 
INNER JOIN departments ON employees.employe_id = departments.manager_id
AND employees.department_id != departments.department_id

/* PROBLeM 21 */
SELECT country_name,loc_name,num_of_d FROM
									(SELECT country_id,loc_name,COUNT(d_id) as num_of_d FROM locations 
									INNER JOIN (SELECT t_1.department_id as d_id,location_id as loc_id FROM (SELECT department_id,COUNT(employe_id) as num_of_em FROM employees
																											GROUP BY department_id) as t_1
												INNER JOIN departments ON departments.department_id = t_1.department_id
												WHERE num_of_em>=2) as t_2
									ON t_2.loc_id = locations.loc_id
									GROUP BY loc_name,country_id) as t_3
INNER JOIN countries ON countries.country_id = t_3.country_id

/* PROBLEM 22 */
SELECT employe_id,full_name,hire_dat,loc_name,country_name FROM countries 
INNER JoIN (SELECT employe_id,full_name,hire_dat,loc_name,country_id FROM locations 
			INNER JOIN (SELECT employe_id,full_name,hire_dat,location_id FROM departments 
						INNER JOIN (SELECT * FROM employees 
									WHERE salary >= (SELECT AVG(salary) FROM employees ) 
													AND LOWER(CONCAT(SUBSTRING(full_name FROM 0 FOR 2),SUBSTRING(full_name FROM strpos(full_name,' ')+1 FOR length(full_name)))) = LOWER(email)) as t_1
						ON t_1.employe_id = departments.manager_id) as t_2
			ON t_2.location_id = locations.loc_id
			ORDER BY hire_dat,loc_name) as t_3 
ON t_3.country_id = countries.country_id
WHERE employe_id%5=0 
ORDER BY hire_dat
