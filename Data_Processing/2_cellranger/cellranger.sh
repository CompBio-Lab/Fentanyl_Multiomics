#!/bin/bash
RAT=$1
DATA="/arc/project/st-singha53-1/rishikad/snrnaseq/fastq"
REF="/arc/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref"
FASTQ_DIR=${DATA}/${RAT}


cellranger count --id=${RAT} \
    --fastqs=${FASTQ_DIR} \
    --sample=${RAT} \
    --transcriptome=${REF}/Rattus_norvegicus_mRatBN7_2 \
    --chemistry "ARC-v1"







