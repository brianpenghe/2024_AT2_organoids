#!/bin/bash 

## make a population VCF file 
VCFDIR=/lustre/scratch127/cellgen/cellgeni/tickets/tic-2868/results/cellSNP-lite
for i in AT2_15934 AT2_16011 AT2_16392 AT2_16402
do
	cp $VCFDIR/$i.cellsnp.out/cellSNP.base.vcf.gz merge_vcf/$i.vcf.gz
done

cd merge_vcf

for i in *gz
do
	gzip -d $i & 
done 
wait 

for j in *vcf
do
	TAG=${j%%.vcf}
	awk -v v=$TAG '{gsub(/FORMAT\t.*/, "FORMAT\t"v); print}' $j > $TAG.renamed.vcf
done 
