import org.apache.hadoop.conf._
import org.apache.hadoop.fs._
import org.apache.hadoop.conf._
import org.apache.hadoop.hdfs.DistributedFileSystem

import org.apache.hadoop.io.IOUtils


object HDFS extends App {
  val conf = new Configuration()
  val hdfs: FileSystem = FileSystem.get(conf)
  val fromPath = new Path("/user/stage/")
  val listOfFolders = hdfs.listStatus(fromPath)

  def mergeIntoOnePart(path: String): Unit = {
    val targetPath = path.replaceFirst("stage", "pbolotov/ods")
    //      println(targetPath)
    hdfs.mkdirs(new Path(targetPath))

    val target = new Path(s"$targetPath/part-0000.csv")
    if (!hdfs.exists(target)) hdfs.createNewFile(target)
    if (hdfs.getStatus(target).getCapacity > 0) {
      val fileOutputStream = hdfs.append(target)

      val listOfFiles: Array[FileStatus] = hdfs.listStatus(new Path(path))
      listOfFiles.
        map(_.getPath.toString).
        filter(_.endsWith(".csv")).
        foreach(sf => {
          println(sf)
          val fileInputStream = hdfs.open(new Path(sf))
          IOUtils.copyBytes(fileInputStream, fileOutputStream, 4096, false)
          fileInputStream.close()
        })
      println()
      fileOutputStream.close()
    }
  }

  listOfFolders.map(_.getPath.toString).map(mergeIntoOnePart);

}