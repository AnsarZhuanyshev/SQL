CREATE TABLE IF NOT EXISTS student(
	Student_id integer,
	Adress varchar (128),
	Department varchar(128),
	PRIMARY KEY (student_id)
);

CREATE TABLE IF NOT EXISTS Course(
	course_code varchar(128),
	course_name varchar (128),
	PRIMARY KEY (course_code)
);

CREATE TABLE IF NOT EXISTS lecturer(
	lecturer_id integer,
	lecturer_name varchar (128),
	PRIMARY KEY (lecturer_id)
)
;
CREATE TABLE IF NOT EXISTS table_1(
	Student_id integer,
	course_code varchar (128),
	lecturer_id integer,
	FOREIGN KEY (Student_id) REFERENCES student(Student_id),
	FOREIGN KEY (course_code) REFERENCES Course(course_code),
	FOREIGN KEY (lecturer_id) REFERENCES lecturer(lecturer_id)
);
DROP TABLE table_1
ALTER TABLE IF EXISTS table_1
ADD CONSTRAINT uniq_info PRIMARY KEY (student_id,course_code,lecturer_id)

INSERT INTO student (Student_id,Adress,Department)
VALUES (202101234,'Nicosia','COM')

INSERT INTO Course (course_code,course_name)
VALUES ('ECC202','DBMS'),
	   ('ECC002','System Simulation'),
	   ('COM490','Graduation project')
	   

INSERT INTO  lecturer(lecturer_id,lecturer_name)
VALUES (1234,'John'),
	   (4567,'Ali'),
	   (6789,'Mary')


INSERT INTO table_1 (student_id,course_code,lecturer_id)
VALUES (202101234,'ECC202',1234),
	   (202101234,'ECC002',1234),
	   (202101234,'COM490',1234),
	   (202101234,'ECC202',4567),
	   (202101234,'ECC002',4567),
	   (202101234,'COM490',4567),
	   (202101234,'ECC202',6789),
	   (202101234,'ECC002',6789),
	   (202101234,'COM490',6789)
	   
	   
SELECT * FROM student
SELECT * FROM course
SELECT * FROM lecturer
SELECT * FROM table_1

SELECT student_id,adress,department,course_code,course_name,table_3.lecturer_id,lecturer_name FROM lecturer
INNER JOIN (SELECT student_id,adress,department,table_2.course_code,course_name,lecturer_id FROM course
			INNER JOIN (SELECT student.student_id,adress,department,course_code,lecturer_id FROM student
						INNER JOIN table_1
						ON table_1.student_id = student.student_id) as table_2
			ON table_2.course_code=course.course_code) AS table_3
ON table_3.lecturer_id = lecturer.lecturer_id








