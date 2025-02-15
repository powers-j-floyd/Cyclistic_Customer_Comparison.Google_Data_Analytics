-- standardizes times stamps, removes duplicates, and removes leading/trailing spaces.
-- creates table for cleanded data.

CREATE TABLE
  `argon-fx-421902.cyclistic_historical_data.previous_12_months_cleaned` AS
SELECT DISTINCT
  TRIM(ride_id) AS ride_id,
  TRIM(rideable_type) AS rideable_type,
  TIMESTAMP_TRUNC(started_at, SECOND) AS started_at,
  TIMESTAMP_TRUNC(ended_at, SECOND) AS ended_at,
  TRIM(start_station_name) AS start_station_name,
  TRIM(start_station_id) AS start_station_id,
  TRIM(end_station_name) AS end_station_name,
  TRIM(end_station_id) AS end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  TRIM(member_casual) AS member_casual
FROM
  `argon-fx-421902.cyclistic_historical_data.previous_12_months`;


