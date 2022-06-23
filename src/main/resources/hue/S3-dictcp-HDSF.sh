source_file_name=$1
cur_date_d1=$2

echo "CURR DATE D1"
echo $cur_date_d1

echo "CREATING NEW FOLDER"
hdfs dfs -mkdir  /user/curr_date=${cur_date_d1}


echo "DOWNLOADING DATA NEW FOLDER"

#4c8617af-d268-46d0-bfe1-10f069ed7b9d-c000.csv

hadoop distcp s3://hadoop-luxoft/taxi-source/${source_file_name} /user/vopolski/raw/curr_date=${cur_date_d1}