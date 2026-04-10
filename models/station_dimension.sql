WITH bike AS (
    SELECT  DISTINCT start_statio_ID AS station_ID, start_station_name AS station_name, start_lat AS station_lat, start_lng AS station_lng
    FROM    {{ ref('stg_bike') }}
    WHERE   ride_id != 'bikeid'
    
)

SELECT *
FROM bike