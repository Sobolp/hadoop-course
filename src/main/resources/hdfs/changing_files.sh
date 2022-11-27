hdfs dfs -ls /

hdfs dfs -mkdir vopolskiy

hdfs dfs -copyFromLocal batch1.txt /user/vopolski/target

hdfs dfs -ls /vopolskiy

hdfs dfs -cat vopolskiy/test.txt

hdfs dfs -appendToFile batch2.txt /user/vopolski/target/part-0000.txt

hdfs dfs -cat vopolskiy/test.txt

hdfs fs -copyFromLocal ~/hadoop/tested_file.txt /copied_file2.txt

hdfs dfs -truncate 54 /user/vopolski/target/part-0000.txt

