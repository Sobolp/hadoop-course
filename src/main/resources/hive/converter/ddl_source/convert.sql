insert overwrite table ${target_db}.taxi_facts_parquet
select * from ${source_db}.taxi_facts;
