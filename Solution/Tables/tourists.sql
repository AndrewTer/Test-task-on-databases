-- Table: public.tourists

-- DROP TABLE public.tourists;

CREATE TABLE public.tourists
(
    id integer NOT NULL DEFAULT nextval('tourists_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    surname character varying COLLATE pg_catalog."default",
    patronymic character varying COLLATE pg_catalog."default",
    passport_number character varying COLLATE pg_catalog."default",
    CONSTRAINT tourists_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.tourists
    OWNER to postgres;

COMMENT ON TABLE public.tourists
    IS 'Туристы';

COMMENT ON COLUMN public.tourists.id
    IS 'ID туриста';

COMMENT ON COLUMN public.tourists.name
    IS 'Имя туриста';

COMMENT ON COLUMN public.tourists.surname
    IS 'Фамилия туриста';

COMMENT ON COLUMN public.tourists.patronymic
    IS 'Отчество туриста';

COMMENT ON COLUMN public.tourists.passport_number
    IS 'Паспортные данные';
