#!/bin/sh

#$1:que_bin

resdir=`basename $1`
mkdir out_"$resdir"
for file in $1/* ;do
    out=`basename $file .fasta`
    prodigal -i $file -n -a ./out_"$resdir"/$out.faa
done
