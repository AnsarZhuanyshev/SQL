CREATE TABLE IF NOT EXISTS dentists(
	dentist_id varchar(5),
	dentist_name varchar(128),
	PRIMARY KEY (dentist_id)
)

INSERT INTO dentists(dentist_id,dentist_name) 
VALUES ('D1011','Roger'),
	   ('D1025','Helen'),
	   ('D1035','Peter')
	   
CREATE TABLE IF NOT EXISTS patients(
	patient_id varchar(4),
	patient_name varchar(128),
	PRIMARY KEY (patient_id)
)

INSERT INTO patients(patient_id,patient_name)
VALUES('P100','Smith'),
	  ('P105','Bell'),
	  ('P110','Helen')
	  
CREATE TABLE IF NOT EXISTS surgery(
	surgery_no varchar(3),
	surgery_name varchar(128),
	PRIMARY KEY (surgery_no)
)

INSERT INTO surgery(surgery_no,surgery_name)
VALUES('S1','Pulpotomy'),
	  ('S2','Pulpectomy'),
	  ('S11','Apicoectomy')
	  
CREATE TABLE IF NOT EXISTS appointment(
	appointment_date date,
	appointment_time varchar(128)
)


CREATE TABLE doctor_surgery(
	dentist_id varchar(5),
	surgery_no varchar(3),
	FOREIGN KEY (dentist_id)
	REFERENCES dentists(dentist_id),
	FOREIGN KEY (surgery_no)
	REFERENCES surgery(surgery_no)
);


ALTER TABLE IF EXISTS doctor_surgery
ADD PRIMARY KEY  (dentist_id,surgery_no) 

ALTER TABLE IF EXISTS appointment 
--ADD COLUMN patient_id varchar(4) 
--ADD COLUMN dentist_id varchar(5)
/*ADD FOREIGN KEY (dentist_id) REFERENCES dentists(dentist_id)
ADD FOREIGN KEY (patient_id) REFERENCES patients(patient_id)*/
ADD CONSTRAINT Order_to_Doctor PRIMARY KEY (dentist_id,appointment_date,appointment_time)

INsErt INTO doctor_surgery(dentist_id,surgery_no)
VALUES ('D1011','S1'),
		('D1011','S2'),
		('D1025','S11'),		
		('D1035','S2')
		
INSERT INTO appointment(appointment_date,appointment_time,dentist_id,patient_id)
VALUES('2018-10-02','10:00am','D1011','P100'),
	  ('2018-10-03','11:00am','D1011','P110'),
	  ('2018-10-05','10:00am','D1025','P105'),
	  ('2018-10-10','10:00am','D1025','P105'),
	  ('2018-10-15','10:00am','D1035','P110')	
	  
	  
SELECT * FROM 

SELECT appointment_date,appointment_time,patient_id,t_2.dentist_id,surgery_no FROM appointment
INNER JOIN (SELECT dentists.dentist_id,surgery_no FROM dentists
			INNER JOIN doctor_surgery AS t_1
			ON t_1.dentist_id = dentists.dentist_id) AS t_2 
ON appointment.dentist_id = t_2.dentist_id
