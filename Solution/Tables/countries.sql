-- Table: public.countries

-- DROP TABLE public.countries;

CREATE TABLE public.countries
(
    id integer NOT NULL DEFAULT nextval('countries_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    resort character varying COLLATE pg_catalog."default",
    CONSTRAINT countries_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.countries
    OWNER to postgres;

COMMENT ON TABLE public.countries
    IS 'Страны';

COMMENT ON COLUMN public.countries.id
    IS 'ID страны';

COMMENT ON COLUMN public.countries.name
    IS 'Название страны';

COMMENT ON COLUMN public.countries.resort
    IS 'Название курорта';
