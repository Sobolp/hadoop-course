# source - https://www.kaggle.com/datasets/jboysen/london-crime

# check the source
aws s3 ls s3://spark-luxoft


# prepare the target
hdfs dfs -ls /

hdfs dfs -ls /user

hdfs dfs -mkdir /user/vopolskiy_csv

hdfs dfs -ls /user/vopolskiy_csv



# start the command
hadoop distcp -D dfs.replication=2 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy_csv
hadoop distcp -D dfs.blocksize=268435456 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy_csv


# check the result
hdfs fsck test/london_crime_by_lsoa.csv -files -blocks




