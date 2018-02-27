--- create time window to all character

select b.* , a.datewindows
from (
select from_unixtime( unix_timestamp( current_date() - 3 ) +  (a.a + (10 * b.a) + (100 * c.a) ) * 300  )   AS datewindows 
from (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
cross join (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
) a ,
( select from_unixtime( unix_timestamp( substring( name,-14), "yyyyMMddhhmmss")  - pmod(  unix_timestamp( substring( name,-14), "yyyyMMddhhmmss"),300 ) ) as swdate 
,* from starwarsinbox ) b
where b.swdate = a.datewindows ;
;
