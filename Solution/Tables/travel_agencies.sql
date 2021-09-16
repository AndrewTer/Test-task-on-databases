-- Table: public.travel_agencies

-- DROP TABLE public.travel_agencies;

CREATE TABLE public.travel_agencies
(
    id integer NOT NULL DEFAULT nextval('travel_agencies_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    address character varying COLLATE pg_catalog."default",
    phone_number character varying COLLATE pg_catalog."default",
    CONSTRAINT travel_agencies_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.travel_agencies
    OWNER to postgres;

COMMENT ON TABLE public.travel_agencies
    IS 'Турфирмы';

COMMENT ON COLUMN public.travel_agencies.id
    IS 'ID турфирмы';

COMMENT ON COLUMN public.travel_agencies.name
    IS 'Название турфирмы';

COMMENT ON COLUMN public.travel_agencies.address
    IS 'Адрес офиса турфирмы';

COMMENT ON COLUMN public.travel_agencies.phone_number
    IS 'Номер телефона';
