hdfs dfs -ls /

hdfs dfs -mkdir vopolskiy

hdfs dfs -copyFromLocal test.txt vopolskiy

hdfs dfs -ls /vopolskiy

hdfs dfs -cat vopolskiy/test.txt

hdfs dfs -appendToFile appended.txt vopolskiy/test.txt

hdfs dfs -cat vopolskiy/test.txt

