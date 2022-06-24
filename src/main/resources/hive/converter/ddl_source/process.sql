set hive.msck.repair.batch.size=1;
set hive.msck.path.validation=ignore;

msck repair table ${source_db}.taxi_facts;
analyze table ${source_db}.taxi_facts partition(curr_date) compute statistics noscan;
