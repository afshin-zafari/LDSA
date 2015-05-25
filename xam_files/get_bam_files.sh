#!/bin/bash
source ~/g2015016-openrc.sh
swift list GenomeData | grep -v ".bai" | grep -v ".bas"> bam_files.list

Flist=$(head -n 5 bam_files.list)

cd bam_files

for f in $Flist
do 
    swift download GenomeData --prefix=${f:0:7}
done
for f in $Flist
do
    samtools view $f > ../sam_files/$f.sam
done

cd ..

hadoop dfs -rmr /bamfiles
hadoop dfs -mkdir /bamfiles
hadoop dfs -put ./bam_files/*.bam* /bamfiles

hadoop dfs -rmr /samfiles
hadoop dfs -mkdir /samfiles
hadoop dfs -put ./sam_files/*.sam* /samfiles
