CREATE SCHEMA vaopolski;

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
        location '/user/vopolskiy/input/';

select count(*) from vaopolski.london_crime_by_lsoa_csv;


with s as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_csv)
select
    month,
    year,
    min(n),
    max(n)
from s
group by month, year;




CREATE EXTERNAL TABLE vaopolski.london_crime_by_lsoa_avro(
        lsoa_code string,
        borough string,
        major_category string,
        minor_category string,
        value int,
        year int,
        month int)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        STORED AS AVRO
        location '/user/vopolskiy/avro/';



CREATE TABLE users_from_avro_schema
    STORED AS AVRO
    TBLPROPERTIES ('avro.schema.url'='hdfs:///user/tulinski/user.avsc');

-- user.avsc
{
  "namespace": "io.sqooba",
  "name": "user",
  "type": "record",
  "fields": [
    {"name": "id", "type": "int"},
    {"name": "name", "type": "string"}
  ]
}

insert overwrite table vaopolski.london_crime_by_lsoa_avro
select * from vaopolski.london_crime_by_lsoa_csv;


select count(*) from vaopolski.london_crime_by_lsoa_avro;

with s as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_avro)
select
    month,
    year,
    min(n),
    max(n)
from s
group by month, year;


            writing   reading   querry   size
csv                   15.402    25       889.6
avro         52.207   24.461    33.512   912.4
parquet      28.957   10.211    26.638   69.5
orc          26.675    9.958    56.011   84.5




CREATE EXTERNAL TABLE vaopolski.london_crime_by_lsoa_parquet(
    lsoa_code string,
    borough string,
    major_category string,
    minor_category string,
    value int,
    year int,
    month int)
STORED AS PARQUET
location '/user/vopolskiy/parquet/';


insert overwrite table vaopolski.london_crime_by_lsoa_parquet
select * from vaopolski.london_crime_by_lsoa_csv;


select count(*) from vaopolski.london_crime_by_lsoa_parquet;

with s as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_parquet)
select
    month,
    year,
    min(n),
    max(n)
from s
group by month, year;

with s as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_csv)
select
    month,
    year,
    min(n),
    max(n)
from s
group by month, year;



with z as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_csv)
select
    month,
    year,
    min(n),
    max(n)
from z
group by month, year;


with z as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_avro)
select
    month,
    year,
    min(n),
    max(n)
from z
group by month, year;




select count(*) from vaopolski.london_crime_by_lsoa_parquet;

select count(*) from london_crime_by_lsoa_avro;



with z as (select *,
                  ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
           from vaopolski.london_crime_by_lsoa_parquet)
select
    month,
    year,
    min(n),
    max(n)
from z
group by month, year;


CREATE EXTERNAL TABLE london_crime_by_lsoa_orc(
        lsoa_code string,
        borough string,
        major_category string,
        minor_category string,
        value int,
        year int,
        month int)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        STORED AS ORC
        location '/user/hadoop/test_orc/';


insert overwrite table london_crime_by_lsoa_orc
select * from london_crime_by_lsoa_csv;



drop 19-05-2022 - folder
20-05-2022 -
20-05-2022 -
21-05-2022 -




KAFKA - FOR READING
RAW LAYER - HDFS - PARTITIONED
SIVER LAYER - HDFS         DICTS ~ access by rest with change, speed reading -> POSTGRES

GOLDEN LAYER ~ ODS ~ access by rest, speed reading ~ VERTICA
DIAMOND LAYER ~ DDS ~ access by rest ~

PG -


hdfs dfs -du -h -s



hdfs dfs -du -h -s /user/vaopolskiy/
hdfs dfs -du -h -s /user/vaopolskiy_parquet/
hdfs dfs -du -h -s /user/vaopolskiy_avro/



hdfs dfs -ls -h /user/vkripakov/silver/
