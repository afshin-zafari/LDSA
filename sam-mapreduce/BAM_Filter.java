//package org.myorg;
import java.io.IOException;
import java.util.*;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.mapred.lib.*;
import org.apache.hadoop.util.*;

public class BAM_Filter{
    public static class Map extends MapReduceBase implements Mapper<LongWritable, Text, Text, IntWritable> {
        private final static IntWritable one = new IntWritable(1);
	    
        public void map(LongWritable key, Text value, OutputCollector<Text, IntWritable> output, Reporter reporter) throws IOException {
            String line = value.toString();
            String[] fields = line.split("\\s");
	    long AlignLen = Long.parseLong(fields[8],10);
	    if ( AlignLen>1000){
                output.collect(new Text(line), one);
            }
        }
    }
	
	
    public static void main(String[] args) throws Exception {
        JobConf conf = new JobConf(BAM_Filter.class);
        conf.setJobName("BAM_Filter");
	    
        conf.setOutputKeyClass(Text.class);
        conf.setOutputValueClass(IntWritable.class);
	    
        conf.setMapperClass(Map.class);
        conf.setReducerClass(IdentityReducer.class);
	    
        conf.setInputFormat(TextInputFormat.class);
        conf.setOutputFormat(TextOutputFormat.class);
	    
        FileInputFormat.setInputPaths(conf, new Path(args[0]));
        FileOutputFormat.setOutputPath(conf, new Path(args[1]));
	    
        JobClient.runJob(conf);
    }
}
