SELECT 
  CASE 
    WHEN day_of_week = 1 THEN 'Sunday'
    WHEN day_of_week = 2 THEN 'Monday'
    WHEN day_of_week = 3 THEN 'Tuesday'
    WHEN day_of_week = 4 THEN 'Wednesday'
    WHEN day_of_week = 5 THEN 'Thursday'
    WHEN day_of_week = 6 THEN 'Friday'
    WHEN day_of_week = 7 THEN 'Saturday'
  END AS day_name,
  AVG(
    (SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(0)] AS INT64) * 60) + 
    (SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(1)] AS INT64)) + 
    (SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(2)] AS INT64) / 60)
  ) AS avg_ride_minutes
FROM `glass-arcana-475319-c4.bake_share_project.apriltrends2026`
GROUP BY day_of_week, day_name
ORDER BY day_of_week ASC
