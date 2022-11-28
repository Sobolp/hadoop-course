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
  listStatus.filter(_.isDirectory).map(_.getPath)
    .foreach{ path =>
//      1 create new path in ods target folder if not exists
//      2 create new file in new folder if not exists or if file size reaches the limit
//      3 adding nested loop  & add filtering for .inprogress
//      4 in nested loop read and append all files from the path
//      close the resoures

      //
//      add logs
//      add config
//      add try catch
//      variab
    }

  val newFile = s"/user/vopolski/ods/part-0000.csv"
  val newPath = new Path(newFile)

  if (!hdfs.exists(newPath)) hdfs.createNewFile(newPath)

  val inputStream  = hdfs.open(new Path("/user/stage/date=2020-12-03/part-0000.csv"))
  val outputStream = hdfs.append(newPath)
  IOUtils.copyBytes(inputStream, outputStream, 4096, true)
  inputStream.close()
  outputStream.close()
}