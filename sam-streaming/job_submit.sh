#!/bin/bash
 hadoop jar /usr/local/hadoop/contrib/streaming/hadoop-*streaming*.jar \
-file sam_filter.py    -mapper sam_filter.py \
-reducer org.apache.hadoop.mapred.lib.IdentityReducer \
-input /samfiles2 -output out_sam_stream5