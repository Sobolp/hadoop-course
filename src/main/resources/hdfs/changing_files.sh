hdfs dfs -ls /

hdfs dfs -mkdir vopolskiy

hdfs dfs -copyFromLocal batch1.txt /user/raw

hdfs dfs -ls /vopolskiy

hdfs dfs -cat vopolskiy/test.txt

hdfs dfs -appendToFile batch2.txt vopolskiy/batch1.txt

hdfs dfs -cat vopolskiy/test.txt

hdfs fs -copyFromLocal ~/hadoop/tested_file.txt /copied_file2.txt

hdfs fs -truncate 54 /user/raw/batch1.txt

