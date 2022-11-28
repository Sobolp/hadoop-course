package hdfs;

import org.apache.hadoop.conf.*;
import org.apache.hadoop.fs.*;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.hdfs.DistributedFileSystem;

import org.apache.hadoop.io.IOUtils;

import java.io.IOException;
import java.util.Arrays;


public class HDFS {
    public static void main(String[] args) throws IOException {
        Configuration conf = new Configuration();
        FileSystem hdfs = FileSystem.get(conf);


        Path fromPath = new Path("/");

        FileStatus[] fileStatuses = hdfs.listStatus(fromPath);
        Arrays.stream(fileStatuses)
                .filter(FileStatus::isDirectory)
                .map(FileStatus::getPath)
                .forEach(System.out::println);

        FSDataOutputStream fileOutputStream = hdfs.create(new Path("/user/ods/date=2020-12-03/part-0000.csv"));
        FSDataInputStream fileInputStream = hdfs.open(new Path("/user/stage/date=2020-12-03/part-0000.csv"));
        IOUtils.copyBytes(fileInputStream, fileOutputStream, 4096, true);

        fileOutputStream.close();
        fileInputStream.close();


        System.out.println("Test");


    }
}
