#!/bin/bash

#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --mem=64gb
#SBATCH --account=st-singha53-1
#SBATCH --job-name=ref
#SBATCH --mail-user=rishikad@student.ubc.ca
#SBATCH --output=%x-%j.log

#############################################################################

module load apptainer 

DATA=/project/st-singha53-1/rishikad/snrnaseq/2_cellranger/ref

cd $SLURM_SUBMIT_DIR

apptainer run -B $DATA /arc/project/st-singha53-1/rishikad/snrnaseq/snrnaseq.sif make mkref
