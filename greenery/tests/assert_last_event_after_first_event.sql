SELECT *
FROM {{ ref('fact_sessions') }}
WHERE last_event < first_event 
/* checking if there are any instances where the last_event date is before the first_event date  which wouldn't make sense logically and indicate some sort of data issue */