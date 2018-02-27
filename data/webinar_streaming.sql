select s.name,value, alerthealtbloodpresure,alerthealtbloodalcohol,alerthealtbloodsugar,rebelioncreditlimit from
   ( select name,metrics,value from starwarstemp ) s
left outer join
   ( select name,alerthealtbloodpresure,alerthealtbloodalcohol,alerthealtbloodsugar,rebelioncreditlimit from starwars05)  m  on
s.name = m.name
where
    ( (metrics ==  "healt-blood-pulse") and ( int(value) > int( alerthealtbloodpresure) ) ) or
   ( (metrics ==  "healt-blood-sugar") and ( int(value) > int( alerthealtbloodsugar) ) ) or
   ( (metrics ==  "healt-blood-alcohol") and ( int(value) > int( alerthealtbloodalcohol) ) ) or
   ( (metrics ==  "action-credit-limit") and ( int(value) > int( rebelioncreditlimit) ) )
;