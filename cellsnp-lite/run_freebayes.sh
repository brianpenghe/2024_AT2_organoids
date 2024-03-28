#!/bin/bash 

## conda activate freebayes; version is 1.3.5

BAM=$1
TAG=${BAM%%.bam}
FA=/nfs/cellgeni/STAR/human/2020A/GRCh38_v32_modified.fa

freebayes-parallel <(fasta_generate_regions.py $FA.fai 110000) 32 -f $FA -iXu -C 2 -q 20 -n 3 -E 1 -m 30 --min-coverage 6 $BAM > $TAG.fb.vcf

bgzip $TAG.fb.vcf
tabix -p vcf $TAG.fb.vcf.gz
#freebayes -f $FA -iXu -C 2 -q 20 -n 3 -E 1 -m 30 --min-coverage 6 $BAM > $TAG.fb.vcf
