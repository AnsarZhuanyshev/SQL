CREATE TABLE IF NOT EXISTS JOB_GRADES(
GRA varchar(128) UNIQUE NOT NULL,
LOWEST_SAL int,
HIGHEST_SAL int
);

INSERT INTO JOB_GRADES(GRA,LOWEST_SAL,HIGHEST_SAL)
VALUES ('A',1000,2999),
	   ('B',3000,5999),
	   ('C',6000,9999),
	   ('D',10000,14999),
	   ('E',15000,24999),
	   ('F',25000,40000);
	   
SELECT * FROM JOB_GRADES;