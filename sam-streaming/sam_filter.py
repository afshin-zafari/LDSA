#!/usr/bin/python
import sys
for line in sys.stdin:
    fields = line.split("\t")
    #print fields
    if int(fields[2])==20 and abs(int(fields[8])) >1000: 
       print line