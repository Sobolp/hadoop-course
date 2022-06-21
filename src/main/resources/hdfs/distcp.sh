# source - https://www.kaggle.com/datasets/jboysen/london-crime

# check the source
aws s3 ls s3://spark-luxoft
aws s3 ls s3://eas-015-hadoop


# prepare the target
hdfs dfs -ls /

hdfs dfs -ls /user

hdfs dfs -mkdir /user/vopolskiy_csv

hdfs dfs -ls /user/vopolskiy_csv



# start the command
hadoop distcp -D dfs.replication=2 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy_csv


hadoop distcp s3://spark-luxoft/map_reduce/WordCount.jar /map_reduce/jar2

hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /map_reduce/input3


hadoop distcp s3://spark-luxoft/map_reduce/README.md /map_reduce/input

hadoop distcp -D dfs.blocksize=268435456 -update s3://spark-luxoft/london_crimes/london_crime_by_lsoa.csv /user/vopolskiy_csv


# check the result
hdfs fsck test/london_crime_by_lsoa.csv -files -blocks




