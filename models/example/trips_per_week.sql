
-- Use the `ref` function to select from other models
select cast(concat(strftime('%Y', pickup_datetime), strftime('%W', pickup_datetime)) as varchar) as week,
       cast(count(*) as integer) as number_of_trips
from {{ ref("trips_clean") }}
group by strftime('%W', pickup_datetime)

