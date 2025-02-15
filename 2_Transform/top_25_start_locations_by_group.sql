-- queries previous_12_months_final for the top 25 start locations for each customer type

WITH RankedStations AS (
  SELECT
    start_station_name,
    start_station_id,
    member_casual,
    ROUND(AVG(ST_Y(start_location)), 2) AS avg_latitude,
    ROUND(AVG(ST_X(start_location)), 2) AS avg_longitude,
    COUNT(*) AS total_count,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_count,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_count,
    ROW_NUMBER() OVER (
      PARTITION BY member_casual
      ORDER BY COUNT(*) DESC
    ) AS rank
  FROM
    `argon-fx-421902.cyclistic_historical_data.previous_12_months_final`
  WHERE
    start_station_name IS NOT NULL
  GROUP BY
    start_station_name,
    start_station_id,
    member_casual
)

SELECT
  start_station_name,
  start_station_id,
  member_casual,
  avg_latitude,
  avg_longitude,
  total_count,
  member_count,
  casual_count
FROM
  RankedStations
WHERE
  rank <= 25
ORDER BY
  member_casual, rank;