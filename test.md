1. Select right Map Reduce optimisation 
   1. Map
   2. Shuffle
   3. Combine
   4. Backpressure


2. What can help to sort large file stored in several nodes
   1. hash repartitioning 
   2. map partitioning
   3. range partitioning
   4. nothing, its impossible
   
3. What Hadoop will do to join two large dataset stored in several nodes
    1. hash repartitioning
    2. map partitioning
    3. compaction
    4. broadcast
   
4. Choose the right way to deduplicate rows in hive table employee by key with several columns in Hive
   1. filter rows by row_num (window function) value equals one 
   2. use Hive function drop_duplicate(employee, key1, key2, ...)
   3. nothing, its impossible
   4. using hints

5. Choose the right way to select all but one column from Hive table employee
   1. select `(col_21)?+.+` from employee;
   2. select * from employee without col_21;
   3. select `\without (col_21)\` * from
   4. select * from employee where col_21 != null;

6. What can help to read json string value in Hive 
   1. Serde
   2. Merge
   3. Hive function parse(value)
   4. UDF
   
7. Select wrong Hive Optimisation
   1. Adaptive Query Execution
   2. Bloom Filter
   3. TEZ - execution engine
   4. Partitioning
   
8. What will be with row which have null value in partition column
   1. Row will be in default partition
   2. Row will be deleted
   3. Row will be without partition folder
   4. Will be exception
   
9. What can help to solve small files problem in HDFS with Hive
   1. Config hive.merge.size.per.task = xxxxxx
   2. Selecting and Inserting to table 
   3. hdfs dfs -merge - command
   4. nothing
   
10. Select right way to write test for Hive script
    1. Hive runner + Unit testing
    2. Hive test query feasters 
    3. Test select option
    4. Its impossible

11. What can help to automatically generate scripts in Hive
    1. Template lib in Scala, Java
    2. Hive function generate
    3. Its impossible
    4. Hadoop tool generator

12. What can help to solve out of memory exception
    1. Avoid to use files without splitability
    2. Avoid to use memory
    3. Avoid to use old version of Hive

13. Select right way to optimise join
14. What is Z-ordering
15. What is advantages of using Delta Lake formats
16. Select the right way to work with avro formats
17. Select the right way to move job between que que
18. What Are The Additional Benefits Yarn optimisation?
19. What Are The Scheduling Policies Available In Yarn?
20. HDFS checking the corrupted blocks
21. Select right command to change file in HDFS
22. What the command truncate will do with HDFS
23. Select the right way to build acknowledgements in write path
24. What is the Journal Node
25. What is Federtion