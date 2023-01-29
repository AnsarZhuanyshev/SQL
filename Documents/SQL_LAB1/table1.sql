CREATE TABLE IF NOT EXISTS EMPLOYEES
(Employe_Id SERIAL PRIMARY KEY,
 FULL_NAME character varying(128) NOT NULL,
 EMAIL varchar(128) NOT NULL,
 PHONE_NUMBER character varying(128) NOT NULL,
 HIRE_DAT date,
 JOB_ID varchar(128) NOT NULL,
 SALARY integer
);
INSERT INTO employees VALUES (100,'Steven King','SKING','515.123.4567','1987-06-17','AD_PRES',24000);
INSERT INTO employees VALUES (101,'Neena Kochhar','NKOCHAR','515.123.4568','1989-09-21','AD_VP',17000);
INSERT INTO employees VALUES (103,'Alexander Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000);
INSERT INTO employees VALUES (104,'Bruce Ernst','BENST','590.423.4568','1991-05-21','IT_PROG',6000);
INSERT INTO employees VALUES (107,'Diana Lorentz','DLORENTZ','590.423.5565','1999-02-07','IT_PROG',4000);
INSERT INTO employees (employe_id,full_name,email,phone_number,hire_dat,job_id,salary)
VALUES 	  (124,'Kevin Mourgos','KNOURGOS','650.123.5234','1999-11-16','SH MAN',5800),  
          (141,'Trenna Rajs','TRAJS','650.121.8009','1995-10-17','SH CLERK',3500),
          (142, 'Curtis Davies', 'CDAVIES', '650.121.2996', '1997-01-29', 'SH CLERK',3100),  
          (143, 'Randall Matos', 'RMATOS', '650.121.2874', '1998-03-15', 'SH CLERK',2600),  
          (144, 'Peter Vargas', 'PVARGAS', '650.121.2004', '1998-07-09', 'SH CLERK',2500),  
          (149, 'Eleni Zlotkey', 'EZLOTKEY', '011.44.1344.429010', '2000-01-29', 'SA MAN',7000),  
          (174, 'Ellen Abel', 'ABELL', '011.44.1644.429267', '1996-05-11', 'SA REP',11000),  
          (176, 'Jonathon Taylor', 'JTAILOR', '011.44.1644.429265', '1998-03-24', 'SA REP', 8600), 
          (178, 'Kimberely Grant', 'KGRANT', '011.44.1644.429263', '1999-05-24', 'SA REP',7000),  
          (200, 'Jennifer Whalen', 'JWHALEN', '515.123.4444', '1987-07-19', 'AD ASST',4001), 
          (201, 'Michael Hartstein', 'MHARTSTE', '515.123.5555', '1996-02-17', 'MK MAN',13000), 
          (202, 'Pat Fay', 'PFAY', '603.123.6666', '1997-08-17', 'MK REP', 6000), 
          (205, 'Shelley Higgins', 'SHIGGINS', '515.123.8080', '1994-06-07', 'AC MGR',12000), 
          (206, 'William Gietz', 'WGIETZ', '515.123.8181', '1994-06-07', 'AC_ACCOUNT',8300);
SELECT * FROM employees;

/* problem 1 */
SELECT employe_id,full_name,hire_dat,salary FROM employees;

/* problem 2 */
SELECT employe_id AS id,full_name,email,12*salary AS annual_salary FROM employees;

/* problem 3 */
SELECT DISTINCT job_id FROM employees;

/* problem 4 */
SELECT * FROM employees
WHERE salary>5000 AND job_id='IT_PROG';

/* problem 5 */
SELECT employe_id,full_name,job_id FROM employees
WHERE salary BETWEEN 4000 AND 7000;

/* problem 6 */
SELECT full_name,salary FROM employees
WHERE salary NOT BETWEEN 3000 AND 9000;

/* problem 7*/
SELECT employe_id , 
	SUBSTRING(full_name FROM strpos(full_name,' ')+1 FOR length(full_name)) AS surnames,
	SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')) AS firstnames ,
	salary*12 FROM employees
WHERE salary*12<50000;
--SELECT length(full_name) FROM employees;

/* problem 8*/
SELECT employe_id,full_name,salary FROM employees
WHERE salary>4000 AND salary<7000;

/* problem 9*/
SELECT employe_id,full_name,salary,job_id FROM employees
WHERE employe_id in (144,102,200,205);

/* problem 10 */
SELECT employe_id,full_name,salary,job_id FROM employees
WHERE employe_id NOT IN (144,102,200,205);

/* problem 11 */
SELECT employe_id,full_name,salary FROM employees
WHERE full_name LIKE '% _a%';

/* problem 12 */
SELECT SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')) AS employee_name FROM employees
WHERE SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')) LIKE '__a%';

/* problem 13 */
SELECT employe_id,full_name,email,salary FROM employees
WHERE concat(SUBSTRING(LOWER(full_name) FROM 0 FOR 2),SUBSTRING(LOWER(full_name) FROM strpos(full_name,' ')+1 FOR LENGTH(full_name))) = LOWER(email);
--SELECT concat(SUBSTRING(LOWER(full_name) FROM 0 FOR 2),SUBSTRING(LOWER(full_name) FROM strpos(full_name,' ')+1 FOR LENGTH(full_name))) from employees;
--LOWER(full_name),LOWER(email) FROM employees;

/* problem 14 */
SELECT employe_id,full_name,email,salary FROM employees 
ORDER BY salary ASC,hire_dat DESC;

/* problem 15 */
SELECT employe_id,full_name,salary FROM employees
ORDER BY employe_id DESC;

/* problem 16  */
SELECT AVG(salary) as average_salary,MAX(salary) as max_salary,MIN(salary) as min_salary ,SUM(salary) as sum_salary FROM employees;

/* problem 17 */
SELECT * FROM employees
WHERE (SUBSTRING(phone_number FROM 0 FOR 2) = SUbSTRING(phone_number FROM LENGTH(phone_number) FOR LENGTH(phone_number)));
--SELECT SUBSTRING(phone_number FROM LENGTH(phone_number) FOR LENGTH(phone_number)) FROM employees;

/* problem 18 */
SELECT COUNT(DISTINCT job_id) as number_of_unique_jobs FROM employees;

/* problem 19 */
SELECT SUM(salary) FROM employees 
GROUP BY job_id;

/* problem 20 */
SELECT ROUND(AVG(salary),1) FROM employees 
GROUP BY job_id;

/* problem 21 */
SELECT job_id,MAX(salary) FROM employees 
WHERE salary>10000
GROUP BY job_id
ORDER BY MAX(salary) DESC;
--ORDER AND GROUP can work only with the same columns in quary

/* problem 22 */
SELECT MAX(avg_of_each)
FROM (SELECT ROUND(AVG(salary),1) as avg_of_each 
	  FROM employees
	  GROUP by job_id) as MAXIMUM;
	  
/* problem 23 */
SELECT full_name,salary as earn_salary_per_month,3*salary as wanted_salary FROM employees;

/* problem 24 */
SELECT full_name,LENGTH(full_name) as number_of_letters FROM employees;

/* problem 25 */
SELECT SUBSTRING(full_name FROM 0 FOR strpos(full_name,' ')) as first_name FROM employees;

/* problem 26 */
SELECT SUBSTRING(full_name FROM 1 FOR 3)as three_letters_of_name FROM employees;

/* problem 27 */
SELECT LOWER(REVERSE(SUBSTRING(full_name FROM 1 FOR LENGTH(full_name)))) FROM employees;

/* problem 28 */
SELECT REPLACE(full_name,'en','yu') FROM employees;

/* problem 29 */
SELECT UPPER(full_name) FROM employees;

/* problem 30 */
SELECT 12*ROUND(avg_val,-1) as annual_salary_for_each_depo,jobs_id
FROM( SELECT AVG(salary) as avg_val,job_id as jobs_id FROM employees
	WHERE (salary BETWEEN 4000 AND 12000) AND (SUBSTRING(job_id FROM 0 FOR 2) !='A') AND (SUBSTRING(job_id FROM 0 FOR strpos(job_id,'_')) !='IT')
	GROUP BY job_id
	ORDER BY AVG(salary) DESC) as MAX_AVG;