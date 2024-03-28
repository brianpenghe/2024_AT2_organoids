#!/bin/bash

SIF="/nfs/cellgeni/singularity/images/souporcell_v2.5-python_3.10-vireo_v0.5.8-cellsnp-lite_1.2.3-nextflow-compatible.sif"
CMD="singularity run --bind /nfs,/lustre $SIF"


TAG=$1
OUTDIR=/lustre/scratch127/cellgen/cellgeni/tickets/tic-2868/results/Bulk
REF=/nfs/cellgeni/cellSNP/genome1K.phase3.SNP_AF5e2.renamed_chr_GRCh38.vcf.gz

echo "Processing sample $TAG.." 

$CMD cellsnp-lite -s $OUTDIR/$TAG/Aligned.sortedByCoord.out.bam -I $TAG -O $TAG.cellsnp.out -R $REF -p 8 --genotype --minMAF 0.1 --minCOUNT 20 --cellTAG None --UMItag None --gzip
