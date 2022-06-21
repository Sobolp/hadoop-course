#1. Check source in S3 storage

aws s3 ls s3://spark-luxoft

#2. Create and check the target folder

hdfs dfs -mkdir  /user/your_name
hdfs dfs -ls  /user/your_name/test

#3. Test the distributed copy tool to copy to target
hadoop distcp s3://eas-015-lux-train/source/crime.csv /user/curr_date=${cur_date_d1}

#4. Create shell file with directory creating and coping

#5. Upload hue

#6. Crete a pipeline with shell and parameters

#7. Create a coordinator

#8. Add oozie constant to coordinator

#9. Control you job with Hadoop yarn
