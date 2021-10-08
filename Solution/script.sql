DROP TABLE Summary;
DROP FUNCTION IF EXISTS get_all_from_summary();

CREATE TABLE IF NOT EXISTS Summary (
                           Tourist_ID integer
                           ,Tourist_FIO character varying
                           ,Tourist_passport_number character varying
                           ,Agency_name character varying
                           ,PRIMARY KEY (Tourist_ID));

INSERT INTO Summary
SELECT tourist.id                                                           -- ID туриста
       ,CONCAT(tourist.surname, ' ', tourist.name, ' ', tourist.patronymic) -- ФИО туриста
       ,tourist.passport_number                                             -- Номер паспорта
       ,agency.name                                                         -- Название турфирмы
FROM public.tourists                    tourist
     LEFT JOIN public.contracts         contract
            ON tourist.id = contract.tourist_id
     LEFT JOIN public.travel_agencies   agency
            ON contract.agency_id = agency.id
     LEFT JOIN public.tours             tour
            ON contract.tour_id = tour.id
     LEFT JOIN public.airplanes         airplane
            ON tour.airplane_id = airplane.id
     LEFT JOIN public.hotels            hotel
            ON tour.hotel_id = hotel.id
     LEFT JOIN public.nutrition         nutrition
            ON hotel.nutrition = nutrition.id
     LEFT JOIN public.countries         country
            ON tour.country_id = country.id
WHERE airplane.seats <= 150                                                   -- число мест в самолётах не больше 150
      AND tour.cost < (SELECT AVG(cost) FROM public.tours)                    -- цена за билеты ниже средней среди всех туров
      AND nutrition.id = 1                                                    -- питание - только завтраки
      AND (tour.departure_date > (current_date - INTERVAL '7 months')         -- даты отбытия или прибытия в течение последних 7 месяцев
           OR tour.date_of_arrival > (current_date - INTERVAL '7 months'))
      AND country.id IN (SELECT cotr.id                                       -- страна в топе 5 стран по посещаемости (по числу туристов)
                         FROM public.countries                   cotr
                              LEFT JOIN public.tours             tr
                                     ON cotr.id = tr.country_id
                              LEFT JOIN public.contracts         ctr
                                     ON tr.id = ctr.tour_id
                              LEFT JOIN public.tourists          trs
                                     ON ctr.tourist_id = trs.id
                         GROUP BY cotr.id, cotr.name
                         ORDER BY COUNT(tr.id)*COUNT(trs.id) DESC
                         LIMIT 5
                        )
GROUP BY tourist.id
         ,tourist.name
         ,tourist.surname
         ,tourist.patronymic
         ,tourist.passport_number
         ,agency.name;
	
CREATE OR REPLACE FUNCTION get_all_from_summary() 
RETURNS TABLE 
(
   Tourist_ID integer
   ,Tourist_FIO character varying
   ,Tourist_passport_number character varying
   ,Agency_name character varying
)
AS
$BODY$
BEGIN
   IF EXISTS (SELECT * FROM public.Summary)
      THEN RETURN QUERY EXECUTE 'SELECT * FROM public.Summary';
      ELSE RAISE NOTICE 'Temporary table is empty!';
   END IF;
END;
$BODY$
LANGUAGE plpgsql;

SELECT * FROM get_all_from_summary();