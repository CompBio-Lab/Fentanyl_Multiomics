#!/bin/bash

#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=12
#SBATCH --mem=64gb
#SBATCH --account=st-singha53-1
#SBATCH --job-name=fastqc
#SBATCH --mail-user=rishikad@student.ubc.ca
#SBATCH --output=%x-%j.log


#############################################################################

module load apptainer

DATA=/arc/project/st-singha53-1/datasets/fentanyl/scrnaseq

cd $SLURM_SUBMIT_DIR
echo $SLURM_SUBMIT_DIR
apptainer run -B $DATA /arc/project/st-singha53-1/rishikad/snrnaseq/snrnaseq.sif make sockeye_fastqc




