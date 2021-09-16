-- Table: public.nutrition

-- DROP TABLE public.nutrition;

CREATE TABLE public.nutrition
(
    id integer NOT NULL DEFAULT nextval('nutrition_id_seq'::regclass),
    kind character varying COLLATE pg_catalog."default",
    CONSTRAINT nutrition_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.nutrition
    OWNER to postgres;

COMMENT ON TABLE public.nutrition
    IS 'Питание';

COMMENT ON COLUMN public.nutrition.id
    IS 'ID питания';

COMMENT ON COLUMN public.nutrition.kind
    IS 'Вид питания';
