#!/bin/bash

set -euo pipefail

IMAGE=/nfs/cellgeni/singularity/images/starsolo_2-7-10a-alpha-220818_samtools_1-15-1_seqtk-1-13_bbmap_38-97_RSEM-1-3-3.sif

WDIR=$1
OUTDIR=$2
SAMPLEFILE=$3

cd $OUTDIR #change into results directory before running starsolo

singularity exec -B /lustre,/nfs ${IMAGE} "${WDIR}/starsolo_10x_auto.sh" `head -$LSB_JOBINDEX $SAMPLEFILE | tail -1`
