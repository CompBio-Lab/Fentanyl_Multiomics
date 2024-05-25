#!/bin/bash

#SBATCH --job-name=atac_limma
#SBATCH --account=st-singha53-1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=512G
#SBATCH --time=48:00:00
#SBATCH --output=output.txt
#SBATCH --error=error.txt
#SBATCH --mail-user=rishikad@student.ubc.ca
#SBATCH --mail-type=ALL

##############################################################################################


# Change directory into the job dir
cd $SLURM_SUBMIT_DIR
 
# Load software environment
module load gcc
module load apptainer

# path to data 
DATA=/arc/project/st-singha53-1/rishikad/atac_limma/atac_limma.rds

# run r script 
apptainer exec --bind $DATA --home /scratch/st-singha53-1/rishikad/atac_limma /arc/project/st-singha53-1/rishikad/atac_limma/limma.sif Rscript atac_limma.R

