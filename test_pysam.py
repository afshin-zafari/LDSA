#!/usr/bin/env python
import pysam,sys
f="file1.sam"
ff="NA21144.chrom20.ILLUMINA.bwa.GIH.low_coverage.20130415.bam"
samfile = pysam.AlignmentFile(ff, "rb")
outfile=pysam.AlignmentFile("out_test2.bam","wb",template=samfile)

iter = samfile.fetch()
k=0
for x in iter:
    #print x
    #print x.template_length
    #print "'",samfile.getrname(x.reference_id),"'"
    #k+=1
    #if k==2:sys.exit()
    if x.template_length>1000:
        if samfile.getrname(x.reference_id)=='20':
           print samfile.getrname(x.reference_id),x.template_length
           outfile.write(x)
outfile.close()