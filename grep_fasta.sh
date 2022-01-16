#!/bin/sh
#$1:list.txt $2:input.fasta
seqkit grep -nrf $1 $2 > list.fasta
seqkit grep -nrvf $1 $2 > unlist.fasta
seqkit seq -n unlist.fasta > unlist.txt
