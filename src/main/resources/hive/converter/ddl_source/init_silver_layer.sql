create schema ${target_db};

drop table if exists ${target_db}.taxi_facts;

CREATE TABLE IF NOT EXISTS ${target_db}.taxi_facts (
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
STORED AS PARQUET;


create schema taxi_facts_silver;

CREATE TABLE IF NOT EXISTS taxi_facts_silver.taxi_facts_parquet (
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
    STORED AS PARQUET;
