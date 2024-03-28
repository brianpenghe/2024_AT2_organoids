#! /bin/bash

## custom version for known_genotypes
TAG="SLX-24209"
SMPS="AT2_15934 AT2_16011 AT2_16392 AT2_16402"
K=4
CPUS=16

SIF="/nfs/cellgeni/singularity/images/souporcell_v2.5-python_3.10-vireo_v0.5.8-cellsnp-lite_1.2.3-nextflow-compatible.sif"
CMD="singularity exec --bind /nfs,/lustre $SIF"
REF="/nfs/cellgeni/STAR/human/2020A/GRCh38_v32_modified.fa" 
VCF="merged.vcf"
SOLODIR="/lustre/scratch127/cellgen/cellgeni/tickets/tic-2849/results/SLX-24209" 

echo "Processing version with known_genotypes, number of donors = $K, donor IDs = $SMPS ..",

$CMD souporcell_pipeline.py -i $SOLODIR/Aligned.sortedByCoord.out.bam -b $SOLODIR/barcodes.tsv -f $REF -k $K \
	--known_genotypes $VCF --known_genotypes_sample_names $SMPS -t $CPUS -o $TAG.souporcell.out --skip_remap True
