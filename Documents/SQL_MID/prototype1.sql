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

CREATE TABLE IF NOT EXISTS public."Patients"
(
    "Patient_id" integer NOT NULL,
    f_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    l_name character varying(128) COLLATE pg_catalog."default" NOT NULL,
    card_no integer,
    phone_number integer NOT NULL,
    adress character varying NOT NULL,
    CONSTRAINT "Patients_pkey" PRIMARY KEY ("Patient_id")
);

CREATE TABLE IF NOT EXISTS public."Rooms"
(
    room_num integer NOT NULL,
    price integer NOT NULL,
    from_date date,
    to_date date,
    capacity integer NOT NULL,
    CONSTRAINT "Rooms_pkey" PRIMARY KEY (room_num)
);

CREATE TABLE IF NOT EXISTS public."Diagnose"
(
    diagnose_name character varying(128) NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY (diagnose_name)
);

CREATE TABLE IF NOT EXISTS public."Calls"
(
    call_num bigserial NOT NULL,
    patient_id integer NOT NULL,
    phone_number integer NOT NULL,
    issue character varying(128),
    PRIMARY KEY (call_num)
);

CREATE TABLE IF NOT EXISTS public."BILL"
(
    "Bill_No" bigserial NOT NULL,
    "Patient_id" integer NOT NULL,
    "Doctor_id" integer NOT NULL,
    "Nurse_id" integer,
    "Diagnose" character varying(128),
    "Room_No" integer,
    "ambulance_No" integer,
    "Total_price" integer NOT NULL,
    payment_type boolean NOT NULL,
    PRIMARY KEY ("Bill_No")
);

CREATE TABLE IF NOT EXISTS public."Patient_diagnose"
(
    "Patient_id" integer NOT NULL,
    "Doctor_id" integer NOT NULL,
    "Diagnose" character varying(128) NOT NULL,
    PRIMARY KEY ("Patient_id", "Doctor_id", "Diagnose")
);

CREATE TABLE IF NOT EXISTS public.payment_type
(
    "Type" boolean NOT NULL,
    "cash/card" character varying(128) NOT NULL,
    PRIMARY KEY ("Type")
);

CREATE TABLE IF NOT EXISTS public."Ambulance"
(
    "Ambulance_num" integer NOT NULL,
    price integer NOT NULL,
    PRIMARY KEY ("Ambulance_num")
);


ALTER TABLE IF EXISTS public."Nurses/Wardboys"
    ADD FOREIGN KEY ("Doctor_id")
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Calls"
    ADD FOREIGN KEY (patient_id)
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY ("Patient_id")
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY ("Doctor_id")
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY ("Nurse_id")
    REFERENCES public."Nurses/Wardboys" ("Nurse_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY ("Diagnose")
    REFERENCES public."Diagnose" (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY ("Room_No")
    REFERENCES public."Rooms" (room_num) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."BILL"
    ADD FOREIGN KEY (payment_type)
    REFERENCES public.payment_type ("Type") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD FOREIGN KEY ("Patient_id")
    REFERENCES public."Patients" ("Patient_id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD FOREIGN KEY ("Doctor_id")
    REFERENCES public."Doctors" (doctor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Patient_diagnose"
    ADD FOREIGN KEY ("Diagnose")
    REFERENCES public."Diagnose" (diagnose_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

;