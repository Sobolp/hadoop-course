cd /etc/hue/conf

sudo vi hue.ini

/144

# Change Default port from 14000 to 9870
webhdfs_url = http://ip-172-31-9-218.eu-west-1.compute.internal:9870/webhdfs/v1

ctrl + c
wq:

go to web to hue create password

ps ax|grep hue

# kill this process
25775 ?        Sl     0:22 python2.7 /usr/lib/hue/build/env/bin/hue runcherrypyserver

sudo kill 11677

hdfs dfs -ls /

hdfs dfs -chmod 777 /user

hdfs dfs -ls /

Hue	http://ec2-46-137-26-60.eu-west-1.compute.amazonaws.com:8888/
admin/!QAz3edc

Resource Manager	http://ec2-46-137-26-60.eu-west-1.compute.amazonaws.com:8088/

HDFS Name Node	http://ec2-46-137-26-60.eu-west-1.compute.amazonaws.com:9870/
Spark History Server	http://ec2-46-137-26-60.eu-west-1.compute.amazonaws.com:18080/
Resource Manager	http://ec2-46-137-26-60.eu-west-1.compute.amazonaws.com:8088/
