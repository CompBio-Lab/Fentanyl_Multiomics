#!/bin/bash
#SBATCH --time=3:00:00                             # Request 3 hours of runtime
#SBATCH --account=st-singha53-1                    # Specify your allocation code
#SBATCH --job-name=cellranger-array                 # Specify the job name
#SBATCH --nodes=1                                  # Defines the number of nodes for each sub-job.
#SBATCH --ntasks-per-node=1                        # Defines tasks per node for each sub-job.
#SBATCH --mem=8G                                   # Request 8 GB of memory    
#SBATCH --output=array_%A_%a.out                   # Redirects standard output to unique files for each sub-job.
#SBATCH --error=array_%A_%a.err                    # Redirects standard error to unique files for each sub-job.
#SBATCH --mail-user=rishikad@student.ubc.ca        # Email address for job notifications
#SBATCH --mail-type=ALL                            # Receive email notifications for all job events
#SBATCH --array=0-3                               # Define the range of array indices

#The above is for each sub-job, 4 sub jobs with these resources 

##############################################################################################


module load apptainer

ALL_RATS=( "GEX-R15-AS-12162022" "GEX-R16-AS-12162022" "GEX-R3-AS-12162022" "GEX-R4-AS-12162022" )
RAT="${ALL_RATS[${SLURM_ARRAY_TASK_ID}]}"

DATA=/arc/project/st-singha53-1/datasets/fentanyl/scrnaseq

cd $SLURM_SUBMIT_DIR


apptainer run -B $DATA /project/st-singha53-1/rishikad/snrnaseq/snrnaseq.sif make align_count RAT=${RAT}