#!/bin/sh
#$1:input.fasta $2:list.txt
seqkit grep -nrf $2 $1 > list.fasta
seqkit grep -nrvf $2 $1 > unlist.fasta
seqkit seq -n unlist.fasta > unlist.txt
