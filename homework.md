# S3 integration
1. Stage/Raw/Bronze data layer
2. ODS/Silver data layer
3. DDS/Golden data layer

# Java Client API
1. Find duplicate files

2. Merge files

    Given a source folders with a csv and in progress files
    ``` text
    > hdfs dfs -ls /user/stage
    Found 3 items
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-01
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-02
    drwxr-xr-x   - root supergroup          0 2020-12-12 00:35 /user/stage/date=2020-12-03
    ```
   
    Write Java/Scala/Python application, which will clean data from folder /stage and write its to folder /ods according the rules
   1. Structure of partition will be save
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
   Avoid to using spark and hive

   Hints
    Use the file system API - [FileSystem API](https://hadoop.apache.org/docs/stable/api/org/apache/hadoop/fs/FileSystem.html)