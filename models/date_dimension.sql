with CTE as 
(
select to_timestamp(started_at) as STARTED_AT ,
DATE( to_timestamp(started_at)) as DATE_STARTED_AT,
HOUR( to_timestamp(started_at)) as HOUR_STARTED_AT,
    {{day_type('started_at')}}  as DAY_TYPE ,
     {{get_season('started_at')}} as staion_Of_year,
     {{function1('started_at')}} as pas_future
 from {{ source('demo', 'bike') }}
)
select * from CTE
