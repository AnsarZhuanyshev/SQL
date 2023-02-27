CREATE TABLE IF NOT EXISTS Ambulance
(
    Ambulance_num integer NOT NULL,
    price integer NOT NULL,
    CONSTRAINT Ambulance_pkey PRIMARY KEY (Ambulance_num)
);

CREATE TABLE IF NOT EXISTS Calls
(
    call_num bigserial NOT NULL,
    patient_id integer NOT NULL,
    phone_number varchar(128) NOT NULL,
    issue character varying(128),
    call_time date,
    receipt integer,
    CONSTRAINT Calls_pkey PRIMARY KEY (call_num)
);

CREATE TABLE IF NOT EXISTS Diagnose
(
    diagnose_name character varying(128) NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY (diagnose_name)
);

CREATE TABLE IF NOT EXISTS Doctors
(
    doctor_id integer NOT NULL,
    f_name character varying(128) NOT NULL,
    l_name character varying(128) NOT NULL,
    price integer NOT NULL,
    CONSTRAINT Doctors_pkey PRIMARY KEY (doctor_id)
);

CREATE TABLE IF NOT EXISTS Nurses
(
    Nurse_id integer NOT NULL,
    f_name character varying(128) NOT NULL,
    l_name character varying(128) NOT NULL,
    Doctor_id integer,
    price integer NOT NULL,
    CONSTRAINT Nurse PRIMARY KEY (Nurse_id)
);

CREATE TABLE IF NOT EXISTS Patient_diagnose
(
    Patient_id integer NOT NULL,
    Doctor_id integer NOT NULL,
    Diagnose character varying(128) NOT NULL,
    CONSTRAINT Patient_diagnose_pkey PRIMARY KEY (Patient_id, Doctor_id)
);

CREATE TABLE IF NOT EXISTS Patients
(
    Patient_id integer NOT NULL,
    f_name character varying(128) NOT NULL,
    l_name character varying(128) NOT NULL,
    card_no varchar(128),
    phone_number varchar(128) NOT NULL,
    adress character varying NOT NULL,
    CONSTRAINT Patients_pkey PRIMARY KEY (Patient_id)
);

CREATE TABLE IF NOT EXISTS Ambulance_Patients
(
    Ambulance_num integer NOT NULL,
    Patient_id integer NOT NULL
);

CREATE TABLE IF NOT EXISTS rooms
(
    room_num integer NOT NULL,
    price integer NOT NULL,
    from_date date,
    to_date date,
    capacity integer NOT NULL,
    diagnose character varying(128),
    PRIMARY KEY (room_num)
);

CREATE TABLE IF NOT EXISTS rooms_Diagnose
(
    room_num integer NOT NULL,
    diagnose_name character varying(128) NOT NULL,
    PRIMARY KEY (room_num, diagnose_name)
);

CREATE TABLE IF NOT EXISTS Bill
(
    Bill_No bigserial NOT NULL,
    patient_id integer,
    doctor_id integer,
    bill_time date,
    receipt integer,
    PRIMARY KEY (Bill_No)
);

ALTER TABLE IF EXISTS Calls
    ADD CONSTRAINT Calls_patient_id_fkey FOREIGN KEY (patient_id)
    REFERENCES Patients (Patient_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Nurses
    ADD CONSTRAINT Nurses_Doctor_id_fkey FOREIGN KEY (Doctor_id)
    REFERENCES Doctors (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Patient_diagnose
    ADD CONSTRAINT Patient_diagnose_Doctor_id_fkey FOREIGN KEY (Doctor_id)
    REFERENCES Doctors (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Patient_diagnose
    ADD CONSTRAINT Patient_diagnose_Patient_id_fkey FOREIGN KEY (Patient_id)
    REFERENCES Patients (Patient_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Patient_diagnose
    ADD FOREIGN KEY (Diagnose)
    REFERENCES Diagnose (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Ambulance_Patients
    ADD FOREIGN KEY (Patient_id)
    REFERENCES Patients (Patient_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Ambulance_Patients
    ADD FOREIGN KEY (Ambulance_num)
    REFERENCES Ambulance (Ambulance_num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS rooms_Diagnose
    ADD FOREIGN KEY (diagnose_name)
    REFERENCES Diagnose (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS rooms_Diagnose
    ADD FOREIGN KEY (room_num)
    REFERENCES rooms (room_num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Bill
    ADD FOREIGN KEY (patient_id)
    REFERENCES Patients (Patient_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS Bill
    ADD FOREIGN KEY (doctor_id)
    REFERENCES Doctors (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


INSERT INTO Patients (patient_id,f_name,l_name,card_no,phone_number,adress)
VALUES	(132,'Daniel','Cormier','4400430104042323','87778324253','Astana'),
		(123,'Francis','Ngannou','4402324275758483','87783239495','Almaty'),
		(122,'Ciryl','Gane','','87777773232','Pavlodar'),
		(102,'Stipe','Miochich','4400123200449695','87700234243','Shymkent'),
		(112,'Derrick','Lewis','','87077828283','Astana')


INSERT INTO Doctors(doctor_id,f_name,l_name,price)
VALUES	(10000,'Temirlan','Tokkozha',100000),
		(10423,'Dimash','Zakeriya',50000),
		(10552,'Zhasulan','Aset',90000),
		(11005,'Eskendir','Zharkynbek',100000),
		(12006,'Bayrzhan','Oryngaliev',65000),
		(11245,'Sunkar','Pahan',80000)

INSERT INTO nurses(nurse_id,f_name,l_name,doctor_id,price)
VALUES (1000,'Miras','Shyngysov',10000,1000000),
		(1012,'Erke','Ubisa',10423,1332000),
		(1123,'Adilhan','Pezdes',10552,999999),
		(1435,'Arman','Prezik',10000,500000),
		(1232,'Adil','Konzhyk',12006,1000000),
		(5324,'Adil','Doter',11005,860000),
		(1345,'Askar','ShymkentskiyZver',11245,777394),
		(1005,'Anuar','Bariga',12006,324234),
		(1112,'Tima','VoinDrakona',11005,1000000)
		
INSERT INTO diagnose(diagnose_name,price)
VALUES ('Cancer',12345235),
		('Stomachache',9022423),
		('Headache',7584549),
		('Gangrena',12345235),
		('Prosto_mal',4324235),
		('Bone_fracture',232323),
		('Cold',324324235),
		('Hot',666777666)

INSERT INTO patient_diagnose(patient_id,doctor_id,diagnose)
VALUES (132,11005,'Stomachache'),
		(132,10000,'Headache'),
		(122,10423,'Cancer'),
		(112,11005,'Bone_fracture'),
		(100,10423,'Stomachache'),
		(102,10552,'Cold'),
		(123,10000,'Stomachache'),
		(112,10552,'Gangrena'),
		(112,11245,'Prosto_mal'),
		(123,11245,'Cold'),
		(122,10000,'Cancer'),
		(100,12006,'Cancer'),
		(132,12006,'Bone_fracture')

INSERT INTO rooms(room_num,price,from_date,to_date,capacity)
VALUES (1,20000,'1999-11-13','2000-12-22',4),
		(2,40000,'2000-12-31','2013-12-22',4),
		(3,60000,'1900-01-13','2023-06-22',2),
		(4,25000,'1950-11-23','2020-09-21',1),
		(5,66000,'1923-04-22','2010-09-10',3),
		(6,53000,'2001-01-22','2010-10-22',5),
		(7,35000,'2005-05-17','2012-11-13',1)

INSERT INTO rooms_diagnose(room_num,diagnose_name)
VALUES  (5,'Cancer'),
		(1,'Cancer'),
		(1,'Bone_fracture'),
		(2,'Stomachache'),
		(5,'Gangrena'),
		(4,'Cancer')

INSERT INTO bill(patient_id,doctor_id,bill_time,receipt)
VALUES (123,10000,'1999-11-16',1000),
		(122,10000,'1995-10-17',2000),
		(102,10552,'1998-03-15',2222),
		(122,11005,'2000-01-29',3000),
		(123,11245,'1987-07-19',2000)

INSERT INTO calls(patient_id,phone_number,issue,call_time,receipt)
VALUES (123,'8701232323','corona','1999-11-16',1000),
		(102,'823232323','cancer','1999-11-16',2000),
		(102,'8772737232','tuberkulez','1998-03-15',2000),
		(122,'86523825323','nefig_delat','2005-05-17',1212),
		(112,'24348458347','prostata','1950-11-23',2000),
		(123,'82634732423','gemoroi','1900-01-13',9999)
		
INSERT INTO ambulance(ambulance_num,price)
VALUES (10,2000),
	   (13,1111),
	   (14,1212),
	   (12,6666),
	   (15,7777),
	   (99,9999)
	   
INSERT INTO ambulance_patients(ambulance_num,patient_id)
VALUES (10,123),
	   (13,123),
	   (13,122),
	   (15,122),
	   (99,123),
	   (12,102),
	   (99,112)