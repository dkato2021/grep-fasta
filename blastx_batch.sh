#!/bin/sh

#$1:que_bin

resdir=`basename $1`
mkdir out_"$resdir"
for file in $1/* ;do
    tmp=`tail -n +2 $file`
    if [ ${#tmp} -ge $((1000)) ];then
        out=`basename $file .fasta`
        blastx -num_threads 32 -evalue 0.0001 -num_descriptions 20 -num_alignments 100 -db /home_ssd/local/db/blastdb.20200904/nr -query $file -out ./out_"$resdir"/$out.txt
    fi
done
