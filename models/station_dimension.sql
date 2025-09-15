with BIKE as 
(
    select 
    distinct
    start_statio_id,
    start_station_name,
    start_lat,
    start_lng
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10
)
select * from Bike
