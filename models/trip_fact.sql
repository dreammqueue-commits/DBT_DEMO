WITH trips AS (
    SELECT  RIDE_ID, 
            RIDEABLE_TYPE, 
            DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE, 
            START_STATIO_ID AS START_STATION_ID, 
            END_STATION_ID,
            MEMBER_CSUAL AS MEMBER_CASUAL,
            TIMESTAMPDIFF(SECOND, STARTED_AT, ENDED_AT) AS TRIP_DURATION_SECONDS
    FROM    {{source('demo', 'bike')}}
    WHERE   ride_id != 'ride_id'
    LIMIT 10
)

SELECT *
FROM trips