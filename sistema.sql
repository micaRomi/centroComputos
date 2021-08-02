
CREATE SEQUENCE public.unitsg_unit_id_seq_1;

CREATE TABLE public.unitsG (
                unit_id INTEGER NOT NULL DEFAULT nextval('public.unitsg_unit_id_seq_1'),
                unit_name VARCHAR NOT NULL,
                unit_code VARCHAR NOT NULL,
                unit_state BOOLEAN NOT NULL,
                CONSTRAINT unitsg_pk PRIMARY KEY (unit_id)
);


ALTER SEQUENCE public.unitsg_unit_id_seq_1 OWNED BY public.unitsG.unit_id;

CREATE SEQUENCE public.systems_syst_id_seq_1;

CREATE TABLE public.systems (
                syst_id INTEGER NOT NULL DEFAULT nextval('public.systems_syst_id_seq_1'),
                syst_name VARCHAR NOT NULL,
                syst_state BOOLEAN NOT NULL,
                CONSTRAINT systems_pk PRIMARY KEY (syst_id)
);


ALTER SEQUENCE public.systems_syst_id_seq_1 OWNED BY public.systems.syst_id;

CREATE TABLE public.systems_unitG (
                syst_id INTEGER NOT NULL,
                unit_id INTEGER NOT NULL,
                sysUnit_state BOOLEAN NOT NULL,
                CONSTRAINT systems_unitg_pk PRIMARY KEY (syst_id, unit_id)
);


CREATE SEQUENCE public.states_stat_codigo_seq_1;

CREATE TABLE public.states (
                stat_id INTEGER NOT NULL DEFAULT nextval('public.states_stat_codigo_seq_1'),
                stat_name VARCHAR NOT NULL,
                CONSTRAINT states_pk PRIMARY KEY (stat_id)
);


ALTER SEQUENCE public.states_stat_codigo_seq_1 OWNED BY public.states.stat_id;

CREATE SEQUENCE public.type_people_tpeopl_id_seq;

CREATE TABLE public.type_people (
                tpeopl_id INTEGER NOT NULL DEFAULT nextval('public.type_people_tpeopl_id_seq'),
                tpeopl_name VARCHAR NOT NULL,
                CONSTRAINT type_people_pk PRIMARY KEY (tpeopl_id)
);


ALTER SEQUENCE public.type_people_tpeopl_id_seq OWNED BY public.type_people.tpeopl_id;

CREATE SEQUENCE public.peolple_peopl_id_seq;

CREATE TABLE public.peolple (
                peopl_id INTEGER NOT NULL DEFAULT nextval('public.peolple_peopl_id_seq'),
                peopl_name VARCHAR NOT NULL,
                peopl_lastName VARCHAR NOT NULL,
                peopl_dni VARCHAR NOT NULL,
                peopl_email VARCHAR NOT NULL,
                peopl_phone VARCHAR NOT NULL,
                CONSTRAINT peolple_pk PRIMARY KEY (peopl_id)
);


ALTER SEQUENCE public.peolple_peopl_id_seq OWNED BY public.peolple.peopl_id;

CREATE TABLE public.system_details (
                syst_id INTEGER NOT NULL,
                unit_id INTEGER NOT NULL,
                peopl_id INTEGER NOT NULL,
                detSyst_user VARCHAR NOT NULL,
                detSyst_password VARCHAR NOT NULL,
                detSyst_fechaAlta DATE,
                detSyst_fechaBaja DATE,
                detSyst_fechaPedido DATE NOT NULL,
                stat_id INTEGER NOT NULL,
                CONSTRAINT system_details_pk PRIMARY KEY (syst_id, unit_id, peopl_id)
);


CREATE TABLE public.people_details (
                tpeopl_id INTEGER NOT NULL,
                peopl_id INTEGER NOT NULL,
                detPeop_state BOOLEAN NOT NULL,
                CONSTRAINT people_details_pk PRIMARY KEY (tpeopl_id, peopl_id)
);


ALTER TABLE public.systems_unitG ADD CONSTRAINT unitsg_systems_unitg_fk
FOREIGN KEY (unit_id)
REFERENCES public.unitsG (unit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.systems_unitG ADD CONSTRAINT systems_systems_unitg_fk
FOREIGN KEY (syst_id)
REFERENCES public.systems (syst_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.system_details ADD CONSTRAINT systems_unitg_system_details_fk
FOREIGN KEY (syst_id, unit_id)
REFERENCES public.systems_unitG (syst_id, unit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.system_details ADD CONSTRAINT states_system_details_fk
FOREIGN KEY (stat_id)
REFERENCES public.states (stat_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.people_details ADD CONSTRAINT type_people_people_details_fk
FOREIGN KEY (tpeopl_id)
REFERENCES public.type_people (tpeopl_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.people_details ADD CONSTRAINT peolple_people_details_fk
FOREIGN KEY (peopl_id)
REFERENCES public.peolple (peopl_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.system_details ADD CONSTRAINT peolple_system_details_fk
FOREIGN KEY (peopl_id)
REFERENCES public.peolple (peopl_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
