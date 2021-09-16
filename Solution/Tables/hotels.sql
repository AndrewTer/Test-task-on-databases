-- Table: public.hotels

-- DROP TABLE public.hotels;

CREATE TABLE public.hotels
(
    id integer NOT NULL DEFAULT nextval('hotels_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    stars integer,
    nutrition integer,
    address character varying COLLATE pg_catalog."default",
    CONSTRAINT hotels_pkey PRIMARY KEY (id),
    CONSTRAINT hotels_nutrition_fkey FOREIGN KEY (nutrition)
        REFERENCES public.nutrition (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.hotels
    OWNER to postgres;

COMMENT ON TABLE public.hotels
    IS 'Отели';

COMMENT ON COLUMN public.hotels.name
    IS 'Название отеля';

COMMENT ON COLUMN public.hotels.stars
    IS 'Число звёзд';

COMMENT ON COLUMN public.hotels.nutrition
    IS 'Питание';

COMMENT ON COLUMN public.hotels.address
    IS 'Адрес';
