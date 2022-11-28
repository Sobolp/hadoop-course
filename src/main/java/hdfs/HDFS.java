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

        String newFile = "/user/vopolski/ods/part-0000.csv";
        Path newPath = new Path(newFile);

        if (!hdfs.exists(newPath)) hdfs.createNewFile(newPath);

        FSDataInputStream inputStream = hdfs.open(new Path("/user/stage/date=2020-12-03/part-0000.csv"));
        FSDataOutputStream outputStream = hdfs.append(newPath);
        IOUtils.copyBytes(inputStream, outputStream, 4096, true);
        inputStream.close();
        outputStream.close();

    }
}
