-- aggregates data from previous_12_months_final, suchs as: total_count (# rides), avg_duration (minutes), and avg_distance (miles) for various categories
  -- aggregate data used for analysis due to file size constraints in Tableau Public

SELECT 
  season,
  started_month,
  started_day,
  weekday_type,
  started_hour_of_day,
  CASE
    WHEN started_hour_of_day = 0 THEN '12 AM'
    WHEN started_hour_of_day < 12 THEN CONCAT(CAST(started_hour_of_day AS STRING), ' AM')
    WHEN started_hour_of_day = 12 THEN '12 PM'
    ELSE CONCAT(CAST(started_hour_of_day - 12 AS STRING), ' PM')
  END AS formatted_hour,
  member_casual,
  COUNT(*) AS total_count, 
  ROUND(AVG(ride_duration_minutes), 2) AS avg_duration,
  ROUND(AVG(distance_traveled_miles), 2) AS avg_distance  
FROM 
  `argon-fx-421902.cyclistic_historical_data.previous_12_months_final`
GROUP BY 
  season,
  started_month,
  started_day,
  weekday_type,
  started_hour_of_day,
  member_casual
ORDER BY 
  total_count DESC;