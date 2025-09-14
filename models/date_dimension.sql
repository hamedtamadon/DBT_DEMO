with CTE as 
(
select to_timestamp(starttime) as STARTED_AT ,
DATE( to_timestamp(starttime)) as DATE_STARTED_AT,
HOUR( to_timestamp(starttime)) as HOUR_STARTED_AT,
    {{day_type('starttime')}}  as DAY_TYPE ,
     {{get_season('starttime')}} as staion_Of_year,
     {{function1('starttime')}} as pas_future
 from {{ source('demo', 'bike') }}
)
select * from CTE
