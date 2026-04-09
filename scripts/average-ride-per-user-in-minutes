SELECT 
  member_casual, /* The rider type column */
  ROUND(
    AVG(
      (
        /* Convert H:MM:SS to total seconds first for precision */
        SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(0)] AS FLOAT64) * 3600 + 
        SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(1)] AS FLOAT64) * 60 + 
        SAFE_CAST(SPLIT(ride_length, ':')[SAFE_OFFSET(2)] AS FLOAT64)
      ) / 60 /* Divide by 60 to get average in MINUTES */
    ), 2
  ) AS avg_ride_minutes
FROM `glass-arcana-475319-c4.bake_share_project.apriltrends2026`
GROUP BY member_casual
