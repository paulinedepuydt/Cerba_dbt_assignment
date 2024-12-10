
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below

{{ config(materialized='table') }}

*/

-- no cast as datetime bc datetime in sqlite stored as e.g. string of ISO 8601 date/time value, example '2025-05-29 14:16:00'
-- https://www.sqlite.org/lang_datefunc.html
select hvfhs_license_num, dispatching_base_num, originating_base_num,
       request_datetime, on_scene_datetime, pickup_datetime, dropoff_datetime,
       PULocationID, DOLocationID, trip_miles, trip_time as trip_time_in_s, base_passenger_fare, tolls, bcf, sales_tax, congestion_surcharge,
       airport_fee, tips, driver_pay, shared_request_flag, shared_match_flag, access_a_ride_flag, wav_request_flag, wav_match_flag
from fhvhv_tripdata
where base_passenger_fare >= 0 and driver_pay >= 0
