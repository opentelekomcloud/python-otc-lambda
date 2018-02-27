-- SQL file for stars lambda analisation

-- # in hbase shell 
-- disable  'starwarsinbox'
-- drop 'starwarsinbox'
-- create 'starwarsinbox', ['healt', 'action']

drop table starwarsinbox;

CREATE TABLE starwarsinbox(
 name string, creditchanges string,pulse string, alcohol string,sugar string)
STORED BY
'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES (
"hbase.columns.mapping" =
"action:action-credit-limit,healt:healt-blood-pulse, healt:healt-blood-alcohol,healt:healt-blood-sugar");


select name,substring( name,-15)  creditchanges, pulse,alcohol,sugar  from  starwarsinbox;

select name,substring( name, 1,length( name)-15),  creditchanges, pulse,alcohol,sugar  from  starwarsinbox;

