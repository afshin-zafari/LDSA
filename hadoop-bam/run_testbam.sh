
if [ -z $1 ] ;then 
    echo ""
    echo "Give a new directory in HDFS in command line."
    echo "Usage: $0 <out-dir>"
    echo ""
    exit
fi
export HADOOP_CLASSPATH=/home/ubuntu/pysam/pysam/afshin/hadoop-bam-7.0.0/hadoop-bam-7.0.0-jar-with-dependencies.jar:/usr/local/hadoop/lib/*.jar:/libjars/*
export CLASSPATH=$HADOOOP_CLASSPATH:$CLASSPATH
HBAM_JAR=/home/ubuntu/pysam/pysam/afshin/hadoop-bam-7.0.0/hadoop-bam-7.0.0-jar-with-dependencies.jar
HADOOP_PATH=/usr/local/hadoop/bin
LIBJAR="-libjars $HBAM_JAR"
LIBJAR=
OUT_DIR="$1"

hadoop jar TestBAM.jar TestBAM $LIBJAR /bamfiles/NA21144.chrom20.ILLUMINA.bwa.GIH.low_coverage.20130415.bam $OUT_DIR
rm -f part-r-00000
hadoop dfs -get $OUT_DIR/part-r-00000 ./${OUT_DIR}_result.bam

