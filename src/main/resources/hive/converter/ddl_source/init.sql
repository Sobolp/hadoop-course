create schema ${source_db};

drop table if exists ${source_db}.taxi_facts;

CREATE EXTERNAL TABLE IF NOT EXISTS ${source_db}.taxi_facts (
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

ALTER TABLE ${source_db}.taxi_facts SET TBLPROPERTIES ('skip.header.line.count'='1');

SHOW PARTITIONS ${source_db}.taxi_facts;

set hive.msck.repair.batch.size=1;
set hive.msck.path.validation=ignore;

msck repair table ${source_db}.taxi_facts;
analyze table ${source_db}.taxi_facts partition(curr_date) compute statistics noscan;