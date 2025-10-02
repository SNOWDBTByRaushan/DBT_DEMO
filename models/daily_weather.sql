WITH daily_weather AS (
select 
date(time) as daily_weather,
weather,
temp,
humidity,
pressure,
clouds
from {{ source('demo', 'weather') }}
), daily_weather_agg AS(
 select
daily_weather,
weather,
round(avg(temp),2) as avg_temp,
round(avg(humidity),2) as avg_humidity,
round(avg(pressure),2) as avg_pressure,
round(avg(clouds),2) as avg_clouds
from daily_weather
group by daily_weather,weather
qualify row_number() over(partition by daily_weather order by count(weather) desc)=1  
)
Select 
*
from daily_weather_agg