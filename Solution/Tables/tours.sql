-- Table: public.tours

-- DROP TABLE public.tours;

CREATE TABLE public.tours
(
    id integer NOT NULL DEFAULT nextval('tours_id_seq'::regclass),
    name character varying COLLATE pg_catalog."default",
    country_id integer,
    hotel_id integer,
    airplane_id integer,
    cost numeric,
    departure_date timestamp without time zone,
    date_of_arrival timestamp without time zone,
    CONSTRAINT tours_pkey PRIMARY KEY (id),
    CONSTRAINT tours_airplane_id_fkey FOREIGN KEY (airplane_id)
        REFERENCES public.airplanes (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tours_country_id_fkey FOREIGN KEY (country_id)
        REFERENCES public.countries (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT tours_hotel_id_fkey FOREIGN KEY (hotel_id)
        REFERENCES public.hotels (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.tours
    OWNER to postgres;

COMMENT ON TABLE public.tours
    IS 'Туры';

COMMENT ON COLUMN public.tours.id
    IS 'ID тура';

COMMENT ON COLUMN public.tours.name
    IS 'Название тура';

COMMENT ON COLUMN public.tours.country_id
    IS 'ID страны';

COMMENT ON COLUMN public.tours.hotel_id
    IS 'ID отеля';

COMMENT ON COLUMN public.tours.airplane_id
    IS 'ID самолёта';

COMMENT ON COLUMN public.tours.cost
    IS 'Цена';

COMMENT ON COLUMN public.tours.departure_date
    IS 'Дата отбытия';

COMMENT ON COLUMN public.tours.date_of_arrival
    IS 'Дата прибытия';
