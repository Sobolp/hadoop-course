CREATE SCHEMA schema_name;

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
        location '/user/vaopolskiy_avro/';

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


select month,
    year,
    ROW_NUMBER() OVER(PARTITION BY MONTH, YEAR ORDER BY minor_category) n
from vaopolski.london_crime_by_lsoa_csv;
ORDER BY MONTH, YEAR;


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



CREATE EXTERNAL TABLE vaopolski.london_crime_by_lsoa_parquet(
        lsoa_code string,
        borough string,
        major_category string,
        minor_category string,
        value int,
        year int,
        month int)
        ROW FORMAT DELIMITED
        FIELDS TERMINATED BY ','
        STORED AS PARQUET
        location '/user/vaopolskiy_parquet/';


insert overwrite table vaopolski.london_crime_by_lsoa_parquet
select * from vaopolski.london_crime_by_lsoa_csv;

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

writing   reading   querry   size
csv                   22.70     36.53    889.6 M
avro         48.72    35.76     48.96    912.4 M
parquet      45.50    6.94      21.05    71.7 M
orc          35.25	  8.83		29.11	 65.6 M


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






hdfs dfs -du -h -s /user/vaopolskiy/
hdfs dfs -du -h -s /user/vaopolskiy_parquet/
hdfs dfs -du -h -s /user/vaopolskiy_avro/


