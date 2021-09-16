-- Table: public.contracts

-- DROP TABLE public.contracts;

CREATE TABLE public.contracts
(
    id integer NOT NULL DEFAULT nextval('contracts_id_seq'::regclass),
    agency_id integer,
    tourist_id integer,
    tour_id integer,
    CONSTRAINT contracts_pkey PRIMARY KEY (id),
    CONSTRAINT contracts_agency_id_fkey FOREIGN KEY (agency_id)
        REFERENCES public.travel_agencies (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT contracts_tour_id_fkey FOREIGN KEY (tour_id)
        REFERENCES public.tours (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT contracts_tourist_id_fkey FOREIGN KEY (tourist_id)
        REFERENCES public.tourists (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.contracts
    OWNER to postgres;

COMMENT ON TABLE public.contracts
    IS 'Договоры';

COMMENT ON COLUMN public.contracts.id
    IS 'ID договора';

COMMENT ON COLUMN public.contracts.agency_id
    IS 'ID турфирмы';

COMMENT ON COLUMN public.contracts.tourist_id
    IS 'ID туриста';

COMMENT ON COLUMN public.contracts.tour_id
    IS 'ID тура';
