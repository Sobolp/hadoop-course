FOLDER_NAME=$1
cur_date_d1=$2
cur_date_d2=$3

echo "CURR DATE D1"
echo $cur_date_d1

echo "CREATING NEW FOLDER"
hdfs dfs -mkdir  /user/curr_date=${cur_date_d1}


echo "DOWNLOADING DATA NEW FOLDER"
hadoop distcp s3://eas-015-lux-train/source/crime.csv /user/curr_date=${cur_date_d1}