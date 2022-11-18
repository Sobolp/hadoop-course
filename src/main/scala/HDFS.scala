import org.apache.hadoop.conf._
import org.apache.hadoop.fs._
import org.apache.hadoop.conf._
import org.apache.hadoop.hdfs.DistributedFileSystem

import org.apache.hadoop.io.IOUtils



object HDFS extends App {
  val conf             = new Configuration()
  val hdfs: FileSystem = FileSystem.get(conf)
  val fromPath = new Path("/")
  val listStatus = hdfs.listStatus(fromPath)
  listStatus.filter(_.isDirectory).map(_.getPath).foreach(println)

  val listFiles: RemoteIterator[LocatedFileStatus] = hdfs.listFiles(fromPath, true)


  while (listFiles.hasNext) { println(listFiles.next().getPath) }

  listStatus.toList

}