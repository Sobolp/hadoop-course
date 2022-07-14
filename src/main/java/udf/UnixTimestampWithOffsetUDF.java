package udf;

import org.apache.hadoop.hive.ql.exec.Description;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.io.LongWritable;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;


@Description(name = "unix_timestamp_with_offset",
        value = "_FUNC_(dts, zoneId) - get epoch seconds with tz")

public class UnixTimestampWithOffsetUDF extends UDF {
    public LongWritable evaluate(String dts, String zoneId) {
        try{
            DateTimeFormatter dateTimeFormatter  = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").withZone(ZoneId.of(zoneId));
            LocalDateTime ldt = LocalDateTime.parse(dts, dateTimeFormatter);
            ZoneOffset offset = dateTimeFormatter.getZone().getRules().getOffset(ldt);
            long value = ldt.toEpochSecond(offset);

            TimeZone aDefault = TimeZone.getDefault();
            String defaultID = aDefault.getID();
            int offset1 = aDefault.getOffset(1000);

            DateTimeFormatter dateTimeFormatterNew = DateTimeFormatter
                    .ofPattern("yyyy-MM-dd HH:mm:ss")
                    .withZone(ZoneOffset.UTC);
            String finalResult = dateTimeFormatter.format(LocalDateTime.ofEpochSecond(value, 0, ZoneOffset.UTC));


            return new LongWritable (value);
        }
        catch (Exception e){
            return null;
        }
    }
    public static void main(String[] args) {
        UnixTimestampWithOffsetUDF t1 = new UnixTimestampWithOffsetUDF();
        t1.evaluate("2020-01-01 01:01:01", "UTC");
    }
}