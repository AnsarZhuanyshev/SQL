CREATE TABLE IF NOT EXISTS departments(
	Department_id integer NOT NULL,
	Department_name character varying (128) UNIQUE NOT NULL,
	Manager_id integer,
	Location_id integer
);

INSERT INTO departments (Department_id,Department_name,Manager_id,Location_id)
VALUES (10,'Administration',200,1700),
(20,'Marketing',201,1800),
(50,'Shipping',124,1500),
(60,'IT',103,1400),
(80,'Sales',149,2500),
(90,'Executive',100,1700),
(110,'Accounting',205,1700);

INSERT INTO departments (Department_id,Department_name,Location_id)
VALUES (190,'Contracting',1700)
SELECT * FROM departments;
