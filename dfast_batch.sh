#!/bin/sh

#$1:que_bin

resdir=`basename $1`
mkdir out
for file in $1/* ;do
    out=`basename $file .fna`
    #mkdir ./"$out"
    dfast -g $file -o ./out/"$out" --cpu 42 --force --use_prodigal
done
