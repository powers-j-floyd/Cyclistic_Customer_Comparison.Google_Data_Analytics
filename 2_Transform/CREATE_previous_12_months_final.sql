-- further transforms 'previous_12_months_transformed' data
    -- filters out rides where mileage is:
        -- null
        -- 0, 
        -- >= 75
            -- 75 miles in a day is considered significant and typically achieved by training cyclist athletes (according to chatGPT). Assuming this is not the demographic and only rides < 75 miles are included. 
-- creates a new table named 'previous_12_months_final'

CREATE TABLE 
    `argon-fx-421902.cyclistic_historical_data.previous_12_months_final` AS
SELECT 
    ride_id,
    member_casual,
    rideable_type,
    started_at,
    FORMAT_TIMESTAMP('%b', started_at) AS started_month,
    CASE 
        WHEN EXTRACT(MONTH FROM started_at) IN (3, 4, 5) THEN 'Spring'
        WHEN EXTRACT(MONTH FROM started_at) IN (6, 7, 8) THEN 'Summer'
        WHEN EXTRACT(MONTH FROM started_at) IN (9, 10, 11) THEN 'Fall'
        WHEN EXTRACT(MONTH FROM started_at) IN (12, 1, 2) THEN 'Winter'
        ELSE 'Unknown'  
    END AS season,
    started_day,
    started_date,
    started_time,
    EXTRACT(HOUR FROM started_at) AS started_hour_of_day,
    CASE
        WHEN started_day IN ('Saturday', 'Sunday') THEN 'weekend'
        ELSE 'weekday'
    END AS weekday_type,
    ended_at,
    FORMAT_TIMESTAMP('%b', ended_at) AS ended_month,
    ended_day,
    ended_date,
    ended_time,
    EXTRACT(HOUR FROM ended_at) AS ended_hour_of_day,
    ride_duration,

    -- Converts seconds to minutes and rounds to 2 decimal places
    ROUND(
        TIMESTAMP_DIFF(ended_at, started_at, SECOND) / 60.0,
        2
    ) AS ride_duration_minutes,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    locations_logged,
    start_location,
    end_location,
    ROUND(distance_traveled_miles, 2) AS distance_traveled_miles,
    ROUND(distance_traveled_km, 2) AS distance_traveled_km
FROM 
    `argon-fx-421902.cyclistic_historical_data.previous_12_months_transformed`
WHERE
    distance_traveled_miles IS NOT NULL
    AND distance_traveled_miles > 0
    AND distance_traveled_miles < 75;
