with TRIPS as 
(
    select 
    ride_id,
    rideable_type,
    date(to_timestamp(started_at)) as trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    member_csual as member_casual,
    timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) as TRIP_DURATION_SECOND,
    started_at,
        ended_at,
        start_station_name,
        end_station_name,
        start_lat,
        start_lng,
        end_lat,
        end_lng
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10
)
select * from trips
