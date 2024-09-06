--SQL SENTENCES

--a. Average observed temperature for last week(Mon-Sun).

select avg(temperature::float) as average_tempertature from public.weather_information
where observation_timestamp::timestamp >=(date_trunc('week', now())- INTERVAL '7days')
and observation_timestamp::timestamp<=(date_trunc('week', now()) - INTERVAL '7 days') + INTERVAL '6 days' 


--b. Maximum wind speed change between two consecutive observations in the last 7 days.
WITH wind_speed_changes AS (
    SELECT 
        ABS(wind_speed::float - LAG(wind_speed::float) OVER (ORDER BY observation_timestamp::timestamp)) AS wind_speed_change
    FROM 
        public.weather_information
    WHERE 
        wind_speed IS NOT NULL 
        AND observation_timestamp::timestamp > current_date - interval '7 days'
)
SELECT 
    MAX(wind_speed_change) AS max_wind_speed_change
FROM 
    wind_speed_changes;