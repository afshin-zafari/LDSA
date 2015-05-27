#!/usr/bin/env python
import sys
for line in sys.stdin:
    fields = line.split("\t")
    if int(fields[2])==20 and abs(int(fields[8])) >1000: 
       print ' \t'+line.replace('\t',' ')