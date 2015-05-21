import pysam
f="/home/ubuntu/pysam/pysam/tests/pysam_data/ex2.bam"
ff="NA21144.chrom20.ILLUMINA.bwa.GIH.low_coverage.20130415.bam"
samfile = pysam.AlignmentFile(ff, "rb")
iter = samfile.fetch()
k=0
for x in iter:
    align=str(x).split('\t')
#    for i in range(10):       print 'a[',i,']',align[i]
    alen=align[8]
    chrom=align[2]    
    k+=1
    if k%1000==0:
	print '.',
    if k%10000==0:
       print k

    if int(chrom)==20 and int(alen)>1:
        print 'len',alen, 'chr',chrom
