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


  val tuples: Array[(String, String)] = Array(("a", "1"), ("b", "2"), ("c", "3"))
  val tuples1: Array[(String, Some[String])] = tuples.map(x => x._1 -> Some(x._1))
  val result: Map[String, Some[String]] = tuples1.toMap


}