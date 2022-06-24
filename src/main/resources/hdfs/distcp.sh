# source - https://www.kaggle.com/datasets/jboysen/london-crime

# check the source
aws s3 ls s3://spark-luxoft
aws s3 ls s3://eas-015-hadoop


# prepare the target
hdfs dfs -ls /

hdfs dfs -ls /user

hdfs dfs -mkdir /user/vopolskiy_csv

hdfs dfs -ls /user/vopolskiy_csv

hadoop distcp s3://hadoop-luxoft/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv /user/vopolski/raw/


# start the command
hadoop distcp -D dfs.replication=2 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy/input


hadoop distcp s3://spark-luxoft/map_reduce/WordCount.jar /map_reduce/jar2

hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /map_reduce/input3


hadoop distcp s3://spark-luxoft/map_reduce/README.md /map_reduce/input

hadoop distcp -D dfs.blocksize=268435456 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy_csv


URI - s3://hadoop-luxoft/taxi-source/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv

HDFS vs S3
- commnds

- appendToFile
- truncate size


S3 - external

RAM
HDFS
Local storage

block1 - i-0192a62bc63f92b9c 8GB -> code -> filter
block2 - i-0a7b8b28e6cf240df 8GB -> code ->
block3 - i-0a7b8b28e6cf240df


# check the result
hdfs fsck test/london_crime_by_lsoa.csv -files -blocks
hdfs fsck /user/vopolski/raw/curr_date=2021-6-23/4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv -files -blocks
hdfs fsck /user/vopolskiy/input/london_crime_by_lsoa.csv -files -blocks




