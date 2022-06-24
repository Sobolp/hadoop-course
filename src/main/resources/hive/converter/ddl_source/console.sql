set hive.msck.repair.batch.size=1;
set hive.msck.path.validation=ignore;


create schema if not exist taxi_facts;

drop table if exists taxi_facts.taxi_facts;

CREATE EXTERNAL TABLE IF NOT EXISTS taxi_facts.taxi_facts (
    VendorID  int,
    tpep_pickup_datetime  string,
    tpep_dropoff_datetime string,
    passenger_count int,
    trip_distance double,
    RatecodeID int,
    store_and_fwd_flag string,
    PULocationID int,
    DOLocationID int,
    payment_type int,
    fare_amount double,
    extra double,
    mta_tax double,
    tip_amount double,
    tolls_amount double,
    improvement_surcharge double,
    total_amount double
)
PARTITIONED BY (curr_date string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/vopolski/raw/';

ALTER TABLE taxi_facts.taxi_facts SET TBLPROPERTIES ('skip.header.line.count'='1');

SHOW PARTITIONS taxi_facts.taxi_facts;

set hive.msck.repair.batch.size=1;
set hive.msck.path.validation=ignore;

msck repair table taxi_facts.taxi_facts;
analyze table taxi_facts.taxi_facts partition(curr_date) compute statistics noscan;

select count(*) from taxi_facts.taxi_facts;



-- ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'



DROP TABLE taxi_facts.taxi_facts_orc;
CREATE EXTERNAL TABLE IF NOT EXISTS taxi_facts.taxi_facts_orc (
    VendorID  int,
    tpep_pickup_datetime  string,
    tpep_dropoff_datetime string,
    passenger_count int,
    trip_distance double,
    RatecodeID int,
    store_and_fwd_flag string,
    PULocationID int,
    DOLocationID int,
    payment_type int,
    fare_amount double,
    extra double,
    mta_tax double,
    tip_amount double,
    tolls_amount double,
    improvement_surcharge double,
    total_amount double
)
-- PARTITIONED BY (cur_date string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/vopolski/cur_date=2022-06-14/';

select count(*) from  taxi_facts.taxi_facts_orc;


hdfs dfs -mkdir
hadoop distcp s3://eas-015-lux-train/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv /user/vopolski/date=2022-06-14
hadoop distcp s3://eas-015-lux-train/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv /user/vopolski/date=2022-07-14
hadoop distcp s3://eas-015-lux-train/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv /user/vopolski/date=2022-08-14
hadoop distcp s3://eas-015-lux-train/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv /user/vopolski/date=2022-09-14





s3://eas-015-lux-train/taxi-source/


CREATE SCHEMA IF NOT EXISTS taxi_facts;

DROP TABLE taxi_facts.taxi_facts_orc_2;
CREATE EXTERNAL TABLE IF NOT EXISTS taxi_facts.taxi_facts_orc_2 (
    VendorID  int,
    tpep_pickup_datetime  string,
    tpep_dropoff_datetime string,
    passenger_count int,
    trip_distance double,
    RatecodeID int,
    store_and_fwd_flag string,
    PULocationID int,
    DOLocationID int,
    payment_type int,
    fare_amount double,
    extra double,
    mta_tax double,
    tip_amount double,
    tolls_amount double,
    improvement_surcharge double,
    total_amount double
)
PARTITIONED BY (date string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/vopolski/';


msck repair table taxi_facts.taxi_facts_orc_2;
analyze table taxi_facts.taxi_facts_orc_2 partition(cur_date) compute statistics noscan;

select count(*) from taxi_facts.taxi_facts_orc_2;


INSERT INTO TABLE taxi_facts.taxi_facts_orc_2 PARTITION(cur_date='2022-06-14')
SELECT *
FROM taxi_facts.taxi_facts_orc;









LOCATION '/user/vopolski/test_target/';


DROP TABLE taxi_facts.taxi_facts_orc;
--Create external table and load the data
CREATE EXTERNAL TABLE IF NOT EXISTS taxi_facts.taxi_facts_orc (
    VendorID  int,
    tpep_pickup_datetime  string,
    tpep_dropoff_datetime string,
    passenger_count int,
    trip_distance double,
    RatecodeID int,
    store_and_fwd_flag string,
    PULocationID int,
    DOLocationID int,
    payment_type int,
    fare_amount double,
    extra double,
    mta_tax double,
    tip_amount double,
    tolls_amount double,
    improvement_surcharge double,
    total_amount double
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/vopolski/test_target/cur_date=2022-06-14/';



CREATE EXTERNAL TABLE vaopolski.london_crime_by_lsoa_csv(
        lsoa_code string,
        borough string,
        major_category string,
        minor_category string,
        value int,
        year int,
        month int)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        STORED AS TEXTFILE
        location '/user/vaopolskiy/';

