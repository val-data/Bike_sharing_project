SELECT 
  day_of_week,
  ROUND(
    MAX(
      /* Hours */
      SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(0)] AS FLOAT64) + 
      /* Minutes divided by 60 */
      (SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(1)] AS FLOAT64) / 60) + 
      /* Seconds divided by 3600 */
      (SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(2)] AS FLOAT64) / 3600)
    ), 2
  ) AS max_ride_hours
FROM `glass-arcana-475319-c4.bake_share_project.apriltrends2026`
GROUP BY day_of_week
ORDER BY day_of_week ASC
