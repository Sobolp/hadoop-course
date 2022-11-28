import org.apache.hadoop.conf._
import org.apache.hadoop.fs._
import org.apache.hadoop.conf._
import org.apache.hadoop.hdfs.DistributedFileSystem

import org.apache.hadoop.io.IOUtils


object HDFS extends App {
  val conf = new Configuration()
  val hdfs: FileSystem = FileSystem.get(conf)
  val fromPath = new Path("/")
  val listStatus = hdfs.listStatus(fromPath)
  listStatus.filter(_.isDirectory).map(_.getPath).foreach(println)

  val fileOutputStream = hdfs.create(new Path("/user/ods/date=2020-12-03/part-0000.csv"))
  val fileInputStream = hdfs.open(new Path("/user/stage/date=2020-12-03/part-0000.csv"))
  IOUtils.copyBytes(fileInputStream, fileOutputStream, 4096, true)

  fileOutputStream.close()
  fileInputStream.close()
}