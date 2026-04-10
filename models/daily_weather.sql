WITH daily_weather AS (
    SELECT  DATE(Time) AS Daily_Weather, Weather, Temp, Pressure, Humidity, Clouds
    FROM    {{ source('demo', 'weather') }}
),

daily_weather_agg AS (
    SELECT      Daily_Weather, Weather, ROUND(AVG(Temp), 2) AS Avg_Temp, ROUND(AVG(Pressure), 2) AS Avg_Pressure, ROUND(AVG(Humidity), 2) AS Avg_Humidity, ROUND(AVG(Clouds), 2) AS Avg_Clouds
    FROM        daily_weather
    GROUP BY    Daily_Weather, Weather
    QUALIFY     ROW_NUMBER() OVER (PARTITION BY Daily_Weather ORDER BY COUNT(Weather) DESC) = 1
)

SELECT 
* 
FROM daily_weather_agg
