
-- Use the `ref` function to select from other models
select PULocationID, cast(count(*) as integer) as number_of_trips
from {{ ref("trips_clean") }}
group by PULocationID
order by number_of_trips desc
limit 5
