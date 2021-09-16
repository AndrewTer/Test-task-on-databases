-- Table: public.airplanes

-- DROP TABLE public.airplanes;

CREATE TABLE public.airplanes
(
    id integer NOT NULL DEFAULT nextval('airplanes_id_seq'::regclass),
    "number" integer,
    seats integer,
    CONSTRAINT airplanes_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.airplanes
    OWNER to postgres;

COMMENT ON TABLE public.airplanes
    IS 'Самолёты';

COMMENT ON COLUMN public.airplanes.id
    IS 'ID самолёта';

COMMENT ON COLUMN public.airplanes."number"
    IS 'Номер самолёта';

COMMENT ON COLUMN public.airplanes.seats
    IS 'Число мест';
