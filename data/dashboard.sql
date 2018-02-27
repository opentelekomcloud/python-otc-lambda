SELECT substr(name,1,length(name)-15) AS name,
       from_unixtime(unix_timestamp(substring(name,-14), 'yyyyMMddhhmmss') - pmod(unix_timestamp(substring(name,-14), 'yyyyMMddhhmmss'),300)) AS swdate,
       max(sugar) as sugar
FROM starwarsinbox
GROUP BY name,
         sugar
ORDER BY 2,
         1 DESC
;
SELECT name,
       CREDITCHANGES
FROM starwarsinbox
;


