-- transforms 'previous_12_months_cleaned' data and creates a new table named 'previous_12_months_transformed'

CREATE TABLE 
    `argon-fx-421902.cyclistic_historical_data.previous_12_months_transformed` AS
SELECT 
    ride_id,
    rideable_type,
    started_at,

    -- adds additional columns that parse out the weekday, dates, times, and calculates the ride duration for each record
    FORMAT_TIMESTAMP('%A', started_at) AS started_day,
    FORMAT_TIMESTAMP('%m-%d-%Y', started_at) AS started_date,
    FORMAT_TIMESTAMP('%H:%M:%S', started_at) AS started_time,
    ended_at,
    FORMAT_TIMESTAMP('%A', ended_at) AS ended_day,
    FORMAT_TIMESTAMP('%m-%d-%Y', ended_at) AS ended_date,
    FORMAT_TIMESTAMP('%H:%M:%S', ended_at) AS ended_time,
    FORMAT('%02d:%02d:%02d',
           TIMESTAMP_DIFF(ended_at, started_at, HOUR),
           MOD(TIMESTAMP_DIFF(ended_at, started_at, MINUTE), 60),
           MOD(TIMESTAMP_DIFF(ended_at, started_at, SECOND), 60)) AS ride_duration,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,

    -- conditional formulas to catgorize rides with null start and/or end values
    CASE
        WHEN start_station_name IS NOT NULL AND end_station_name IS NOT NULL THEN 'complete trip'
        WHEN (start_station_name IS NOT NULL AND end_station_name IS NULL) OR (start_station_name IS NULL AND end_station_name IS NOT NULL) THEN 'incomplete trip'
        ELSE 'not logged'
    END AS locations_logged,

    -- uses the longitude and lattitude values to calculate the ride distances in km and miles
    ST_GEOGPOINT(start_lng, start_lat) AS start_location,
    ST_GEOGPOINT(end_lng, end_lat) AS end_location,
    ROUND(ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat))/ 1000, 2) AS distance_traveled_km,
    ROUND(ST_DISTANCE(ST_GEOGPOINT(start_lng, start_lat), ST_GEOGPOINT(end_lng, end_lat)) / 1609.344, 2) AS distance_traveled_miles,
    member_casual
FROM 
    `argon-fx-421902.cyclistic_historical_data.previous_12_months_cleaned`;