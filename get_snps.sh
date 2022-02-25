
#!/bin/sh

#$1:ref.fa $2:PE_R1.fq $3:PE_R2.fq

bbmap.sh ref=$1 in1=$2 in2=$3 out=output.sam nodisk
samtools sort -@ 12 -O BAM output.sam > sort.bam && samtools index -@ 12 sort.bam

callvariants.sh ploidy=1 in=sort.bam ref=$1 vcf=output.vcf
