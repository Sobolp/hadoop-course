# S3 integration (without Java, here HUE, OOZIE, MapReduce, Spark, Hive)
1. Stage/Raw/Bronze data layer
   Create a Schedule which will execute every hour copying data from S3 to HDFS.
   Steps:
   1. Write a hdfs commands which will create a new dir curr_date=22-28-11 and upload data to this dir in parallel mode
   2. Create a sh files with commands and parameters and upload to HDFS 
   3. Create a HUE workflow  with this file, try to execute it
   4. Create a HUE schedule/coordinator

Hint 1: Use an example [S3-dictcp-HDSF.sh](src/main/resources/hue/S3-dictcp-HDSF.sh)
Hint 2: Use a video from chat HUEWorkflowCoordinator.mp4 and DistCpDemo.mp4

2. ODS/Silver data layer
3. DDS/Golden data layer



# Java Client API (only Java client API)
1. Merge files ()

    Given a source folders with a csv and in progress files
    ``` text
    > hdfs dfs -ls /user/stage
    Found 3 items
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-01
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-02
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-03
    ```
   
    Write Java/Scala/Python application, which will clean data from folder /user/stage and write its to folder /your_name/ods according the rules
   1. Structure of partition will be saved
   2. As a result there will be only one file, which contains all data from corresponding partition from /stage folder

    That is, if we have a folder /stage/date=2020-11-11 with files:

    ``` text
    part-0000.csv
    part-0001.csv
    ```
    
    Then  app should build one folder /ods/date=2020-11-11 with one file
    ``` text
    part-0000.csv
    ```
    which contains all data from files folder /stage/date=2020-11-11

   Constraints:
   Avoid to using spark, Hive, Map Reduce

   Hints
    - Use the file system API - [FileSystem API](https://hadoop.apache.org/docs/stable/api/org/apache/hadoop/fs/FileSystem.html)
    - CREATE TARGET FILE 
    `val fileOutputStream = hdfs.create(new Path("/user/ods/date=2020-12-03/part-0000.csv"))`
    - OPEN SOURCE FILE
    `val fileInputStream = hdfs.open(new Path("/user/stage/date=2020-12-03/part-0000.csv"))`
    - COPY DATA FROM SOURCE TO TARGET
    `IOUtils.copyBytes(fileInputStream, fileOutputStream, 4096, true)`
    `fileOutputStream.close()`
    `fileInputStream.close()`
   
2. Find duplicate files in HDFS 