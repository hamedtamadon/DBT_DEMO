with BIKE as 
(
    select 
    distinct
    start_station_id,
    start_station_name,
    start_station_latitude,
    start_station_longitude
    from {{ source('demo', 'bike') }}
    where bikeid != 'bikeid'
    limit 10
)
select * from Bike
