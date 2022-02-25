#!/bin/sh

#$1:fasta, $2:R1, $3:R2

bowtie2-build -f $1 PEtoREF &&
bowtie2 --end-to-end --very-sensitive --qc-filter -p 28 -x PEtoREF -1 $2 -2 $3 -S PEtoREF.sam &&
samtools view -@ 28 -bS PEtoREF.sam > PEtoREF.bam &&
samtools sort -@ 28 PEtoREF.bam > PEtoREF_sorted.bam &&
samtools index PEtoREF_sorted.bam &&
java -Xmx500G -jar ~/pilon-1.23.jar --genome $1 --frags PEtoREF_sorted.bam --outdir ./ --output out --mingap 0 --threads 8 &&

for i in `seq 13` ; do
    bowtie2-build -f ./out.fasta PEtoREF &&
    bowtie2 --end-to-end --very-sensitive --qc-filter -p 28 -x PEtoREF -1 $2 -2 $3 -S PEtoREF.sam &&
    samtools view -@ 28 -bS PEtoREF.sam > PEtoREF.bam &&
    samtools sort -@ 28 PEtoREF.bam > PEtoREF_sorted.bam &&
    samtools index PEtoREF_sorted.bam &&
    java -Xmx500G -jar ~/pilon-1.23.jar --genome ./out.fasta --frags PEtoREF_sorted.bam --outdir ./ --output out --mingap 0 --threads 8 
done

bowtie2-build -f ./out.fasta PEtoREF &&
bowtie2 --end-to-end --very-sensitive --qc-filter -p 28 -x PEtoREF -1 $2 -2 $3 -S PEtoREF.sam &&
samtools view -@ 28 -bS PEtoREF.sam > PEtoREF.bam &&
samtools sort -@ 28 PEtoREF.bam > PEtoREF_sorted.bam &&
samtools index PEtoREF_sorted.bam &&
java -Xmx500G -jar ~/pilon-1.23.jar --genome ./out.fasta --frags PEtoREF_sorted.bam --outdir ./ --output 15pilished_sequences --mingap 0  --changes --threads 8
rm ./PEtoREF*
