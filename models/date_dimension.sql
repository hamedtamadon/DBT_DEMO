with CTE as 
(
select to_timestamp(starttime) as STARTED_AT ,
DATE( to_timestamp(starttime)) as DATE_STARTED_AT,
HOUR( to_timestamp(starttime)) as HOUR_STARTED_AT,
case when DAYNAME(to_timestamp(starttime)) in ('Sat','Sun') 
        then 'WEEKEND' else 'BUISINESS_DAY' END as DAY_TYPE,
case when Month(to_timestamp(starttime)) in (12,1,2) then 'WINTER'
    when Month(to_timestamp(starttime)) in (3,4,5) then 'Spring'
    when Month(to_timestamp(starttime)) in (5,6,7) then 'Summer'
     else 'Autumn' end as STATION_OF_YEAR 
 from {{ source('demo', 'bike') }}
)
select * from CTE
