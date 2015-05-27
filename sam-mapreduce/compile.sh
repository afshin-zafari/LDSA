HOME=/home/ubuntu/pysam/pysam/afshin
HBAM_DEPS=$HOME/hadoop-bam-7.0.0/hadoop-bam-7.0.0-jar-with-dependencies.jar
HADOOP_DEPS=/usr/local/hadoop/hadoop-core-1.2.1.jar:/usr/local/hadoop/lib/commons-cli-1.2.jar:/usr/local/hadoop/lib/commons-logging-1.1.1.jar
ALL_DEPS=$HADOOP_DEPS:$HBAM_DEPS
TESTBAM_DIR=.

javac -cp $ALL_DEPS BAM_Filter.java
jar -cvf BAM_Filter.jar *.class


