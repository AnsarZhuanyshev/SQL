CREATE TABLE IF NOT EXISTS public."Ambulance"
(
    "Ambulance_num" integer NOT NULL,
    price integer NOT NULL,
    CONSTRAINT "Ambulance_pkey" PRIMARY KEY ("Ambulance_num")
);

CREATE TABLE IF NOT EXISTS public."Calls"
(
    call_num bigserial NOT NULL,
    patient_id integer NOT NULL,
    phone_number integer NOT NULL,
    issue character varying(128) COLLATE pg_catalog."default",
    "time" date,
    receipt integer,
    CONSTRAINT "Calls_pkey" PRIMARY KEY (call_num)
);

CREATE TABLE IF NOT EXISTS public."Diagnose"
(
    diagnose_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY (diagnose_name)
);

CREATE TABLE IF NOT EXISTS public."Doctors"
(
    doctor_id integer NOT NULL,
    f_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    l_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    price integer NOT NULL,
    CONSTRAINT "Doctors_pkey" PRIMARY KEY (doctor_id)
);

CREATE TABLE IF NOT EXISTS public."Nurses/Wardboys"
(
    "Nurse_id" integer NOT NULL,
    f_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    l_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    "Doctor_id" integer,
    price integer NOT NULL,
    CONSTRAINT "Nurses/Wardboys_pkey" PRIMARY KEY ("Nurse_id")
);

CREATE TABLE IF NOT EXISTS public."Patient_diagnose"
(
    "Patient_id" integer NOT NULL,
    "Doctor_id" integer NOT NULL,
    "Diagnose" character varying(128) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Patient_diagnose_pkey" PRIMARY KEY ("Patient_id", "Doctor_id")
);

CREATE TABLE IF NOT EXISTS public."Patients"
(
    "Patient_id" integer NOT NULL,
    f_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    l_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    card_no integer,
    phone_number integer NOT NULL,
    adress character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Patients_pkey" PRIMARY KEY ("Patient_id")
);

CREATE TABLE IF NOT EXISTS public."Ambulance_Patients"
(
    "Ambulance_num" integer NOT NULL,
    "Patient_id" integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.rooms
(
    room_num integer NOT NULL,
    price integer NOT NULL,
    from_date date,
    to_date date,
    capacity integer NOT NULL,
    diagnose character varying(128),
    PRIMARY KEY (room_num)
);

CREATE TABLE IF NOT EXISTS public."rooms_Diagnose"
(
    room_num integer NOT NULL,
    diagnose_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    PRIMARY KEY (room_num, diagnose_name)
);

CREATE TABLE IF NOT EXISTS public."Bill"
(
    "Bill_No" bigserial NOT NULL,
    patient_id integer,
    doctor_id integer,
    "time" date,
    receipt integer,
    PRIMARY KEY ("Bill_No")
);

ALTER TABLE IF EXISTS public."Calls"
    ADD CONSTRAINT "Calls_patient_id_fkey" FOREIGN KEY (patient_id)
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Nurses/Wardboys"
    ADD CONSTRAINT "Nurses/Wardboys_Doctor_id_fkey" FOREIGN KEY ("Doctor_id")
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD CONSTRAINT "Patient_diagnose_Doctor_id_fkey" FOREIGN KEY ("Doctor_id")
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD CONSTRAINT "Patient_diagnose_Patient_id_fkey" FOREIGN KEY ("Patient_id")
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD FOREIGN KEY ("Diagnose")
    REFERENCES public."Diagnose" (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Ambulance_Patients"
    ADD FOREIGN KEY ("Patient_id")
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Ambulance_Patients"
    ADD FOREIGN KEY ("Ambulance_num")
    REFERENCES public."Ambulance" ("Ambulance_num") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."rooms_Diagnose"
    ADD FOREIGN KEY (diagnose_name)
    REFERENCES public."Diagnose" (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."rooms_Diagnose"
    ADD FOREIGN KEY (room_num)
    REFERENCES public.rooms (room_num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Bill"
    ADD FOREIGN KEY (patient_id)
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Bill"
    ADD FOREIGN KEY (doctor_id)
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;