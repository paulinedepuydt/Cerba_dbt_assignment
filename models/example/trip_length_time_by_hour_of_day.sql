
-- Use the `ref` function to select from other models
select cast(strftime('%H', pickup_datetime) as varchar) as hour_of_day,
       cast(round(avg(trip_miles),3) as real) as avg_trip_miles, cast(round(avg(trip_time_in_s)) as integer) as avg_trip_time_in_s
from {{ ref("trips_clean") }}
group by strftime('%H', pickup_datetime)
