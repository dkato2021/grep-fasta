#!/bin/sh

#$1:que_bin(results of blast)

resdir=`basename $1`
mkdir "$resdir"_alignment
for file in $1/* ;do
    out=`basename $file .txt`
    sed '1,51d' $file > ./"$resdir"_alignment/"$out"_alignment.txt
done
