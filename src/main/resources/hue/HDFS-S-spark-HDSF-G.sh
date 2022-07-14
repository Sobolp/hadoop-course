main_class=$1
source_uri=$2
target_folder=$3

/usr/bin/spark-submit \
--master yarn \
--class $main_class \
--deploy-mode cluster \
--supervise \
s3://spark-luxoft/jar/amr-spark-application.jar $source_uri $target_folder
#s3://spark-luxoft/target_example/
