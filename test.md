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

13. Select right way to optimize join with multiple tables
    1. Change the order of join
    2. Use hints “optimize“ join
    3. Change set of the keys

14. What is Z-ordering in delta lake
    1. Technique to colocate related information in the same set of files
    2. Technique to coalesce small files into larger ones
    3. Type of JVM Garbage collector

15. What is advantages of using Delta Lake formats (choose several)
    1. Caching
    2. Time travel
    3. Merging datasets
    4. Row oriented
    5. Schema evolution
    6. Human readable

16. Select the right case to use avro formats
    1. Kafka messaging
    2. HDFS writing of result of batch query
    3. Work in Microsoft Excel
    4. Write programming code in Avro language

17. Select the right way to move job between que que in yarn
    1. yarn movetoqueue <app_id>
    2. yarn application -movetoqueue <app_id> -queue <queue_name>
    3. drag application to target que

18. What Are The Additional Benefits of using Yarn? (choose several)
    1. Good integration with Hadoop ecosystem
    2. Spark Dynamic Allocation Resources 
    3. Yarn provide the yarn distributed file system
    4. Yarn allows to doubled resources in a cluster

19. What Are The Scheduling Policies Available In Yarn?
    1. FIFO scheduler
    2. Capacity scheduler
    3. Exponential scheduler
    3. Fair scheduler

20. Choose the right way to check the corrupted blocks in HDFS
    1. hdfs fsck -locations -blocks -files
    2. hdfs dfs -locations -blocks -files
    3. ls -la 
    2. check fsck -files

21. Select right command to change file in HDFS
    1. append 
    2. compress
    3. truncate
    3. edit

22. What the command truncate will do with files in HDFS
    1. Cut the tail after the size which is a parameter
    2. Re distribute files into several partitions
    3. Compress file to max formats
    4. Add the data to file

23. Select the right way to change replication factor in write path
    1. hdfs fsck -change -RF 2 /user/hdfs/test
    2. hdfs dfs -setrep -R 2 /user/hdfs/test
    3. Its impossible to change replication factor 

24. What is the Journal Node 
    1. Special nodes with newspapers data
    2. Special node which receive changes from name node
    3. Special node which have configuration of name and data nodes

25. What is Federation (choose several)
    1. Concepts which allows to resolve NameNode single point of failure issue
    2. NameNode keeps track of each and every file and block in memory
    3. Has pair of namenodes active-stand by configuration

26. The analytics team at an e-commerce company uses Apache Hive on Amazon EMR. Several analysts have reported sub-par performance for the cluster during the morning peak load hours when 95% of the daily queries are executed by the analysts. The analytics team has also noted that HDFS's (Hadoop Distributed File System) usage never surpasses 10%.
which of the following solutions would you recommend to resolve these performance issues?
    1. Set up instance group configurations for core and task nodes. Leverage the CloudWatch YARNMemoryAvailablePercentage metric to configure automatic scaling policies to scale out/scale in the instance groups
    2. Set up instance group configurations for core and task nodes. Leverage the CloudWatch CapacityRemainingGB metric to configure automatic scaling policies to scale out/scale in the instance groups
    3. Set up instance fleet configurations for core and task nodes. Leverage the CloudWatch CapacityRemainingGB metric to configure automatic scaling policies to scale out/scale in the instance fleet
    4. Set up instance fleet configurations for core and task nodes. Leverage the CloudWatch YARNMemoryAvailablePercentage metric to configure automatic scaling policies to scale out/scale in the instance fleet 

27. A company uses two AWS accounts for accessing various AWS services. The analytics team has just configured an Amazon S3 bucket in AWS account A for writing data from the Amazon Redshift cluster provisioned in AWS account B. The team has noticed that the files created in the S3 bucket using UNLOAD command from the Redshift cluster are not accessible to the bucket owner user of the AWS account A that created the S3 bucket.
What could be the reason for this denial of permission for resources belonging to the same AWS account?
    1. When two different AWS accounts are accessing an 53 bucket, both the accounts need to share the bucket policies, explicitly defining the actions possible for each account. An erroneous policy can lead to such permission failures
    2. When objects are uploaded to an 53 bucket from a different AWS account, the 53 bucket owner will get implicit permissions to access these objects. It is an upload error that can be fixed by providing manual access from AWS console
    3. The owner of an 53 bucket has implicit access to all objects in his bucket. Permissions are set on objects after they are completely copied to the target location. Since the owner is unable to access the uploaded files, it is possible that the write operation is still in progress
    4. By default, an 53 object is owned by the AWS account that uploaded it. So the 53 bucket owner will not implicitly have access to the objects written by the Redshift cluster 

28. What is an object storage advantages (choose several)
    1. Use cases "cold" storage and backup
    2. Has a copy of data according with replication factor
    3. Stores all data as objects
    4. Has a name node for coordination
    5. Data acces via iSCSI
    
29. Which feature allows enables users to recover objects that are deleted or overwriteen by accident
    1. Versioning
    2. Bucket
    3. Uniform Resource Identifier
    4. RECYCLE
30. What is URI in S3
    1. Unique address of each resource data 
    2. Special tool for working with files
    3. Addres of client in amazon of S3 service
    
31. How many objects we will have in S3 storage and metadata memory need if the total size of objects will be 60 PB. 20% of small objects less than 1MB, 60% of medium objects 1 ~ 64 MB, 20% of large objects. Each object need 1KB memory size.
    1. 0.68 millions objects and 0.68 TB
    2. 0.99 billions objects and 0.99 TB
    3. 0.68 billion objects  and 0.68 TB
    4. 0.99 millions objects and 0.99 TB
32. What is a properties of object storages (choose several)
    1. Object immutability
    2. Key-value store
    3. Transactional processing
    4. Write once, read many times
33. What are not components of S3 object storage (choose several)
    1. Load balancer
    2. API service
    3. Name node
    4. Identity and access  management (IAM)
    5. Data Store
    6. Journal node
    7. Metadata store
34. Which information heartbeat message includes
    1. How many disk drives does the data nodes manage?
    2. Which model of CPU is installed on data node
    3. How much data is stored to CPU
    4. The samples of payload data
35. How to configure replication strategy in S3 
    1. Creating replication rule
    2. In the configs of Data Nodes
    3. When writing data to S3 in API
36. What is trade off between the consistency and latency in S3 replication (choose several)
    1. Best consistency highest latency
    2. Worst consistency lowest latency
    3. Best consistency lowest latency
    4. Worst consistency highest latency
37. Select the right way to solve problem with small objects
    1. Small objects are automatically stored in one big file
    2. Small objects are automatically deleted
    3. Small objects are automatically stored in 
38. Which info is needed to lookup object in one big file (choose several)
    1. start_offset *
    2. finish_offset
    3. object_size *
    4. object_type_of data
39. What will be the capacity of table with metadata of buckets for S3 if we have 1 million customers, each customers owns 10 buckets and meta for 1 buckets takes 1 KB
    1. 10 GB
    2. 10 TB
    3. 3 GB
40. What we can use to correctness verification object transfer in S3
    1. checksum
    2. filesize
    3. file name and file type
41. 

